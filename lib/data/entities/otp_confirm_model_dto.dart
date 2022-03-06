import 'package:json_annotation/json_annotation.dart';
import 'package:trading_module/domain/entities/otp_confirm_model.dart';


part 'otp_confirm_model_dto.g.dart';


@JsonSerializable()
class OtpConfirmModelDTO {
  @JsonKey(name: "state")
  final String? state;

  OtpConfirmModelDTO(this.state);

  static OtpConfirmModelDTO fromResult(dynamic data) =>
      OtpConfirmModelDTO.fromJson(data as Map<String, dynamic>);

  factory OtpConfirmModelDTO.fromJson(dynamic json) =>
      _$OtpConfirmModelDTOFromJson(json as Map<String,dynamic>);

  Map<String, dynamic> toJson() => _$OtpConfirmModelDTOToJson(this);
}


extension OtpConfirmModeMapper on OtpConfirmModelDTO {
  OtpConfirmModel toModel() {
    return OtpConfirmModel(state: state);
  }
}
