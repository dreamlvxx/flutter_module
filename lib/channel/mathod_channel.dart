

import 'package:flutter/services.dart';

class FlutterMethodChannel{
  static const  String channel_name = "com.method.getresult";

  static const MethodChannel method = MethodChannel(channel_name);

  static Future<void> _getActivityResult() async {
    String result;
    try {
      final int level = await method.invokeMethod('getAcivityResult'); //通过getAcivityResult传递方法名称，类似于广播中的action
      result = 'getAcivityResult : $level ';
    } on PlatformException {
      result = 'Failed to get battery level.';
    }
  }


}