import 'package:trading_module/configs/service_api_config.dart';

class StockModel {
  String symbol;
  String stockName;
  String imageUrl;
  int stockType;
  double lastPrice;
  double change;
  double ratioChange;

  String get fullLink =>
      "${Environment().backendUrl}/resource/v1/stock-image/$imageUrl";

  StockModel(
      {required this.symbol,
      required this.stockName,
      required this.imageUrl,
      required this.stockType,
      required this.lastPrice,
      required this.change,
      required this.ratioChange});
}
