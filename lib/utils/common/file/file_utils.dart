
import 'dart:io';

import 'package:path_provider/path_provider.dart';

class FileUtils{


  Future<File> _localFile(String createPath) async{
    final Directory dir = await getApplicationDocumentsDirectory();
    final String path = dir.path;
    return File("$path/$createPath");
  }

  Future write2File(String path,String content) async{
    File file = File(path);
    file.writeAsString(content);
  }

  Future<String> readFromFile(String path) async{
    try{
      File file = File(path);
      String content = await file.readAsString();
      return content;
    }catch (e){
      return "";
    }

  }

}