

import 'package:flutter/material.dart';
import 'package:flutter_module_2/page/news_list_page.dart';

class CommonRoute{

  static void gotoNews(context,String name){
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return NewPage(name);
    }));
  }


}