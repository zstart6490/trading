import 'package:trading_module/utils/enums.dart';

class StockTransactionDetail {
  String symbol;
  double quantity;
  double quantityMatch;
  double price;
  double priceMatch;
  double amount;
  double amountWithoutFeeVat;
  double fee;
  double feeMatch;
  double feePartner;
  double feePartnerMatch;
  double feePartnerPercent;
  double feePercent;
  double vatPercent;
  String transactionCode;
  DateTime requestTime;
  StockTransactionState status;


  StockTransactionDetail(
      {required this.symbol,
      required this.quantity,
      required this.quantityMatch,
      required this.price,
      required this.priceMatch,
      required this.amount,
      required this.amountWithoutFeeVat,
      required this.fee,
      required this.feeMatch,
      required this.feePartner,
      required this.feePartnerMatch,
      required this.feePercent,
      required this.vatPercent,
      required this.feePartnerPercent,
      required this.transactionCode,
      required this.requestTime,
      required this.status});
}
