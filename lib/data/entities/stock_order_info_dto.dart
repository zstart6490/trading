import 'package:json_annotation/json_annotation.dart';
import 'package:trading_module/domain/entities/stock_order_info.dart';

part 'stock_order_info_dto.g.dart';

@JsonSerializable()
class StockOrderInfoDto {
  final String? symbol;
  final double? quantity;
  final double? price;
  final double? amountMaximum;
  final double? quantityMaximum;
  final double? amount;
  final double? amountWithoutFee;
  final double? fee;
  final double? feePercent;
  final double? amountWithoutFeeTax;
  final double? vat;
  final double? vatPercent;

  StockOrderInfoDto({
    this.symbol,
    this.quantity,
    this.price,
    this.amountMaximum,
    this.quantityMaximum,
    this.amount,
    this.amountWithoutFee,
    this.fee,
    this.feePercent,
    this.amountWithoutFeeTax,
    this.vat,
    this.vatPercent,
  });

  factory StockOrderInfoDto.fromJson(dynamic json) =>
      _$StockOrderInfoDtoFromJson(json as Map<String, dynamic>);
}

extension StockOrderInfoMapper on StockOrderInfoDto {
  StockOrderInfo toModel() {
    return StockOrderInfo(
        symbol: symbol ?? "",
        quantity: quantity ?? 0,
        price: price ?? 0,
        amountMaximum: amountMaximum ?? 0,
        quantityMaximum: quantityMaximum ?? 0,
        amount: amount ?? 0,
        amountWithoutFee: amountWithoutFee ?? 0,
        fee: fee ?? 0,
        feePercent: feePercent ?? 0,
        amountWithoutFeeTax: amountWithoutFeeTax ?? 0,
        vat: vat ?? 0,
        vatPercent: vatPercent ?? 0);
  }
}
