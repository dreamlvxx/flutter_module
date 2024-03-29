import 'package:flutter_module_2/utils/common/http/interceptors/error_interceptor.dart';
import 'package:flutter_module_2/utils/common/http/interceptors/header_interceptor.dart';
import 'package:flutter_module_2/utils/common/http/interceptors/log_interceptor.dart';
import 'package:flutter_module_2/utils/common/http/interceptors/response_interceptor.dart';
import 'package:flutter_module_2/utils/common/http/interceptors/token_interceptor.dart';
import 'package:flutter_module_2/utils/common/http/code.dart';

import 'package:flutter_module_2/utils/common/http/result_data.dart';
import 'package:dio/dio.dart';

import 'dart:collection';

///http请求
class HttpManager {
  static const CONTENT_TYPE_JSON = "application/json";
  static const CONTENT_TYPE_FORM = "application/x-www-form-urlencoded";

  Dio? _dio; // 使用默认配置

  final TokenInterceptors _tokenInterceptors = new TokenInterceptors();

  HttpManager() {

    _dio ??= Dio();

    _dio?.interceptors.add(new HeaderInterceptors());

    _dio?.interceptors.add(_tokenInterceptors);

    _dio?.interceptors.add(new LogsInterceptors());

    _dio?.interceptors.add(new ErrorInterceptors(_dio));

    _dio?.interceptors.add(new ResponseInterceptors());
  }

  ///发起网络请求
  ///[ url] 请求url
  ///[ params] 请求参数
  ///[ header] 外加头
  ///[ option] 配置
  Future<ResultData> request(
      url, params, Map<String, dynamic> header, Options option,
      {noTip = false}) async {
    Map<String, dynamic> headers = new HashMap();
    if (header != null) {
      headers.addAll(header);
    }

    if (option != null) {
      option.headers = headers;
    } else {
      option = new Options(method: "get");
      option.headers = headers;
    }

    resultError(DioError e) {
      late Response errorResponse;
      if (e.response != null) {
        errorResponse = e.response!;
      }
      if (e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.receiveTimeout) {
        errorResponse.statusCode = Code.NETWORK_TIMEOUT;
      }
      return new ResultData(
          Code.errorHandleFunction(errorResponse.statusCode, e.message, noTip),
          false,
          errorResponse.statusCode);
    }

    Response response;
    try {
      response = await _dio!.request(url, data: params, options: option);
    } on DioError catch (e) {
      return resultError(e);
    }
    if (response.data is DioError) {
      return resultError(response.data);
    }
    return response.data;
  }

  ///清除授权
  clearAuthorization() {
    // _tokenInterceptors.clearAuthorization();
  }

  ///获取授权token
  getAuthorization() async {
    // return _tokenInterceptors.getAuthorization();
  }
}

final HttpManager httpManager = new HttpManager();
