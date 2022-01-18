import 'dart:async';

import 'package:firebasedemo/utils/app_configs.dart';
import 'package:firebasedemo/utils/sentry_event.dart';
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
late SentryClient _sentry;
final appConfigs = AppConfiguration.instance;

Future<void> main() async {
  runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();

    // Always initialize appConfigs first
    await appConfigs.initialize();

    _sentry = SentryClient(SentryOptions(dsn: appConfigs.sentryDSN));

    // Handle Flutter Errors
    FlutterError.onError = (FlutterErrorDetails details) async {
      if (isDebugMode()) {
        // defaults to dump to console
        // FlutterError.dumpEr0rorToConsole(details);

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
