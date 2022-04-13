import 'package:trading_module/utils/extensions.dart';

class MyStockModel {
  final int? id;
  final String? productKey;
  final double quantity;
  final double priceAvg;
  final double? amount;
  final double quantityWaitingReturn;
  final double dividendsWaitingReturn;
  final List<PortfolioModel>? portfolioHistoryList;

  MyStockModel({
    this.id,
    this.productKey,
    required this.quantity,
    required this.priceAvg,
    this.amount,
    required this.quantityWaitingReturn,
    required this.dividendsWaitingReturn,
    this.portfolioHistoryList,
  });

  String getPercentPrice(double currentPrice){
    final priceDifference = (quantity * priceAvg) - (quantity * currentPrice);
    final priceDifferenceValue = priceDifference > 0 ? "+${priceDifference.toCurrency(symbol: "")}" : priceDifference.toCurrency(symbol: "");
    final percentPrice = priceDifference / (quantity * priceAvg);
    final num = percentPrice > 0 ? "+${double.parse(percentPrice.toStringAsFixed(2))}".replaceAll(".", ",") : "+${double.parse(percentPrice.toStringAsFixed(2))}".replaceAll(".", ",");
    return "$priceDifferenceValue ($num%)";
  }

}


class PortfolioModel{
  final int? id;
  final String? productKey;
  final double price;
  final double? quantity;

  PortfolioModel({
    this.id,
    this.productKey,
    required this.price,
    this.quantity,
  });


  String getPercentPrice(double currentPrice){
    final percentPrice = (price - currentPrice) / price;
    return "${percentPrice > 0 ? "+${double.parse(percentPrice.toStringAsFixed(2))}" : double.parse(percentPrice.toStringAsFixed(2))}%".replaceAll(".", ",");
  }

  String getPriceDifference(double currentPrice){
    final sub = price - currentPrice;
    return sub > 0 ? "+${sub.toCurrency(symbol: "")}" : sub.toCurrency(symbol: "");
  }
}