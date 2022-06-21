// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_current_price_model_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StockCurrentPriceModelDTO _$StockCurrentPriceModelDTOFromJson(
        Map<String, dynamic> json) =>
    StockCurrentPriceModelDTO(
      json['isProductWatching'] as bool?,
      json['isAllowSell'] as bool?,
      json['Symbol'] as String?,
      json['imageUrl'] as String?,
      json['stockName'] as String?,
      json['TradingDate'] as String?,
      json['TradingTime'] as String?,
      (json['Ceiling'] as num?)?.toDouble(),
      (json['Floor'] as num?)?.toDouble(),
      (json['RefPrice'] as num?)?.toDouble(),
      (json['Open'] as num?)?.toDouble(),
      (json['Close'] as num?)?.toDouble(),
      (json['High'] as num?)?.toDouble(),
      (json['Low'] as num?)?.toDouble(),
      (json['AvgPrice'] as num?)?.toDouble(),
      (json['PriorVal'] as num?)?.toDouble(),
      (json['LastPrice'] as num?)?.toDouble(),
      (json['Change'] as num?)?.toDouble(),
      (json['RatioChange'] as num?)?.toDouble(),
      (json['EstMatchedPrice'] as num?)?.toDouble(),
      (json['LastVol'] as num?)?.toDouble(),
      (json['TotalVal'] as num?)?.toDouble(),
      (json['TotalVol'] as num?)?.toDouble(),
      (json['BidPrice1'] as num?)?.toDouble(),
      (json['BidVol1'] as num?)?.toDouble(),
      (json['AskPrice1'] as num?)?.toDouble(),
      (json['AskVol1'] as num?)?.toDouble(),
      (json['BidPrice2'] as num?)?.toDouble(),
      (json['BidVol2'] as num?)?.toDouble(),
      (json['AskPrice2'] as num?)?.toDouble(),
      (json['AskVol2'] as num?)?.toDouble(),
      (json['BidPrice3'] as num?)?.toDouble(),
      (json['BidVol3'] as num?)?.toDouble(),
      (json['AskPrice3'] as num?)?.toDouble(),
      (json['AskVol3'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$StockCurrentPriceModelDTOToJson(
        StockCurrentPriceModelDTO instance) =>
    <String, dynamic>{
      'isProductWatching': instance.isProductWatching,
      'isAllowSell': instance.isAllowSell,
      'Symbol': instance.symbol,
      'imageUrl': instance.imageUrl,
      'stockName': instance.stockName,
      'TradingDate': instance.tradingDate,
      'TradingTime': instance.tradingTime,
      'Ceiling': instance.ceiling,
      'Floor': instance.floor,
      'RefPrice': instance.refPrice,
      'Open': instance.open,
      'Close': instance.close,
      'High': instance.high,
      'Low': instance.low,
      'AvgPrice': instance.avgPrice,
      'PriorVal': instance.priorVal,
      'LastPrice': instance.lastPrice,
      'Change': instance.change,
      'RatioChange': instance.ratioChange,
      'EstMatchedPrice': instance.estMatchedPrice,
      'LastVol': instance.lastVol,
      'TotalVal': instance.totalVal,
      'TotalVol': instance.totalVol,
      'BidPrice1': instance.bidPrice1,
      'BidVol1': instance.bidVol1,
      'AskPrice1': instance.askPrice1,
      'AskVol1': instance.askVol1,
      'BidPrice2': instance.bidPrice2,
      'BidVol2': instance.bidVol2,
      'AskPrice2': instance.askPrice2,
      'AskVol2': instance.askVol2,
      'BidPrice3': instance.bidPrice3,
      'BidVol3': instance.bidVol3,
      'AskPrice3': instance.askPrice3,
      'AskVol3': instance.askVol3,
    };
