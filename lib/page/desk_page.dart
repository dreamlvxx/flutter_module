import 'dart:io';

import 'package:flutter_module_2/page/home_page.dart';
import 'package:flutter_module_2/page/mine_page.dart';
import 'package:flutter_module_2/page/page_state.dart';
import 'package:flutter_module_2/model/user.dart';
import 'package:flutter_module_2/utils/common/http/address.dart';
import 'package:flutter_module_2/utils/common/http/http_utils.dart';
import 'package:flutter_module_2/utils/common/http/result_data.dart';
import 'package:flutter_module_2/widget/tab_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:android_intent/android_intent.dart';

class DeskPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<DeskPage> {
  final GlobalKey<HomePageState> detalisKey = GlobalKey();
  final GlobalKey<CountWidgetState> countKey = GlobalKey();
  final GlobalKey<HomePageState> mineKey = GlobalKey();

  HomeModule homeModel = HomeModule();

  Future<ResultData> getUser() async {
    ResultData res = await httpManager
        .request(Address.getAllUser(), null, null, null, noTip: true);
    User info = User.fromJson(res.data);
    homeModel.user = info;
    debugPrint(info.infos[0].name);
    return res;
  }

  @override
  void initState() {
    super.initState();
    debugPrint("请求before");
//    getUser().then((res) {
//      debugPrint("请求完成");
//    });
    debugPrint("请求after");
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> tabs = [
      _renderTab(Icons.account_box, "首页"),
      _renderTab(Icons.account_box, "第二页"),
      _renderTab(Icons.search, "发现"),
      _renderTab(Icons.settings, "我的"),
    ];
    return ChangeNotifierProvider(
      create: (context) => homeModel,
      child:
//          Container(
//            child: Text("sadsad"),
//          )
        GSYTabBarWidget(
          type: TabType.bottom,
          tabItems: tabs,
          tabViews: <Widget>[
            HomePage(key: detalisKey),
            CountWidget(),
            MinePage(),
          ],
          indicatorColor: Colors.blue,
        ),

    );
  }
}

/// 不退出
Future<bool> _dialogExitApp(BuildContext context) async {
  ///如果是 android 回到桌面
  if (Platform.isAndroid) {
    AndroidIntent intent = AndroidIntent(
      action: 'android.intent.action.MAIN',
      category: "android.intent.category.HOME",
    );
    await intent.launch();
  }
  return Future.value(false);
}

_renderTab(icon, text) {
  return new Tab(
    child: Consumer<HomeModule>(builder: (context, module, _) {
      return new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Icon(icon, size: 16.0),
          Container(
            child: Center(
                child: new Text(
              text,
              style: TextStyle(color: Colors.black, fontSize: 20),
              textAlign: TextAlign.center,
            )),
            color: Colors.green,
            padding: EdgeInsets.only(top: 2.0),
            margin: EdgeInsets.only(bottom: 4.0),
          )
        ],
      );
    }),
  );
}

class HomeModule with ChangeNotifier {
  User _user;

  User get user => _user;

  set user(User value) {
    _user = value;
  }
}
