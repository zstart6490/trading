// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDataDTO _$UserDataDTOFromJson(Map<String, dynamic> json) => UserDataDTO(
      json['id'] as num,
      json['createTime'] as String?,
      json['modifyTime'] as String?,
      json['part'] as num?,
      json['name'] as String?,
      json['phoneNumber'] as String,
      json['password'] as String?,
      json['email'] as String?,
      json['fullName'] as String?,
      json['birthday'] as String?,
      json['address'] as String?,
      json['gender'] as num?,
    );

Map<String, dynamic> _$UserDataDTOToJson(UserDataDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createTime': instance.createTime,
      'modifyTime': instance.modifyTime,
      'part': instance.part,
      'name': instance.name,
      'phoneNumber': instance.phoneNumber,
      'password': instance.password,
      'email': instance.email,
      'fullName': instance.fullName,
      'birthday': instance.birthday,
      'address': instance.address,
      'gender': instance.gender,
    };
