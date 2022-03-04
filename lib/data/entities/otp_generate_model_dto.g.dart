// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp_generate_model_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OtpGenerateModelDTO _$OtpGenerateModelDTOFromJson(Map<String, dynamic> json) =>
    OtpGenerateModelDTO(
      token: json['expired_at'] as String?,
      expiredSecond: json['expired_second'] as int?,
    );

Map<String, dynamic> _$OtpGenerateModelDTOToJson(
        OtpGenerateModelDTO instance) =>
    <String, dynamic>{
      'expired_at': instance.token,
      'expired_second': instance.expiredSecond,
    };

DataRequestOtp _$DataRequestOtpFromJson(Map<String, dynamic> json) =>
    DataRequestOtp(
      times: json['times'] as int,
      timeStamp: json['time_stamp'] as String,
      message: json['message'] as String,
    );

Map<String, dynamic> _$DataRequestOtpToJson(DataRequestOtp instance) =>
    <String, dynamic>{
      'times': instance.times,
      'time_stamp': instance.timeStamp,
      'message': instance.message,
    };
