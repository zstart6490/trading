import 'package:json_annotation/json_annotation.dart';
import 'package:trading_module/domain/entities/stock_model.dart';

part 'stock_model_dto.g.dart';

@JsonSerializable()
class StockModelDTO {
  @JsonKey(name: "symbol")
  final String? symbol;
  @JsonKey(name: "stockName")
  final String? stockName;
  @JsonKey(name: "imageUrl")
  final String? imageUrl;
  @JsonKey(name: "stockType")
  final int? stockType;
  @JsonKey(name: "lastPrice")
  final double? lastPrice;
  @JsonKey(name: "change")
  final double? change;
  @JsonKey(name: "ratioChange")
  final double? ratioChange;

  StockModelDTO(this.symbol, this.stockName, this.imageUrl, this.stockType,
      this.lastPrice, this.change, this.ratioChange);

  static Future<StockModelDTO> fromResult(dynamic data) async =>
      StockModelDTO.fromJson(data as Map<String, dynamic>);

  factory StockModelDTO.fromJson(dynamic json) =>
      _$StockModelDTOFromJson(json as Map<String, dynamic>);

  Map<String, dynamic> toJson() => _$StockModelDTOToJson(this);

  static List<StockModelDTO> getList(dynamic data) {
    final list = data as List;
    return list
        .map((e) => StockModelDTO.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}

extension StockModelMapper on StockModelDTO {
  StockModel toModel() {
    return StockModel(symbol ?? "", stockName ?? "", imageUrl, stockType,
        lastPrice, change, ratioChange ?? 0);
  }
}
