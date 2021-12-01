import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class CountWidget extends StatefulWidget {
  static String pageName = "CountWidget";
  String name;

  @override
  State<StatefulWidget> createState() {
    return CountWidgetState();
  }

  CountWidget({required this.name});
}

class CountWidgetState extends State<CountWidget> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ProviderModel())],
      child: Scaffold(
        appBar: AppBar(
          title: LayoutBuilder(
            builder: (context, _) {
              var counterNum = Provider.of<ProviderModel>(context);
              return Text("provider value = ${counterNum.count.toString()}");
            },
          ),
        ),
        body: Countpage(),
      ),
    );
  }
}

class Countpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderModel>(builder: (context, _counter, _) {
      return Column(
        children: <Widget>[
          Expanded(
              child: Center(
            child: Text(_counter.count.toString()),
          )),
          Center(
              child: FlatButton(
            onPressed: () {
              _counter.add();
            },
            color: Colors.blue,
            child: Text("plus"),
          ))
        ],
      );
    });
  }
}

class ProviderModel with ChangeNotifier {
  int _count = 0;
  int get count => _count;

  void add() {
    _count++;
    notifyListeners();
  }
}
