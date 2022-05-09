import 'package:json_annotation/json_annotation.dart';
import 'package:trading_module/domain/entities/stock_current_price_model.dart';

part 'stock_current_price_model_dto.g.dart';

@JsonSerializable()
class StockCurrentPriceModelDTO {
  @JsonKey(name: "isProductWatching")
  final bool? isProductWatching;
  @JsonKey(name: "isOwner")
  final bool? isOwner;
  @JsonKey(name: "symbol")
  final String? symbol;
  @JsonKey(name: "imageUrl")
  final String? imageUrl;
  @JsonKey(name: "stockName")
  final String? stockName;
  @JsonKey(name: "TradingDate")
  final String? tradingDate;
  @JsonKey(name: "TradingTime")
  final String? tradingTime;
  @JsonKey(name: "Ceiling")
  final double? ceiling;
  @JsonKey(name: "Floor")
  final double? floor;
  @JsonKey(name: "RefPrice")
  final double? refPrice;
  @JsonKey(name: "Open")
  final double? open;

  @JsonKey(name: "Close")
  final double? close;
  @JsonKey(name: "High")
  final double? high;
  @JsonKey(name: "Low")
  final double? low;
  @JsonKey(name: "Avg")
  final double? avg;
  @JsonKey(name: "PriorVal")
  final double? priorVal;
  @JsonKey(name: "LastPrice")
  final double? lastPrice;
  @JsonKey(name: "Change")
  final double? change;
  @JsonKey(name: "RatioChange")
  final double? ratioChange;
  @JsonKey(name: "EstMatchedPrice")
  final double? estMatchedPrice;
  @JsonKey(name: "LastVol")
  final double? lastVol;
  @JsonKey(name: "TotalVal")
  final double? totalVal;
  @JsonKey(name: "TotalVol")
  final double? totalVol;
  @JsonKey(name: "BidPrice1")
  final double? bidPrice1;
  @JsonKey(name: "BidVol1")
  final double? bidVol1;
  @JsonKey(name: "AskPrice1")
  final double? askPrice1;
  @JsonKey(name: "AskVol1")
  final double? askVol1;
  @JsonKey(name: "BidPrice2")
  final double? bidPrice2;
  @JsonKey(name: "BidVol2")
  final double? bidVol2;

  @JsonKey(name: "AskPrice2")
  final double? askPrice2;
  @JsonKey(name: "AskVol2")
  final double? askVol2;
  @JsonKey(name: "BidPrice3")
  final double? bidPrice3;
  @JsonKey(name: "BidVol3")
  final double? bidVol3;
  @JsonKey(name: "AskPrice3")
  final double? askPrice3;
  @JsonKey(name: "AskVol3")
  final double? askVol3;

  StockCurrentPriceModelDTO(
      this.isProductWatching,
      this.isOwner,
      this.symbol,
      this.imageUrl,
      this.stockName,
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
      this.askVol3);

  static Future<StockCurrentPriceModelDTO> fromResult(dynamic data) async =>
      StockCurrentPriceModelDTO.fromJson(data as Map<String, dynamic>);

  factory StockCurrentPriceModelDTO.fromJson(dynamic json) =>
      _$StockCurrentPriceModelDTOFromJson(json as Map<String, dynamic>);

  Map<String, dynamic> toJson() => _$StockCurrentPriceModelDTOToJson(this);
}

extension StockCurrentPriceModelDTOMapper on StockCurrentPriceModelDTO {
  StockCurrentPriceModel toModel() {
    return StockCurrentPriceModel(
      isProductWatching,
      isOwner,
      symbol,
      imageUrl,
      stockName,
      tradingDate,
      tradingTime,
      ceiling,
      floor,
      refPrice,
      open,
      close,
      high,
      low,
      avg,
      priorVal,
      lastPrice,
      change,
      ratioChange,
      estMatchedPrice,
      lastVol,
      totalVal,
      totalVol,
      bidPrice1,
      bidVol1,
      askPrice1,
      askVol1,
      bidPrice2,
      bidVol2,
      askPrice2,
      askVol2,
      bidPrice3,
      bidVol3,
      askPrice3,
      askVol3,
    );
  }
}
