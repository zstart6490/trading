import 'package:json_annotation/json_annotation.dart';

part 'info_withdraw_dto.g.dart';

@JsonSerializable()
class InfoWithdraw {
  final String? transactionId;
  final String? amount;
  final String? linkId;
  final String? free;
  final String? finalAmount;
  final String? remainAmount;


  InfoWithdraw(
      {this.transactionId,
      this.amount,
      this.linkId,
      this.free,
      this.finalAmount,
      this.remainAmount,
      });

  factory InfoWithdraw.fromJson(dynamic json) =>
      _$InfoWithdrawFromJson(json as Map<String, dynamic>);

  Map<String, dynamic> toJson() => _$InfoWithdrawToJson(this);
}
