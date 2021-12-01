import 'package:flutter_module_2/utils/common/http/code.dart';
import 'package:flutter_module_2/utils/common/http/result_data.dart';
import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';

///是否需要弹提示
const NOT_TIP_KEY = "noTip";

/**
 * 错误拦截
 * Created by guoshuyu
 * on 2019/3/23.
 */
class ErrorInterceptors extends InterceptorsWrapper {
  final Dio? _dio;

  ErrorInterceptors(this._dio);


}
