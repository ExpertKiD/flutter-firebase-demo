import 'dart:async';

import 'package:firebasedemo/utils/sesntry_event.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'apps/app.dart';

bool isDebugMode() {
  bool isInDebugMode = !kReleaseMode;
  assert(isInDebugMode == true);
  return isInDebugMode;
}

final logger = Logger();
final _sentry = SentryClient(SentryOptions(
    dsn:
        'https://a27d08e9edf5482c89aa076073be65b7@o1087080.ingest.sentry.io/6104827'));

void main() {
  runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();

    // Handle Flutter Errors
    FlutterError.onError = (FlutterErrorDetails details) async {
      if (isDebugMode()) {
        // defaults to dump to console
        // FlutterError.dumpErrorToConsole(details);

        //or, use logger to dump pretty
        logger.e(details.toString(), details.exception, details.stack);
      } else {
        logger.d('Sending error details to Zone');
        FlutterError.dumpErrorToConsole(details);

        if (details.stack != null) {
          logger.e('Production error: ' + details.toString(), details.exception,
              details.stack);
          Zone.current.handleUncaughtError(details.exception, details.stack!);
        }
      }
    };

    // run the app
    runApp(const FirebaseDemoApp());
  }, (error, stack) async {
    if (isDebugMode()) {
      logger.e("Caught Dart Error!", error, stack);
    } else {
      logger.d("Time to report to error tracking system in production");
      final SentryEvent event = await getSentryEnvEvent(error);

      _sentry.captureEvent(event, stackTrace: stack);
    }
  });
}
