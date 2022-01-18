import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import 'apps/app.dart';

bool isDebugMode() {
  bool isInDebugMode = !kReleaseMode;
  assert(isInDebugMode == true);
  return isInDebugMode;
}

final _logger = Logger();

void main() {
  runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();

    // Handle Flutter Errors
    FlutterError.onError = (FlutterErrorDetails details) async {
      if (isDebugMode()) {
        // defaults to dump to console
        FlutterError.dumpErrorToConsole(details);

        //or, use logger to dump pretty
        _logger.e(details.toString(), details.exception, details.stack);
      } else {
        _logger.d('Sending error details to Zone');
        FlutterError.dumpErrorToConsole(details);

        if (details.stack != null) {
          _logger.e('Production error: ' + details.toString(),
              details.exception, details.stack);
          Zone.current.handleUncaughtError(details.exception, details.stack!);
        }
      }
    };

    runApp(const FirebaseDemoApp());
  }, (error, stack) async {
    if (isDebugMode()) {
      _logger.e("Caught Dart Error!", error, stack);
    } else {
      _logger.d("Time to report to error tracking system in production");
    }
  });
}
