import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';


@JsonSerializable()
class User extends Object {

  @JsonKey(name: 'infos')
  List<Infos?>? infos;

  User(this.infos,);



  factory User.fromJson(Map<String, dynamic> srcJson) => _$UserFromJson(srcJson);

  Map<String, dynamic> toJson() => _$UserToJson(this);

}


@JsonSerializable()
class Infos extends Object {

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'address')
  String address;

  @JsonKey(name: 'phone')
  String phone;

  @JsonKey(name: 'sex')
  String sex;

  Infos(this.id,this.name,this.address,this.phone,this.sex,);

  factory Infos.fromJson(Map<String, dynamic> srcJson) => _$InfosFromJson(srcJson);

  Map<String, dynamic> toJson() => _$InfosToJson(this);

}


