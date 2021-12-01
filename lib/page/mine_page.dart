import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class MinePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MinePageState();
  }
}

class MinePageState extends State<MinePage> {
  late MineModule mineModule;
  late ScrollController _scrollcontroller;

  @override
  void initState() {
    super.initState();
    mineModule = MineModule();
    _scrollcontroller = ScrollController();
    _scrollcontroller.addListener(() {
      if (_scrollcontroller.offset > 100) {}
    });
  }

  @override
  void dispose() {
    _scrollcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget _Item(msg, desc, index) {
      return Container(
        child: Column(
          children: <Widget>[
            Text(
              msg,
              style: TextStyle(fontSize: 20, color: Colors.green),
            ),
            Text(
              desc,
              style: TextStyle(fontSize: 14, color: Colors.yellow),
            )
          ],
        ),
      );
    }

    Widget waiting = Column(
      children: <Widget>[
        Text('waiting'),
        Icon(Icons.cloud_download),
      ],
    );
    Widget active = Column(
      children: <Widget>[
        Text('active'),
        Icon(Icons.access_time),
      ],
    );
    Widget error = Column(
      children: <Widget>[
        Text('error'),
        Icon(Icons.error),
      ],
    );

    Widget done = Container(
      child: Container(
          child: NotificationListener<ScrollNotification>(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              floating: true,
              title: Text("appbar title"),
              expandedHeight: 150,
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) =>
                    _Item("item = ${index}", "desc = ${index}", index),
                childCount: 30,
              ),
            )
          ],
          controller: _scrollcontroller,
        ),
        onNotification: (scrollNotification) {
          if (scrollNotification is ScrollStartNotification) {
            //滚动开始
              Fluttertoast.showToast(msg: "start");
          } else if (scrollNotification is ScrollUpdateNotification) {
            //更新滚动位置
//            Fluttertoast.showToast(msg: "update");
          } else if (scrollNotification is ScrollEndNotification) {
            //滚动结束
            Fluttertoast.showToast(msg: "end");
          }
          return true;
        },
      )),
    );
    Widget none = Column(
      children: <Widget>[
        Text('none'),
        Icon(Icons.filter_none),
      ],
    );

    return ChangeNotifierProvider(
      create: (context) => mineModule,
      child: FutureBuilder(
        future: Future.delayed(Duration(seconds: 3), null),
        builder: (context, snap) {
          switch (snap.connectionState) {
            case ConnectionState.none:
              if (snap.hasError) {
                return error;
              }
              return none;
            case ConnectionState.active:
              return active;
            case ConnectionState.done:
              return done;
            default:
              return waiting;
          }
        },
      ),
    );
  }
}

class MineModule with ChangeNotifier {}
