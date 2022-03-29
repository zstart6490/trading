import 'package:json_annotation/json_annotation.dart';
import 'package:trading_module/domain/entities/stock_model.dart';


part 'stock_model_dto.g.dart';


@JsonSerializable()
class StockModelDTO {
  @JsonKey(name: "total")
  final double? total;
  @JsonKey(name: "stockBalance")
  final double? stockBalance;
  @JsonKey(name: "cashBalance")
  final double? cashBalance;
  @JsonKey(name: "interest")
  final double? interest;
  @JsonKey(name: "pendingCashIn")
  final double? pendingCashIn;
  @JsonKey(name: "pendingCashOut")
  final double? pendingCashOut;


  StockModelDTO(this.total,this.stockBalance,this.cashBalance,this.interest,this.pendingCashIn,this.pendingCashOut);

  static StockModelDTO fromResult(dynamic data) =>
      StockModelDTO.fromJson(data as Map<String, dynamic>);

  factory StockModelDTO.fromJson(dynamic json) =>
      _$StockModelDTOFromJson(json as Map<String,dynamic>);

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
    return StockModel("","","","",1.0);
  }
}
