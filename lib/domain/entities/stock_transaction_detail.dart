import 'package:trading_module/utils/enums.dart';

class StockTransactionDetail {
  String symbol;
  double quantity;
  double price;
  double amount;
  double amountWithoutFee;
  double fee;
  double feePartner;
  double feePartnerPercent;
  double feePercent;
  double vatPercent;
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
      required this.feePartner,
      required this.feePercent,
      required this.vatPercent,
      required this.feePartnerPercent,
      required this.transactionCode,
      required this.requestTime,
      required this.status});
}
