import 'package:trading_module/domain/entities/bank.dart';
import 'package:trading_module/domain/entities/reason.dart';

class NavigateWithdrawData {
  Reason? selectedReason;
  List<Reason> listReason;
  final List<UserBank>? listUserBank;
  final num totalMoneyUser;
  num? transactionId;

  NavigateWithdrawData(
      {this.selectedReason,
      this.listUserBank,
      required this.listReason,
      required this.totalMoneyUser});
}
