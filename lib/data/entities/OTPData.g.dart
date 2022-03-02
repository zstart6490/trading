// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'OTPData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OtpData _$OtpDataFromJson(Map<String, dynamic> json) => OtpData(
      expiredAt: DateTime.parse(json['expired_at'] as String),
      expiredSecond: json['expired_second'] as int,
      dataRequestOtp: DataRequestOtp.fromJson(
          json['data_request_otp'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OtpDataToJson(OtpData instance) => <String, dynamic>{
      'expired_at': instance.expiredAt.toIso8601String(),
      'expired_second': instance.expiredSecond,
      'data_request_otp': instance.dataRequestOtp,
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
