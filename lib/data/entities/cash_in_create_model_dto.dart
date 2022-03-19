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

  @JsonKey(name: "paymentMethod")
  final List<PaymentMethodModelDTO>? paymentMethod;

  CashInCreateModelDTO(
      this.transactionId, this.amount, this.feeAmount, this.paymentMethod);

  static CashInCreateModelDTO fromResult(dynamic data) =>
      CashInCreateModelDTO.fromJson(data as Map<String, dynamic>);

  factory CashInCreateModelDTO.fromJson(dynamic json) =>
      _$CashInCreateModelDTOFromJson(json as Map<String, dynamic>);

  Map<String, dynamic> toJson() => _$CashInCreateModelDTOToJson(this);

  List<PaymentMethodModel> getListPaymentMethod() {
    final lst = <PaymentMethodModel>[];
    if (paymentMethod != null) {
      for (final item in paymentMethod!) {
        lst.add(item.toModel());
      }
    }
    return lst;
  }
}

extension CashInModeMapper on CashInCreateModelDTO {
  CashInCreateModel toModel() {
    return CashInCreateModel(
        transactionId: transactionId ?? "",
        amount: amount ?? 0,
        feeAmount: feeAmount ?? 0,
        paymentMethod: getListPaymentMethod());
  }
}

@JsonSerializable()
class PaymentMethodModelDTO {
  @JsonKey(name: "title")
  final String? title;
  @JsonKey(name: "note")
  final String? note;
  @JsonKey(name: "introduce")
  final String? introduce;
  @JsonKey(name: "key")
  final String? key;

  PaymentMethodModelDTO({
    this.title,
    this.note,
    this.introduce,
    this.key,
  });

  factory PaymentMethodModelDTO.fromJson(dynamic json) =>
      _$PaymentMethodModelDTOFromJson(json as Map<String, dynamic>);

  Map<String, dynamic> toJson() => _$PaymentMethodModelDTOToJson(this);
}

extension PaymentMethodModeMapper on PaymentMethodModelDTO {
  PaymentMethodModel toModel() {
    return PaymentMethodModel(
        title: title, note: note, introduce: introduce, key: key);
  }
}
