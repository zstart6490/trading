import 'package:flutter/material.dart';
import 'package:trading_module/domain/entities/transaction_detail.dart';
import 'package:trading_module/pages/transaction/components/state/transaction_other_state.dart';
import 'package:trading_module/pages/transaction/components/state/transaction_progressing_state.dart';
import 'package:trading_module/pages/transaction/components/transaction_create_state.dart';
import 'package:trading_module/utils/enums.dart';


class TransactionStateComponent extends StatelessWidget {
  final TransactionDetail transaction;

  const TransactionStateComponent(
    this.transaction, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _getState();
  }

  Widget _getState() {
    switch (transaction.status) {
      case TransactionState.create:
        return TransactionCreateState(transaction: transaction);
      case TransactionState.progressing:
        return TransactionProgressingState(transaction: transaction);
      case TransactionState.success:
      case TransactionState.failed:
      case TransactionState.cancel:
      case TransactionState.lock:
      case TransactionState.delete:
        return TransactionOtherState(transaction);
    }
  }
}
