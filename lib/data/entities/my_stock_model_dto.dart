import 'package:json_annotation/json_annotation.dart';
import 'package:trading_module/domain/entities/my_stock_model.dart';

part 'my_stock_model_dto.g.dart';

@JsonSerializable()
class MyStockModelDTO {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "productKey")
  final String? productKey;
  @JsonKey(name: "quantity")
  final double? quantity;
  @JsonKey(name: "priceAvg")
  final double? priceAvg;
  @JsonKey(name: "amount")
  final double? amount;
  @JsonKey(name: "stockName")
  final String? stockName;
  @JsonKey(name: "imageUrl")
  final String? imageUrl;
  @JsonKey(name: "lastPrice")
  final double? lastPrice;
  @JsonKey(name: "quantityWaitingReturn")
  final double? quantityWaitingReturn;
  @JsonKey(name: "dividendsWaitingReturn")
  final double? dividendsWaitingReturn;
  @JsonKey(name: "portfolioHistoryList")
  final List<PortfolioModelDTO>? portfolioHistoryList;

  MyStockModelDTO(
      this.id,
      this.productKey,
      this.quantity,
      this.priceAvg,
      this.amount,
      this.stockName,
      this.imageUrl,
      this.lastPrice,
      this.quantityWaitingReturn,
      this.dividendsWaitingReturn,
      this.portfolioHistoryList);

  static MyStockModelDTO fromResult(dynamic data) =>
      MyStockModelDTO.fromJson(data as Map<String, dynamic>);

  factory MyStockModelDTO.fromJson(dynamic json) =>
      _$MyStockModelDTOFromJson(json as Map<String, dynamic>);

  Map<String, dynamic> toJson() => _$MyStockModelDTOToJson(this);

  List<PortfolioModel> getListPortfolio() {
    final items = <PortfolioModel>[];
    if (portfolioHistoryList != null) {
      for (final item in portfolioHistoryList!) {
        items.add(item.toModel());
      }
    }
    return items;
  }
}

extension MyStockModelMapper on MyStockModelDTO {
  MyStockModel toModel() {
    return MyStockModel(
      id,
      productKey,
      null,
      quantity ?? 0,
      priceAvg ?? 0,
      null,
      null,
      null,
      lastPrice,
      stockName,
      imageUrl,
      quantityWaitingReturn ?? 0,
      amount,
      dividendsWaitingReturn ?? 0,
      getListPortfolio(),
    );
  }
}

@JsonSerializable()
class PortfolioModelDTO {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "productKey")
  final String? productKey;
  @JsonKey(name: "price")
  final dynamic price;
  @JsonKey(name: "quantity")
  final double? quantity;
  @JsonKey(name: "historyType")
  final int? historyType;

  PortfolioModelDTO(
      this.id, this.productKey, this.price, this.quantity, this.historyType);

  static PortfolioModelDTO fromResult(dynamic data) =>
      PortfolioModelDTO.fromJson(data as Map<String, dynamic>);

  factory PortfolioModelDTO.fromJson(dynamic json) =>
      _$PortfolioModelDTOFromJson(json as Map<String, dynamic>);

  Map<String, dynamic> toJson() => _$PortfolioModelDTOToJson(this);
}

extension PortfolioModelDTOMapper on PortfolioModelDTO {
  PortfolioModel toModel() {
    return PortfolioModel(
        id: id,
        historyType: historyType,
        productKey: productKey,
        price: price is String
            ? 0
            : price != null
                ? price as double
                : 0,
        quantity: quantity);
  }
}
