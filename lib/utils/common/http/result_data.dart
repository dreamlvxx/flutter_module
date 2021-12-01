/**
 * 网络结果数据
 * Created by guoshuyu
 * Date: 2018-07-16
 */
class ResultData {
  late var data;
  late bool? result;
  late int? code;
  late var headers;
  late String? msg;

  ResultData(this.data, this.result, this.code, {this.headers});
}
