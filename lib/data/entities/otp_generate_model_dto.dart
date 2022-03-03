import 'package:json_annotation/json_annotation.dart';
import 'package:trading_module/domain/entities/otp_generate_model.dart';

part 'otp_generate_model_dto.g.dart';

@JsonSerializable()
class OtpGenerateModelDTO {
  OtpGenerateModelDTO({
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

  static OtpGenerateModelDTO fromResult(dynamic data) =>
      OtpGenerateModelDTO.fromJson(data as Map<String, dynamic>);
  factory OtpGenerateModelDTO.fromJson(Map<String, dynamic> json) =>
      _$OtpGenerateModelDTOFromJson(json);
  Map<String, dynamic> toJson() => _$OtpGenerateModelDTOToJson(this);
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


extension OtpGenerateModelMapper on OtpGenerateModelDTO {
  OtpGenerateModel toModel() {
    return OtpGenerateModel(gstId: expiredAt.microsecond.toString(), startTime: expiredAt);
  }
}
