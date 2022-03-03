import 'package:json_annotation/json_annotation.dart';
import 'package:trading_project/domain/entities/OtpModel.dart';

part 'OTPData.g.dart';

@JsonSerializable()
class OtpData {
  OtpData({
    required this.expiredAt,
    required this.expiredSecond,
    required this.dataRequestOtp,
  });

  @JsonKey(name: "expired_at")
  final DateTime expiredAt;
  @JsonKey(name: "expired_second")
  final int expiredSecond;
  @JsonKey(name: "data_request_otp")
  final DataRequestOtp dataRequestOtp;

  static OtpData fromResult(dynamic data) =>
      OtpData.fromJson(data as Map<String, dynamic>);
  factory OtpData.fromJson(Map<String, dynamic> json) =>
      _$OtpDataFromJson(json);
  Map<String, dynamic> toJson() => _$OtpDataToJson(this);
}

@JsonSerializable()
class DataRequestOtp {
  DataRequestOtp({
    required this.times,
    required this.timeStamp,
    required this.message,
  });

  final int times;
  @JsonKey(name: "time_stamp")
  final String timeStamp;
  @JsonKey(name: "message")
  final String message;

  static DataRequestOtp fromResult(dynamic data) =>
      DataRequestOtp.fromJson(data as Map<String, dynamic>);

  factory DataRequestOtp.fromJson(Map<String, dynamic> json) =>
      _$DataRequestOtpFromJson(json);
  Map<String, dynamic> toJson() => _$DataRequestOtpToJson(this);
}


extension OtpModelMapper on OtpData {
  OtpModel toModel() {
    return OtpModel(gstId: expiredAt.microsecond.toString(), startTime: expiredAt);
  }
}
