// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp_generate_model_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OtpGenerateModelDTO _$OtpGenerateModelDTOFromJson(Map<String, dynamic> json) =>
    OtpGenerateModelDTO(
      json['state'] as String?,
      json['otpMethod'] as String?,
      json['otp'] as String?,
      json['lockCount'] as int?,
      json['lockDate'] as String?,
      json['timeOut'] as int?,
      json['userLocked'] as String?,
      json['warningMsg'] as String?,
    );

Map<String, dynamic> _$OtpGenerateModelDTOToJson(
        OtpGenerateModelDTO instance) =>
    <String, dynamic>{
      'state': instance.state,
      'otpMethod': instance.otpMethod,
      'otp': instance.otp,
      'lockCount': instance.lockCount,
      'lockDate': instance.lockDate,
      'timeOut': instance.timeOut,
      'userLocked': instance.userLocked,
      'warningMsg': instance.warningMsg,
    };
