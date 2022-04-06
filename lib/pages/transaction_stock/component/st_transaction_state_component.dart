import 'package:flutter/material.dart';
import 'package:trading_module/domain/entities/stock_transaction_detail.dart';
import 'package:trading_module/pages/transaction_stock/component/state/st_fail_transaction_state.dart';
import 'package:trading_module/pages/transaction_stock/component/state/st_success_transaction_state.dart';
import 'package:trading_module/pages/transaction_stock/component/state/st_transaction_progressing_state.dart';
import 'package:trading_module/utils/enums.dart';

class StockTransactionStateComponent extends StatelessWidget {
  final StockTransactionDetail transaction;

  const StockTransactionStateComponent(
    this.transaction, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _getState();
  }

  Widget _getState() {
    switch (transaction.status) {
      case StockTransactionState.pending:
        return StTransactionProgressingState(transaction: transaction);
      case StockTransactionState.success:
        return StSuccessTransactionState(transaction);
      case StockTransactionState.failed:
        return StFailTransactionState();
      case StockTransactionState.block:
        return StFailTransactionState();
    }
  }
}
