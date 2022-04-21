class StockOrderInfo {
  final String symbol;
  final double quantity;
  final double price;
  final double amountMaximum;
  final double quantityMaximum;
  final double amount;
  final double amountWithoutFee;
  final double fee;
  final double feePercent;
  final double feePartnerPercent;
  final double amountWithoutFeeTax;
  final double vat;
  final double vatPercent;

  StockOrderInfo({
    required this.symbol,
    required this.quantity,
    required this.price,
    required this.amountMaximum,
    required this.quantityMaximum,
    required this.amount,
    required this.amountWithoutFee,
    required this.fee,
    required this.feePercent,
    required this.feePartnerPercent,
    required this.amountWithoutFeeTax,
    required this.vat,
    required this.vatPercent,
  });
}
