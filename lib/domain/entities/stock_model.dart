

import 'package:trading_module/configs/service_api_config.dart';


class StockModel {
  final String symbol;
  final String stockName;
  final String? imageUrl;
  final int? stockType;
  final double? lastPrice;
  final double? change;
  final double ratioChange;

  String get fullLink => "${Environment().maketUrl}/resource/v1/stock-image/${this.imageUrl}";

  StockModel(this.symbol, this.stockName, this.imageUrl, this.stockType , this.lastPrice  , this.change  , this.ratioChange);


}

