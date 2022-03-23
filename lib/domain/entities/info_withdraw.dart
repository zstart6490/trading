import 'package:trading_module/domain/entities/bank.dart';

class InfoWithdraw {
  final num transactionId;
  final String linkId;
  final num amount;
  final num feeAmount;
  final num balance;
  final num receiveAmount;
  final num remainingBalance;
  UserBank? userBank;

  InfoWithdraw({
    required this.transactionId,
    required this.amount,
    required this.linkId,
    required this.balance,
    required this.feeAmount,
    required this.receiveAmount,
    required this.remainingBalance,
  });
}
