import 'package:flutter/foundation.dart';

logDebug({String? tag, dynamic message}) {
  if (kDebugMode) {
    print("$tag,$message");
  }
}

logMessage(dynamic message) {
  if (kDebugMode) {
    print("$message");
  }
}

