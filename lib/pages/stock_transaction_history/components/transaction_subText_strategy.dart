import 'package:trading_module/data/entities/transaction.dart';

abstract class TransactionSubTextStrategy {
  final Transaction transaction;

  TransactionSubTextStrategy(this.transaction);
  String getText();
}
