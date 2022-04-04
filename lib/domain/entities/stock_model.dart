

import 'package:trading_module/configs/service_api_config.dart';


class StockModel {
  final String symbol;
  final String stockName;
  final String? imageUrl;
  final int? stockType;
  late final double lastPrice;
  final double? change;
  late final double ratioChange;

  String get fullLink => "${Environment().maketUrl}/resource/v1/stock-image/$imageUrl";

  StockModel(this.symbol, this.stockName, this.imageUrl, this.stockType , this.lastPrice  , this.change  , this.ratioChange);


}

