import 'dart:developer';

import 'package:flutter/foundation.dart';

import '../api/global_error.dart';

String errorlog(String function, dynamic error, [StackTrace? stack]) {
  log("error ${error.toString()}");
  final safeMessage = globalError(error);

  if (kDebugMode) {
    // Only in debug mode
    debugPrint('❌ [$function] $error');

    if (stack != null) {
      debugPrint(stack.toString());
    }
  } else {
    // Production: minimal log only
    debugPrint('❌ [$function] $safeMessage');
  }

  return safeMessage;
}
