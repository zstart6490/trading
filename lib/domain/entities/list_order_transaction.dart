import 'package:trading_module/domain/entities/stock_transaction_history.dart';

class ListOrderTransaction {
  final List<OrderRecord> records;

  ListOrderTransaction({required this.records});
}

class OrderRecord {
  final String key;
  final List<StockTransactionHistory> data;

  OrderRecord({required this.key, required this.data});
}
