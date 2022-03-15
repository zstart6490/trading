import 'package:trading_module/data/entities/reason.dart';

class NavigateWithdrawData {
  Reason? selectedReason;
  final List<Reason> listReason;
  final int totalMoneyUser;

  NavigateWithdrawData({
      this.selectedReason, required this.listReason, required this.totalMoneyUser});
}
