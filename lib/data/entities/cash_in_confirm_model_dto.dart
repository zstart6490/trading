import 'package:json_annotation/json_annotation.dart';
import 'package:trading_module/domain/entities/cash_in_confirm_model.dart';


part 'cash_in_confirm_model_dto.g.dart';

@JsonSerializable()
class CashInConfirmModelDTO {
  @JsonKey(name: "state")
  final String? state;
  @JsonKey(name: "contractLink")
  final String? contractLink;

  CashInConfirmModelDTO(this.state,this.contractLink);

  static CashInConfirmModelDTO fromResult(dynamic data) =>
      CashInConfirmModelDTO.fromJson(data as Map<String, dynamic>);

  factory CashInConfirmModelDTO.fromJson(dynamic json) =>
      _$CashInConfirmModelDTOFromJson(json as Map<String,dynamic>);

  Map<String, dynamic> toJson() => _$CashInConfirmModelDTOToJson(this);
}


extension CashInModeMapper on CashInConfirmModelDTO {
  CashInConfirmModel toModel() {
    return CashInConfirmModel(state: state,contractLink: contractLink);
  }
}
