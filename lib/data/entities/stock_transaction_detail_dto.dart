import 'package:json_annotation/json_annotation.dart';
import 'package:trading_module/domain/entities/stock_transaction_detail.dart';
import 'package:trading_module/domain/entities/stock_transaction_history.dart';
import 'package:trading_module/utils/enums.dart';

part 'stock_transaction_detail_dto.g.dart';

@JsonSerializable()
class StockTransactionDetailDto {
  int? id;
  String? symbol;
  double? quantity;
  double? price;
  double? amount;
  double? amountWithoutFeeVat;
  double? fee;
  double? feePartner;
  double? feePartnerPercent;
  double? feePercent;
  double? vatPercent;
  double? priceMatch;
  double? quantityMatch;
  String? orderType;
  String? transactionCode;
  DateTime? requestTime;
  StockTransactionState? status;

  StockTransactionDetailDto(
      {this.id,
      this.symbol,
      this.quantity,
      this.price,
      this.amount,
      this.amountWithoutFeeVat,
      this.fee,
      this.feePartner,
      this.feePartnerPercent,
      this.feePercent,
      this.vatPercent,
      this.priceMatch,
      this.quantityMatch,
      this.orderType,
      this.transactionCode,
      this.requestTime,
      this.status});

  factory StockTransactionDetailDto.fromJson(dynamic json) =>
      _$StockTransactionDetailDtoFromJson(json as Map<String, dynamic>);

  Map<String, dynamic> toJson() => _$StockTransactionDetailDtoToJson(this);
}

extension StockTransactionDetailMapper on StockTransactionDetailDto {
  StockTransactionDetail toModel() {
    return StockTransactionDetail(
        symbol: symbol ?? "",
        quantity: quantity ?? 0,
        quantityMatch: quantityMatch ?? 0,
        priceMatch: priceMatch ?? 0,
        price: price ?? 0,
        amount: amount ?? 0,
        amountWithoutFeeVat: amountWithoutFeeVat ?? 0,
        fee: fee ?? 0,
        feePartner: feePartner ?? 0,
        feePartnerPercent: feePartnerPercent ?? 0,
        feePercent: feePercent ?? 0,
        vatPercent: vatPercent ?? 0,
        transactionCode: transactionCode ?? "",
        requestTime: requestTime ?? DateTime.now(),
        status: status ?? StockTransactionState.failed);
  }
}

extension StockTransactionHistoryMapper on StockTransactionDetailDto {
  StockTransactionHistory toHistoryModel() {
    return StockTransactionHistory(
        id: id ?? 0,
        symbol: symbol ?? "",
        quantity: quantity ?? 0,
        price: price ?? 0,
        orderType: orderType ?? "BUY",
        priceMatch: priceMatch ?? 0,
        quantityMatch: quantityMatch ?? 0,
        requestTime: requestTime ?? DateTime.now(),
        status: status ?? StockTransactionState.failed);
  }
}
