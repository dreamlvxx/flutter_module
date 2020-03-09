import 'dart:ui';

import 'package:flutter_module_2/page/desk_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_module_2/page/news_list_page.dart';
import 'package:flutter_module_2/route/CommonRoute.dart';

//入口函数  app启动入口
void main() => runApp(MyApp(window.defaultRouteName));

class MyApp extends StatelessWidget {
  String route;
  MyApp(this.route);

  @override
  Widget build(BuildContext context) {
    switch (route) {
      case "home":
        return MaterialApp(
          title: '大学堂',
          theme: ThemeData(
              primaryColor: Colors.greenAccent,
              iconTheme: IconThemeData(color: Colors.yellow),
              textTheme: TextTheme(body1: TextStyle(color: Colors.red))),
          home: DeskPage(),
        );
        break;

      default:
        return MaterialApp(
          title: '大学堂',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: Text("undefined router"),
        );
        break;
    }
  }
}
