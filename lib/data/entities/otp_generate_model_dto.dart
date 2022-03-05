import 'package:json_annotation/json_annotation.dart';
import 'package:trading_module/domain/entities/otp_generate_model.dart';

part 'otp_generate_model_dto.g.dart';


@JsonSerializable()
class OtpGenerateModelDTO {
  @JsonKey(name: "state")
  final String? state;
  @JsonKey(name: "otpMethod")
  final String? otpMethod;
  @JsonKey(name: "otp")
  final String? otp;
  @JsonKey(name: "lockCount")
  final int? lockCount;
  @JsonKey(name: "lockDate")
  final String? lockDate;
  @JsonKey(name: "timeOut")
  final int? timeOut;

  @JsonKey(name: "userLocked")
  final String? userLocked;
  @JsonKey(name: "warningMsg")
  final String? warningMsg;

  OtpGenerateModelDTO(this.state, this.otpMethod, this.otp, this.lockCount, this.lockDate,
      this.timeOut, this.userLocked, this.warningMsg);

  static OtpGenerateModelDTO fromResult(dynamic data) =>
      OtpGenerateModelDTO.fromJson(data as Map<String, dynamic>);

  factory OtpGenerateModelDTO.fromJson(dynamic json) =>
      _$OtpGenerateModelDTOFromJson(json as Map<String,dynamic>);

  Map<String, dynamic> toJson() => _$OtpGenerateModelDTOToJson(this);
}


extension OtpGenerateModelMapper on OtpGenerateModelDTO {
  OtpGenerateModel toModel() {
    return OtpGenerateModel(otpMethod: otpMethod, otp: otp, warningMsg: warningMsg, userLocked: userLocked, lockCount: lockCount, timeOut: timeOut);
  }
}
