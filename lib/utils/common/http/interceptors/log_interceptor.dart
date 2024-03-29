import 'dart:convert';
import 'package:flutter_module_2/utils/common/config/config.dart';
import 'package:dio/dio.dart';

/**
 * Log 拦截器
 * Created by guoshuyu
 * on 2019/3/23.
 */
class LogsInterceptors extends InterceptorsWrapper {
  static List<Map> sHttpResponses = <Map>[];
  static List<String> sResponsesHttpUrl = <String>[];

  static List<Map<String, dynamic>> sHttpRequest =
      <Map<String, dynamic>>[];
  static List<String> sRequestHttpUrl = <String>[];

  static List<Map<String, dynamic>> sHttpError =
      <Map<String, dynamic>>[];
  static List<String> sHttpErrorUrl = <String>[];

  // @override
  // onRequest(RequestOptions options) async {
  //   if (Config.DEBUG) {
  //     print("请求url：${options.path}");
  //     print('请求头: ' + options.headers.toString());
  //     if (options.data != null) {
  //       print('请求参数: ' + options.data.toString());
  //     }
  //   }
  //   try {
  //     addLogic(sRequestHttpUrl, options.path ?? "");
  //     var data = options.data ?? Map<String, dynamic>();
  //     var map = {
  //       "header:": {options.headers},
  //     };
  //     if (options.method == "POST") {
  //       map["data"] = data;
  //     }
  //     addLogic(sHttpRequest, map);
  //   } catch (e) {
  //     print(e);
  //   }
  //   return options;
  // }
  //
  // @override
  // onResponse(Response response) async {
  //   if (Config.DEBUG) {
  //     if (response != null) {
  //       print('返回参数: ' + response.toString());
  //     }
  //   }
  //   if (response.data is Map || response.data is List) {
  //     try {
  //       var data = Map<String, dynamic>();
  //       data["data"] = response.data;
  //       addLogic(sResponsesHttpUrl, response?.request?.uri?.toString() ?? "");
  //       addLogic(sHttpResponses, data);
  //     } catch (e) {
  //       print(e);
  //     }
  //   } else if (response.data is String) {
  //     try {
  //       var data = Map<String, dynamic>();
  //       data["data"] = response.data;
  //       addLogic(sResponsesHttpUrl, response?.request?.uri.toString() ?? "");
  //       addLogic(sHttpResponses, data);
  //     } catch (e) {
  //       print(e);
  //     }
  //   } else if (response.data != null) {
  //     try {
  //       String data = response.data.toJson();
  //       addLogic(sResponsesHttpUrl, response?.request?.uri.toString() ?? "");
  //       addLogic(sHttpResponses, json.decode(data));
  //     } catch (e) {
  //       print(e);
  //     }
  //   }
  //   return response; // continue
  // }
  //
  // @override
  // onError(DioError err) async {
  //   if (Config.DEBUG) {
  //     print('请求异常: ' + err.toString());
  //     print('请求异常信息: ' + err.response.toString() ?? "");
  //   }
  //   try {
  //     addLogic(sHttpErrorUrl, err.request.path ?? "null");
  //     var errors = Map<String, dynamic>();
  //     errors["error"] = err.message;
  //     addLogic(sHttpError, errors);
  //   } catch (e) {
  //     print(e);
  //   }
  //   return err; // continue;
  // }

  static addLogic(List list, data) {
    if (list.length > 20) {
      list.removeAt(0);
    }
    list.add(data);
  }
}
