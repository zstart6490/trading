import 'package:json_annotation/json_annotation.dart';
import 'package:trading_module/domain/entities/stock_history_price_model.dart';


part 'stock_history_price_model_dto.g.dart';


@JsonSerializable()
class StockHistoryPriceModelDTO {
  @JsonKey(name: "TradingDate")
  final String? tradingDate;
  @JsonKey(name: "Open")
  final double? open;
  @JsonKey(name: "Close")
  final double? close;
  @JsonKey(name: "High")
  final double? high;
  @JsonKey(name: "Low")
  final double? low;
  @JsonKey(name: "Volume")
  final double? volume;
  @JsonKey(name: "Value")
  final double? value;

  StockHistoryPriceModelDTO(this.tradingDate,this.open,this.close,this.high,this.low,this.volume,this.value);

  static StockHistoryPriceModelDTO fromResult(dynamic data) =>
      StockHistoryPriceModelDTO.fromJson(data as Map<String, dynamic>);

  factory StockHistoryPriceModelDTO.fromJson(dynamic json) =>
      _$StockHistoryPriceModelDTOFromJson(json as Map<String,dynamic>);

  Map<String, dynamic> toJson() => _$StockHistoryPriceModelDTOToJson(this);
}


extension StockHistoryPriceModelDTOMapper on StockHistoryPriceModelDTO {
  StockHistoryPriceModel toModel() {
    return StockHistoryPriceModel(tradingDate,open,close,high,low,volume,value);
  }
}
