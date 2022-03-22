import 'package:json_annotation/json_annotation.dart';
import 'package:trading_module/domain/entities/pin_confirm_model.dart';

part 'pin_confirm_model_dto.g.dart';


@JsonSerializable()
class PinConfirmModelDTO {
  @JsonKey(name: "state")
  final String? state;
  @JsonKey(name: "lockCount")
  final int? lockCount;
  @JsonKey(name: "lockDate")
  final String? lockDate;
  @JsonKey(name: "userLocked")
  final String? userLocked;
  @JsonKey(name: "warningMsg")
  final String? warningMsg;

  PinConfirmModelDTO(this.state, this.lockCount, this.lockDate, this.userLocked, this.warningMsg);

  static PinConfirmModelDTO fromResult(dynamic data) =>
      PinConfirmModelDTO.fromJson(data as Map<String, dynamic>);

  factory PinConfirmModelDTO.fromJson(dynamic json) =>
      _$PinConfirmModelDTOFromJson(json as Map<String,dynamic>);

  Map<String, dynamic> toJson() => _$PinConfirmModelDTOToJson(this);
}


extension OtpGenerateModelMapper on PinConfirmModelDTO {
  PinConfirmModel toModel() {
    return PinConfirmModel(state: state, warningMsg: warningMsg, userLocked: userLocked, lockCount: lockCount);
  }
}
