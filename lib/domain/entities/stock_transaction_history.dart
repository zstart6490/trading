import 'package:trading_module/utils/enums.dart';

class StockTransactionHistory {
  int id;
  String symbol;
  double quantity;
  double price;
  double priceMatch;
  double quantityMatch;
  String orderType;
  DateTime requestTime;
  StockTransactionState status;

  StockTransactionHistory(
      {required this.id,
      required this.symbol,
      required this.quantity,
      required this.price,
      required this.priceMatch,
      required this.quantityMatch,
      required this.orderType,
      required this.requestTime,
      required this.status});

  String getStateContent() {
    if (status == StockTransactionState.pending) {
      return "Chờ khớp";
    }
    if (status == StockTransactionState.processed || status == StockTransactionState.partiallyProcessed) {
      return "Thành công";
    }
    if (status == StockTransactionState.failed) {
      return "Thất bại";
    }
    return "";
  }
}
