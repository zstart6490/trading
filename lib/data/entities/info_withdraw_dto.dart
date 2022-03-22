import 'package:json_annotation/json_annotation.dart';
import 'package:trading_module/domain/entities/info_withdraw.dart';

part 'info_withdraw_dto.g.dart';

@JsonSerializable()
class InfoWithdrawDto {
  final int? transactionId;
  final String? linkId;
  final num? amount;
  final num? feeAmount;
  final num? balance;
  final num? finalAmount;
  final num? remainAmount;

  InfoWithdrawDto({
    this.transactionId,
    this.amount,
    this.linkId,
    this.balance,
    this.feeAmount,
    this.finalAmount,
    this.remainAmount,
  });

  factory InfoWithdrawDto.fromJson(dynamic json) =>
      _$InfoWithdrawDtoFromJson(json as Map<String, dynamic>);
}

extension InfoWithdrawMapper on InfoWithdrawDto {
  InfoWithdraw toModel() {
    return InfoWithdraw(
        transactionId: transactionId ?? 0,
        amount: amount ?? 0,
        linkId: linkId ?? "0",
        balance: balance ?? 0,
        feeAmount: feeAmount ?? 0,
        receiveAmount: finalAmount ?? 0,
        remainingBalance: remainAmount ?? 0);
  }
}
