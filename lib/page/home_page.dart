import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_module_2/channel/mathod_channel.dart';
import 'package:flutter_module_2/route/CommonRoute.dart';
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
    return Container(
      child: ChangeNotifierProvider(
        create: (context) => InfoModel(),
        child: FirstPage(),
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
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(6.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.white,
            ),
            child: FadeInImage.assetNetwork(
                placeholder: 'assets/images/loading.gif',
                width: double.infinity,
                height: 150,
                fit: BoxFit.cover,
                image: 'http://i1.073img.com/160301/17598486_164003_1.jpg'),
            margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 4.0),
          ),
          Container(
            margin: EdgeInsets.all( 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    child: Text("招聘"),
                    margin: EdgeInsets.all(4.0),
                    decoration: BoxDecoration(
                        color: Colors.cyan,
                        borderRadius: BorderRadius.circular(10.0)),
                    height: 30.0,
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    child: Text("面试"),
                    margin: EdgeInsets.all(4.0),
                    decoration: BoxDecoration(
                        color: Colors.greenAccent,
                        borderRadius: BorderRadius.circular(10.0)),
                    height: 30.0,
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(4.0),
                    child: Text("交友"),
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10.0)),
                    height: 30.0,
                  ),
                )
              ],
              mainAxisSize: MainAxisSize.max,
            ),
          ),
          Stack(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(10.0),
                padding: EdgeInsets.all(10.0),
                alignment: Alignment.topRight,
                decoration: BoxDecoration(
                    color: Colors.lime,
                    borderRadius: BorderRadius.circular(8.0)),
                width: double.infinity,
                height: 100.0,
                child: Text(
                  "最新动态",
                  style: TextStyle(color: Color(0xffff00ff), fontSize: 24),
                ),
              ),
              Positioned(
                top: 50,
                left: 30,
                child: Text("通知"),
              )
            ],
          ),
          FloatingActionButton(
            heroTag: "ttt",
            onPressed: () {
              CommonRoute.gotoNews(context, "lvxx");
            },
            child: Text("查看更多新闻"),
          ),
          Container(
            height: 200,
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
              FlutterMethodChannel.getActivityResult();
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
