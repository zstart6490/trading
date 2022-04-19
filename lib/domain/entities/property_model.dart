import 'package:trading_module/domain/entities/stock_model.dart';

class PropertyModel {
  final int? id;
  final String? productKey;
  final double? quantity;
  final double? priceAvg;


  PropertyModel(
    this.id,
    this.productKey,
    this.quantity,
    this.priceAvg,
  );
}

extension PropertyModelMapper on PropertyModel {
  StockModel toStockModel() {
    return StockModel(
      symbol: productKey ?? "",
      stockName: "",
      imageUrl: null,
      stockType: null,
      lastPrice: 0,
      change: null,
      ratioChange: 0,
    );
  }
}
