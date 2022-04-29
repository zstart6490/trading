import 'package:get/get.dart';
import 'package:trading_module/configs/service_api_config.dart';
import 'package:trading_module/domain/entities/stock_model.dart';

class ProductOwn {
  final int id;
  final String productKey;
  final double quantity;
  final double priceAvg;
  final String imageUrl;
  final String catName;
  final String stockName;
  final String symbol;
  final double lastPrice;
  final double changePrice;
  final double ratioChange;
  final int stockType;

  String get fullLink =>
      "${Environment().backendUrl}/resource/v1/stock-image/$imageUrl";

  String getRatioPercentage() {
    final value = (priceAvg -lastPrice) / priceAvg;
    if (!value.isNaN && !value.isInfinite) {
      return value > 0
          ? "+${value.toPrecision(2)}%"
          : "${value.toPrecision(2)}%";
    }
    return "0%";
  }

  ProductOwn({
    required this.id,
    required this.productKey,
    required this.quantity,
    required this.priceAvg,
    required this.imageUrl,
    required this.catName,
    required this.stockName,
    required this.symbol,
    required this.lastPrice,
    required this.changePrice,
    required this.ratioChange,
    required this.stockType,
  });
}

extension ProductOwnToStock on ProductOwn {
  StockModel toStockModel() {
    return StockModel(
        symbol: symbol,
        stockName: stockName,
        imageUrl: imageUrl,
        stockType: stockType,
        lastPrice: lastPrice,
        change: changePrice,
        ratioChange: ratioChange);
  }
}
