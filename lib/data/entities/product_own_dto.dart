import 'package:json_annotation/json_annotation.dart';
import 'package:trading_module/domain/entities/product_own.dart';

part 'product_own_dto.g.dart';

@JsonSerializable()
class ProductOwnDto {
  final int? id;
  final String? productKey;
  final double? quantity;
  final double? priceAvg;
  final String? imageUrl;
  final String? catName;
  final String? stockName;
  final String? symbol;
  final double? lastPrice;
  final double? changePrice;
  final double? ratioChange;
  final int? stockType;

  ProductOwnDto({
    this.id,
    this.productKey,
    this.quantity,
    this.priceAvg,
    this.imageUrl,
    this.catName,
    this.stockName,
    this.symbol,
    this.lastPrice,
    this.changePrice,
    this.ratioChange,
    this.stockType,
  });

  static List<ProductOwnDto> getList(dynamic data) {
    final list = data as List;
    return list
        .map((e) => ProductOwnDto.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  factory ProductOwnDto.fromJson(dynamic json) =>
      _$ProductOwnDtoFromJson(json as Map<String, dynamic>);

  Map<String, dynamic> toJson() => _$ProductOwnDtoToJson(this);
}

extension ProductOwnMapper on ProductOwnDto {
  ProductOwn toModel() {
    return ProductOwn(
        id: id ?? 0,
        productKey: productKey ?? "",
        quantity: quantity ?? 0,
        priceAvg: priceAvg ?? 0,
        imageUrl: imageUrl ?? "",
        catName: catName ?? "",
        stockName: stockName ?? "",
        symbol: symbol ?? "",
        changePrice: changePrice ?? 0,
        ratioChange: ratioChange ?? 0,
        lastPrice: lastPrice ?? 0,
        stockType: stockType ?? 0);
  }
}
