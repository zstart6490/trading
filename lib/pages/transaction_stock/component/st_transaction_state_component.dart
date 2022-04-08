import 'package:flutter/material.dart';
import 'package:trading_module/data/entities/navigate_stock_trans_detail.dart';
import 'package:trading_module/pages/transaction_stock/component/state/st_fail_transaction_state.dart';
import 'package:trading_module/pages/transaction_stock/component/state/st_success_transaction_state.dart';
import 'package:trading_module/pages/transaction_stock/component/state/st_transaction_progressing_state.dart';
import 'package:trading_module/utils/enums.dart';

class StockTransactionStateComponent extends StatelessWidget {
  final NavigateStockTranDetail navTransaction;

  const StockTransactionStateComponent(
    this.navTransaction, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _getState();
  }

  Widget _getState() {
    switch (navTransaction.transaction.status) {
      case StockTransactionState.pending:
        return StTransactionProgressingState(transaction: navTransaction.transaction);
      case StockTransactionState.success:
        return StSuccessTransactionState(transaction: navTransaction.transaction,stockTransactionType: navTransaction.stockTransactionType);
      case StockTransactionState.failed:
        return StFailTransactionState(transaction: navTransaction.transaction,stockTransactionType: navTransaction.stockTransactionType,);
      case StockTransactionState.block:
        return StFailTransactionState(transaction:navTransaction.transaction,stockTransactionType: navTransaction.stockTransactionType,);
    }
  }
}
