import 'package:json_annotation/json_annotation.dart';
import 'package:trading_module/domain/entities/cash_in_create_model.dart';



part 'cash_in_create_model_dto.g.dart';

@JsonSerializable()
class CashInCreateModelDTO {
  @JsonKey(name: "state")
  final String? state;
  @JsonKey(name: "contractLink")
  final String? contractLink;

  CashInCreateModelDTO(this.state,this.contractLink);

  static CashInCreateModelDTO fromResult(dynamic data) =>
      CashInCreateModelDTO.fromJson(data as Map<String, dynamic>);

  factory CashInCreateModelDTO.fromJson(dynamic json) =>
      _$CashInCreateModelDTOFromJson(json as Map<String,dynamic>);

  Map<String, dynamic> toJson() => _$CashInCreateModelDTOToJson(this);
}


extension CashInModeMapper on CashInCreateModelDTO {
  CashInCreateModel toModel() {
    return CashInCreateModel(state: state,contractLink: contractLink);
  }
}
