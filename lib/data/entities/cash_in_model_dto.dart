import 'package:json_annotation/json_annotation.dart';
import 'package:trading_module/domain/entities/cash_in_model.dart';


part 'cash_in_model_dto.g.dart';

@JsonSerializable()
class CashInModelDTO {
  @JsonKey(name: "state")
  final String? state;
  @JsonKey(name: "contractLink")
  final String? contractLink;

  CashInModelDTO(this.state,this.contractLink);

  static CashInModelDTO fromResult(dynamic data) =>
      CashInModelDTO.fromJson(data as Map<String, dynamic>);

  factory CashInModelDTO.fromJson(dynamic json) =>
      _$CashInModelDTOFromJson(json as Map<String,dynamic>);

  Map<String, dynamic> toJson() => _$CashInModelDTOToJson(this);
}


extension CashInModeMapper on CashInModelDTO {
  CashInModel toModel() {
    return CashInModel(state: state,contractLink: contractLink);
  }
}
