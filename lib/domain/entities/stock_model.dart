import 'package:trading_module/configs/service_api_config.dart';

class StockModel {
  final String symbol;
  final String stockName;
  final String? imageUrl;
  final int? stockType;
  late double lastPrice;
  final double? change;
  late double ratioChange;

  String get fullLink => "${Environment().marketUrl}/resource/v1/stock-image/$imageUrl";


  StockModel(
      {required this.symbol,
      required this.stockName,
      required this.imageUrl,
      required this.stockType,
      required this.lastPrice,
      required this.change,
      required this.ratioChange});
}
