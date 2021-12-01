import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_module_2/model/user.dart';
import 'package:provider/provider.dart';

class NewPage extends StatefulWidget {
  String pageName;

  NewPage(this.pageName);

  @override
  State<StatefulWidget> createState() {
    return _NewPageState();
  }
}

class _NewPageState extends State<NewPage> {
  NewsProvider provider = NewsProvider();

  Future<Response> getUser() async {
    Response response;
    response = await Dio().get("http://192.168.1.103:8899/user/showAllUser");
    debugPrint(response.data.toString());
    User user = User.fromJson(response.data);
    provider.infos = user.infos;
    return response;
  }

  @override
  void initState() {
    super.initState();
    getUser();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => provider)],
      child: Scaffold(
          appBar: AppBar(
            title: Text("最新新闻"),
          ),
          body: Consumer<NewsProvider>(builder: (context, model, _) {
            return Container(
                color: Colors.white,
                child: Expanded(
                  child: ListView.separated(
                    itemBuilder: (context, index) => _ItemCreator(
                        "itemName = ${model.infos?[index]?.name}"),
                    itemCount: model.infos?.length ?? 0 ,
                    separatorBuilder: (context, index) => Divider(
                      color: Colors.green,
                      height: 2,
                    ),
                  ),
                ));
          })),
    );
  }

  Widget _ItemCreator(String msg) {
    return Container(
      child: Column(
        children: <Widget>[
          Text(
            msg,
            style: TextStyle(color: Colors.black, fontSize: 15),
          ),
          Icon(Icons.ac_unit)
        ],
      ),
    );
  }
}

class NewsProvider extends ChangeNotifier {
  List<Infos?>? _infos = [];

  List<Infos?>? get infos => _infos;

  set infos(List<Infos?>? value) {
    _infos = value;
    notifyListeners();
  }
}
