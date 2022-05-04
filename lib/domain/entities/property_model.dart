import 'package:get/get.dart';
import 'package:trading_module/domain/entities/stock_model.dart';
import 'package:trading_module/utils/extensions.dart';

class PropertyModel {
  final int? id;
  final String? productKey;
  final int? productType;
  final double? quantity;
  final double? priceAvg;
  final double? ceiling;
  final double? floor;
  final double? refPrice;
  late double? lastPrice;

  PropertyModel(this.id,
      this.productKey,
      this.productType,
      this.quantity,
      this.priceAvg,
      this.ceiling,
      this.floor,
      this.refPrice,
      this.lastPrice,);


  double getPriceDifference() {
    return (priceAvg ?? 0) - (lastPrice ?? 0);
  }

  double getNumberPriceDifference() {
    final value = ((priceAvg ?? 0) - (lastPrice ?? 0)) / (priceAvg ?? 0);
    if (!value.isNaN && !value.isInfinite) {
      return value.toPrecision(2);
    }
    return 0.0;
  }

  double getNumberPercentageFollow() {
    final value = ((lastPrice ?? 0) - (refPrice ?? 0)) / (refPrice ?? 0);
    if (!value.isNaN && !value.isInfinite) {
      return value.toPrecision(2);
    }
    return 0.0;
  }

  String getValuePriceDifference() {
    final value = (priceAvg ?? 0) - (lastPrice ?? 0);
    return value > 0 ? "+${value.toCurrency(symbol: "")}" : value.toCurrency(
        symbol: "");
  }

  String getPercentage() {
    final value = ((priceAvg ?? 0) - (lastPrice ?? 0)) / (priceAvg ?? 0);
    if (!value.isNaN && !value.isInfinite) {
      return value > 0 ? "+${value.toPrecision(2)}%" : "${value.toPrecision(
          2)}%";
    }
    return "0%";
  }

  String getPercentageFollow() {
    final value = ((lastPrice ?? 0) - (refPrice ?? 0)) / (refPrice ?? 0);
    if (!value.isNaN && !value.isInfinite) {
      return value > 0 ? "+${value.toPrecision(2)}%" : "${value.toPrecision(
          2)}%";
    }
    return "0%";
  }

  String getValuePriceDifferenceFollow() {
    final value = (lastPrice ?? 0) - (refPrice ?? 0);
    return value > 0 ? "+${value.toCurrency(symbol: "")}" : value.toCurrency(
        symbol: "");
  }
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
