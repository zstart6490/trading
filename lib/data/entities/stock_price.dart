import 'package:json_annotation/json_annotation.dart';

part 'stock_price.g.dart';

@JsonSerializable()
class StockPrice {
  @JsonKey(name: "sym")
  final String? symbol;

  @JsonKey(name: "prc")
  final double? price;

  @JsonKey(name: "chg")
  final double? chg;

  StockPrice(this.symbol, this.price, this.chg);

  factory StockPrice.fromJson(dynamic json) => _$StockPriceFromJson(json as Map<String, dynamic>);

  Map<String, dynamic> toJson() => _$StockPriceToJson(this);
}
