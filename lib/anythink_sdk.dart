
import 'dart:async';

import 'package:flutter/services.dart';

final ATFlutterChannel = AnythinkSdk();

class AnythinkSdk {
  static const MethodChannel channel =
      const MethodChannel('anythink_sdk');

  static Future<String?> get platformVersion async {
    final String? version = await channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
