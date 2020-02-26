import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ChangeNotifierProvider(
          create: (context) => InfoModel(),
          child: FirstPage(),
        ),
      ),
    );
  }
}

class FirstPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _FirstPageState();
  }
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<InfoModel>(
      builder: (context, model, _) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Expanded(
            child: Text("name1 = ${model._name}"),
          ),
          FloatingActionButton(
            onPressed: () {
              model.name2 = "name 2 变化了";
            },
            child: Text("click 1"),
          ),
          Container(
            height: 300,
            child: SecondPage(),
          )
        ],
      ),
    );
  }
}

class SecondPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SecondPageState();
  }
}



class _SecondPageState extends State<SecondPage> {

  static MethodChannel methodChannel = MethodChannel("sample.flutter.io/test");

  Future<void> _getActivityResult() async {
    String result;
    try {
      final level = await methodChannel.invokeMethod('getAcivityResult'); //通过getAcivityResult传递方法名称，类似于广播中的action
      result = 'getAcivityResult : $level ';
      debugPrint(
        """
        rsuccess 
        result
        ==
        $result
        """
      );
    } on PlatformException {
      result = 'Failed to get battery level.';
      debugPrint('''  
      get
      result 
      from
      android2flutter
      ''' + result);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Consumer<InfoModel>(
      builder: (context, model, _) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Expanded(
            child: Text("model name 2 = ${model._name2}"),
          ),
          FloatingActionButton(
            child: Text("click 2"),
            onPressed: () {
              model.name = "name 1  变化了";
              _getActivityResult();
            },
          )
        ],
      ),
    );
  }
}

class InfoModel with ChangeNotifier {
  int _count = 0;
  String _name;
  String _name2;

  String get name2 => _name2;

  set name2(String value) {
    add();
    _name2 = value + _count.toString();
    notifyListeners();
  }

  String get name => _name;

  set name(String value) {
    add();
    _name = value + _count.toString();
    notifyListeners();
  }

  void add() {
    _count++;
  }
}
