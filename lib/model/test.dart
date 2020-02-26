import 'package:json_annotation/json_annotation.dart';

part 'test.g.dart';


@JsonSerializable()
class Test extends Object {

  @JsonKey(name: 'statusCode')
  int statusCode;

  @JsonKey(name: 'data')
  Data data;

  Test(this.statusCode,this.data,);

  factory Test.fromJson(Map<String, dynamic> srcJson) => _$TestFromJson(srcJson);

  Map<String, dynamic> toJson() => _$TestToJson(this);

}


@JsonSerializable()
class Data extends Object {

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'email')
  String email;

  @JsonKey(name: 'pics')
  List<String> pics;

  Data(this.name,this.email,this.pics,);

  factory Data.fromJson(Map<String, dynamic> srcJson) => _$DataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DataToJson(this);

}
