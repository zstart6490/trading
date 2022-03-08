import 'package:json_annotation/json_annotation.dart';
import 'package:trading_module/domain/entities/smart_otp_state_model.dart';

part 'smart_otp_model_dto.g.dart';


@JsonSerializable()
class SmartOtpStateModelDTO {
  @JsonKey(name: "isBlock")
  final int? lockCount;
  final String? lockDate;


  SmartOtpStateModelDTO(this.lockCount,this.lockDate);

  static SmartOtpStateModelDTO fromResult(dynamic data) =>
      SmartOtpStateModelDTO.fromJson(data as Map<String, dynamic>);

  factory SmartOtpStateModelDTO.fromJson(dynamic json) =>
      _$SmartOtpStateModelDTOFromJson(json as Map<String,dynamic>);

  Map<String, dynamic> toJson() => _$SmartOtpStateModelDTOToJson(this);
}


extension SmartOtpStateModelMapper on SmartOtpStateModelDTO {
  SmartOtpStateModel toModel() {
    return SmartOtpStateModel(lockCount: lockCount, lockDate:lockDate);
  }
}
