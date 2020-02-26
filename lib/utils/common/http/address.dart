

class Address{
  static const String host = "http://192.168.1.111:8899/";
  static const String hostWeb = "https://github.com/";
  static const String graphicHost = 'https://ghchart.rshah.org/';
  static const String updateUrl = 'https://www.pgyer.com/guqa';

  static String getAllUser(){
    return "${host}user/showAllUser";
  }
}