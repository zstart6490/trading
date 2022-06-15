import 'dart:ui';

import 'package:trading_module/configs/service_api_config.dart';
import 'package:trading_module/domain/entities/property_model.dart';
import 'package:trading_module/domain/entities/stock_model.dart';
import 'package:trading_module/utils/extensions.dart';

import '../../utils/util.dart';

class MyStockModel extends PropertyModel {
  final String? stockName;
  final String? imageUrl;
  final double? amount;
  final double quantityWaitingReturn;
  final double dividendsWaitingReturn;
  final List<PortfolioModel>? portfolioHistoryList;

  String get fullLink =>
      "${Environment().backendUrl}/resource/v1/stock-image/$imageUrl";

  MyStockModel(
    int? id,
    String? productKey,
    int? productType,
    double? quantity,
    double? priceAvg,
    double? ceiling,
    double? floor,
    double? refPrice,
    double? lastPrice,
    this.stockName,
    this.imageUrl,
    this.quantityWaitingReturn,
    this.amount,
    this.dividendsWaitingReturn,
    this.portfolioHistoryList,
  ) : super(id, productKey, productType, quantity, priceAvg, ceiling, floor,
            refPrice, lastPrice);

  String getPercentPrice(double currentPrice) {
    final quantity = getTotalVolumn();
    final priceDifference =
        (currentPrice - priceAvg!) * quantity;
    final priceDifferenceValue = priceDifference > 0
        ? "+${priceDifference.getPriceOrigin()}"
        : priceDifference.getPriceOrigin();
    final percentPrice = priceDifference / (quantity * priceAvg!) * 100;
    if (!percentPrice.isNaN && !percentPrice.isInfinite) {
      final num = percentPrice > 0
          ? "+${percentPrice.getShortCut()}"
          : percentPrice.getShortCut();
      return "$priceDifferenceValue ($num%)";
    }
    return "0%";
  }

  double getTotalVolumn(){
    return (quantity ?? 0) + quantityWaitingReturn;
  }
}

extension MyStockModelMapper on MyStockModel {
  StockModel toStockModel() {
    return StockModel(
        symbol: productKey ?? "",
        stockName: "",
        imageUrl: "",
        stockType: 0,
        lastPrice: lastPrice ?? 0,
        change: 0,
        ratioChange: 0);
  }
}

class PortfolioModel {
  final int? id;
  final int? historyType;
  final String? productKey;
  final double price;
  final double? quantity;

  PortfolioModel({
    this.id,
    this.historyType,
    this.productKey,
    required this.price,
    this.quantity,
  });

  String getVolumn() {
    final value = quantity ?? 0;
    return historyType == 1
        ? "+${value.toCurrency(symbol: "")}"
        : "-${value.toCurrency(symbol: "")}";
  }

  Color getTypeColor() {
    return historyType == 1 ? increaseColor : decreaseColor;
  }

  String getTypeTransaction() {
    return historyType == 1 ? "Mua" : "Bán";
  }

  String getPriceByType() {
    return historyType == 1 ? price.roundUpPriceMatch() : price.roundDownPriceMatch();
  }



// String getPercentPrice(double currentPrice) {
//   final percentPrice = (price - currentPrice) / price;
//   return "${percentPrice > 0 ? "+${double.parse(percentPrice.toStringAsFixed(2))}" : double.parse(percentPrice.toStringAsFixed(2))}%"
//       .replaceAll(".", ",");
// }
//
// String getPriceDifference(double currentPrice) {
//   final sub = price - currentPrice;
//   return sub > 0
//       ? "+${sub.toCurrency(symbol: "")}"
//       : sub.toCurrency(symbol: "");
// }
}
