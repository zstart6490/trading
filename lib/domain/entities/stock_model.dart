import 'dart:ffi';

import 'dart:ui';

class StockModel {
  final String? symbol;
  final String? stockName;
  final String? imageUrl;
  final int? stockType;
  final double? lastPrice;
  final double? change;
  final double ratioChange;


  StockModel(this.symbol, this.stockName, this.imageUrl, this.stockType , this.lastPrice  , this.change  , this.ratioChange);


}

