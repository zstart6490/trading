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
  @JsonKey(name: "ceiling")
  final double? ceiling;
  @JsonKey(name: "floor")
  final double? floor;
  @JsonKey(name: "refPrice")
  final double? refPrice;

  StockModelDTO(this.symbol, this.stockName, this.imageUrl, this.stockType,
      this.lastPrice, this.change, this.ratioChange, this.ceiling, this.floor, this.refPrice);

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
    return StockModel(
      symbol: symbol ?? "",
      stockName: stockName ?? "",
      imageUrl: imageUrl ?? "",
      stockType: stockType ?? 0,
      lastPrice: lastPrice ?? 0,
      change: change ?? 0,
      ratioChange: ratioChange ?? 0,
      ceiling: ceiling ?? 0,
      floor: floor ?? 0,
      refPrice: refPrice ?? 0,
    );
  }
}
