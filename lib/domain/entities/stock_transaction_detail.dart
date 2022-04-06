import 'package:trading_module/utils/enums.dart';

class StockTransactionDetail {
  String symbol;
  double quantity;
  double price;
  double amount;
  double amountWithoutFee;
  double fee;
  String transactionCode;
  DateTime requestTime;
  StockTransactionState status;


  StockTransactionDetail(
      {required this.symbol,
      required this.quantity,
      required this.price,
      required this.amount,
      required this.amountWithoutFee,
      required this.fee,
      required this.transactionCode,
      required this.requestTime,
      required this.status});
}
