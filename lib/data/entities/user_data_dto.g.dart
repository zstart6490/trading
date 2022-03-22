// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDataDto _$UserDataDtoFromJson(Map<String, dynamic> json) => UserDataDto(
      json['id'] as num,
      json['appId'] as String,
      json['appUserId'] as num?,
      json['phone'] as String?,
      json['phoneCountryCode'] as String?,
      json['email'] as String?,
      json['status'] as String?,
    );

Map<String, dynamic> _$UserDataDtoToJson(UserDataDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'appId': instance.appId,
      'appUserId': instance.appUserId,
      'phone': instance.phone,
      'phoneCountryCode': instance.phoneCountryCode,
      'email': instance.email,
      'status': instance.status,
    };
