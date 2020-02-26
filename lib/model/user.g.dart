// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    (json['infos'] as List)
        ?.map(
            (e) => e == null ? null : Infos.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'infos': instance.infos,
    };

Infos _$InfosFromJson(Map<String, dynamic> json) {
  return Infos(
    json['id'] as int,
    json['name'] as String,
    json['address'] as String,
    json['phone'] as String,
    json['sex'] as String,
  );
}

Map<String, dynamic> _$InfosToJson(Infos instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'phone': instance.phone,
      'sex': instance.sex,
    };
