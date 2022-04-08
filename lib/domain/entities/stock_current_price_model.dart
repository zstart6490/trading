class StockCurrentPriceModel {
  final String? symbol;
  final String? tradingDate;
  final String? tradingTime;
  final double? ceiling;
  final double? floor;
  final double? refPrice;
  final double? open;

  final double? close;
  final double? high;
  final double? low;
  final double? avg;
  final double? priorVal;
  final double? lastPrice;
  final double? change;
  final double? ratioChange;
  final double? estMatchedPrice;
  final double? lastVol;
  final double? totalVal;
  final double? totalVol;
  final double? bidPrice1;
  final double? bidVol1;
  final double? askPrice1;
  final double? askVol1;
  final double? bidPrice2;
  final double? bidVol2;

  final double? askPrice2;
  final double? askVol2;
  final double? bidPrice3;
  final double? bidVol3;
  final double? askPrice3;
  final double? askVol3;

  StockCurrentPriceModel(
      this.symbol,
      this.tradingDate,
      this.tradingTime,
      this.ceiling,
      this.floor,
      this.refPrice,
      this.open,
      this.close,
      this.high,
      this.low,
      this.avg,
      this.priorVal,
      this.lastPrice,
      this.change,
      this.ratioChange,
      this.estMatchedPrice,
      this.lastVol,
      this.totalVal,
      this.totalVol,
      this.bidPrice1,
      this.bidVol1,
      this.askPrice1,
      this.askVol1,
      this.bidPrice2,
      this.bidVol2,
      this.askPrice2,
      this.askVol2,
      this.bidPrice3,
      this.bidVol3,
      this.askPrice3,
      this.askVol3
      );
}
