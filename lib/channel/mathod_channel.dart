

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_module_2/channel/channel_name.dart';

class FlutterMethodChannel{

  static const MethodChannel method = MethodChannel(ChannelName.channel_name);

  static Future<void> getActivityResult() async {
    String result;
    try {
      final String level = await method.invokeMethod('getResult'); //通过getAcivityResult传递方法名称，类似于广播中的action
      result = 'getAcivityResult : $level ';
      debugPrint("result = ${result}");
    } on PlatformException {
      result = 'Failed to get battery level.';
      debugPrint("result = ${result}");
    }
  }


}