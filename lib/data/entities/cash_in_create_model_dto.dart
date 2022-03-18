import 'package:json_annotation/json_annotation.dart';
import 'package:trading_module/domain/entities/cash_in_create_model.dart';

part 'cash_in_create_model_dto.g.dart';

@JsonSerializable()
class CashInCreateModelDTO {
  @JsonKey(name: "transactionId")
  final String? transactionId;
  @JsonKey(name: "amount")
  final int? amount;
  @JsonKey(name: "feeAmount")
  final int? feeAmount;

  CashInCreateModelDTO(this.transactionId,this.amount,this.feeAmount);

  static CashInCreateModelDTO fromResult(dynamic data) =>
      CashInCreateModelDTO.fromJson(data as Map<String, dynamic>);

  factory CashInCreateModelDTO.fromJson(dynamic json) =>
      _$CashInCreateModelDTOFromJson(json as Map<String,dynamic>);

  Map<String, dynamic> toJson() => _$CashInCreateModelDTOToJson(this);
}


extension CashInModeMapper on CashInCreateModelDTO {
  CashInCreateModel toModel() {
    return CashInCreateModel(transactionId: transactionId ?? "", amount: amount ?? 0, feeAmount: feeAmount ?? 0);
  }
}
