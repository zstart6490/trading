
import 'package:trading_module/domain/entities/transaction_detail.dart';
import 'package:trading_module/pages/transaction/components/state/base_transaction_state.dart';
import 'package:trading_module/utils/enums.dart';

class TransactionOtherState extends BaseTransactionState {
  const TransactionOtherState(TransactionDetail transaction) : super(transaction);

  @override
  String getMoneyDetail() {
    if (transaction.getType == TransactionType.withdraw) {
      return "-$moneyStr";
    } else {
      return "+$moneyStr";
    }
  }

  @override
  String getTitle() {
    if (transaction.getType == TransactionType.deposit) {
      return "Nạp tiền $subfix";
    } else {
      return "Rút tiền $subfix";
    }
  }
}
