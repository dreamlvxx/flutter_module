import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

//原生视图控制器
class NativeViewController {
  late MethodChannel _channel;
  //原生视图完成创建后，通过id生成唯一方法通道
  onCreate(int id) {
    _channel = MethodChannel('samples.chenhang/native_views_$id');
  }
  //调用原生视图方法，改变背景颜色
  Future<void> changeBackgroundColor() async {
    return _channel.invokeMethod('changeBackgroundColor');
  }
}

//原生视图Flutter侧封装，继承自StatefulWidget
class SampleView extends StatefulWidget {
  const SampleView({
    Key? key,
    required this.ccc,
  }) : super(key: key);

  //持有视图控制器
  final NativeViewController ccc;
  @override
  State<StatefulWidget> createState() => _SampleViewState();
}

class _SampleViewState extends State<SampleView> {
  //根据平台确定返回何种平台视图
  @override
  Widget build(BuildContext context) {
    if (defaultTargetPlatform == TargetPlatform.android) {
      return AndroidView(
        viewType: 'sampleView',
        //原生视图创建完成后，通过onPlatformViewCreated产生回调
        onPlatformViewCreated: _onPlatformViewCreated,
      );
    } else {
      return UiKitView(viewType: 'sampleView',
          //原生视图创建完成后，通过onPlatformViewCreated产生回调
          onPlatformViewCreated: _onPlatformViewCreated
      );
    }
  }
  //原生视图创建完成后，调用control的onCreate方法，传入view id
  _onPlatformViewCreated(int id) {
    if (widget.ccc == null) {
      return;
    }
    widget.ccc.onCreate(id);
  }
}