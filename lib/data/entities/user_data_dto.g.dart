// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDataDto _$UserDataDtoFromJson(Map<String, dynamic> json) => UserDataDto(
      json['id'] as num,
      json['appId'] as String,
      json['appUserId'] as num,
      json['phone'] as String,
      json['phoneCountryCode'] as String,
      json['email'] as String,
      json['isLocked'] as num,
      json['isKyc'] as num,
      json['isDeleted'] as num,
      json['status'] as String,
      json['lockedReason'],
      json['deletedDate'],
      json['pinLockCount'] as num,
      json['pinLockDate'],
      json['otpLockCount'] as num,
      json['otpLockDate'],
    );

Map<String, dynamic> _$UserDataDtoToJson(UserDataDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'appId': instance.appId,
      'appUserId': instance.appUserId,
      'phone': instance.phone,
      'phoneCountryCode': instance.phoneCountryCode,
      'email': instance.email,
      'isLocked': instance.isLocked,
      'isKyc': instance.isKyc,
      'isDeleted': instance.isDeleted,
      'status': instance.status,
      'lockedReason': instance.lockedReason,
      'deletedDate': instance.deletedDate,
      'pinLockCount': instance.pinLockCount,
      'pinLockDate': instance.pinLockDate,
      'otpLockCount': instance.otpLockCount,
      'otpLockDate': instance.otpLockDate,
    };
