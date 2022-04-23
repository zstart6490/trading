import 'package:trading_module/configs/service_api_config.dart';
import 'package:trading_module/domain/entities/property_model.dart';
import 'package:trading_module/domain/entities/stock_model.dart';
import 'package:trading_module/utils/extensions.dart';

class MyStockModel extends PropertyModel {
  final String? stockName;
  final String? imageUrl;
  final double quantityWaitingReturn;
  final double dividendsWaitingReturn;
  final List<PortfolioModel>? portfolioHistoryList;


  String get fullLink => "${Environment().backendUrl}/resource/v1/stock-image/$imageUrl";

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
    this.dividendsWaitingReturn,
    this.portfolioHistoryList,
  ) : super(id, productKey, productType, quantity, priceAvg, ceiling, floor,
            refPrice, lastPrice);

  String getPercentPrice(double currentPrice) {
    final priceDifference =
        (quantity! * priceAvg!) - (quantity! * currentPrice);
    final priceDifferenceValue = priceDifference > 0
        ? "+${priceDifference.toCurrency(symbol: "")}"
        : priceDifference.toCurrency(symbol: "");
    final percentPrice = priceDifference / (quantity! * priceAvg!);
    final num = percentPrice > 0
        ? "+${double.parse(percentPrice.toStringAsFixed(2))}"
            .replaceAll(".", ",")
        : "+${double.parse(percentPrice.toStringAsFixed(2))}"
            .replaceAll(".", ",");
    return "$priceDifferenceValue ($num%)";
  }
}

extension MyStockModelMapper on MyStockModel {
  StockModel toStockModel() {
    return StockModel(
        symbol: productKey ?? "",
        stockName: "",
        imageUrl: null,
        stockType: null,
        lastPrice: 0,
        change: null,
        ratioChange: 0);
  }
}

class PortfolioModel {
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

  String getPercentPrice(double currentPrice) {
    final percentPrice = (price - currentPrice) / price;
    return "${percentPrice > 0 ? "+${double.parse(percentPrice.toStringAsFixed(2))}" : double.parse(percentPrice.toStringAsFixed(2))}%"
        .replaceAll(".", ",");
  }

  String getPriceDifference(double currentPrice) {
    final sub = price - currentPrice;
    return sub > 0
        ? "+${sub.toCurrency(symbol: "")}"
        : sub.toCurrency(symbol: "");
  }
}
