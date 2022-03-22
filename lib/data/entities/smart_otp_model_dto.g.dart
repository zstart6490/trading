// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'smart_otp_model_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SmartOtpStateModelDTO _$SmartOtpStateModelDTOFromJson(
        Map<String, dynamic> json) =>
    SmartOtpStateModelDTO(
      json['isBlock'] as int?,
      json['lockDate'] as String?,
    );

Map<String, dynamic> _$SmartOtpStateModelDTOToJson(
        SmartOtpStateModelDTO instance) =>
    <String, dynamic>{
      'isBlock': instance.lockCount,
      'lockDate': instance.lockDate,
    };
