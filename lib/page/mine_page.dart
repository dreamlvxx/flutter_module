
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MinePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return MinePageState();
  }
}

class MinePageState extends State<MinePage>{
  MineModule mineModule;

  @override
  Widget build(BuildContext context) {

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
    Widget done = Column(
      children: <Widget>[
        Text('done'),
        Icon(Icons.done),
      ],
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
        future: Future.delayed(Duration(seconds: 3),null),
        builder: (context,snap){
          switch(snap.connectionState){
            case ConnectionState.none:
              if(snap.hasError){
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

class MineModule with ChangeNotifier{

}