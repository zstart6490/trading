import 'package:json_annotation/json_annotation.dart';
import 'package:trading_module/domain/entities/stock_transaction_detail.dart';
import 'package:trading_module/utils/enums.dart';

part 'stock_transaction_detail_dto.g.dart';

@JsonSerializable()
class StockTransactionDetailDto {
  String? symbol;
  double? quantity;
  double? price;
  double? amount;
  double? amountWithoutFee;
  double? fee;
  String? transactionCode;
  DateTime? requestTime;
  StockTransactionState? status;

  StockTransactionDetailDto(
      {this.symbol, this.quantity, this.price, this.amount,this.amountWithoutFee,
        this.fee, this.transactionCode, this.requestTime, this.status});

  factory StockTransactionDetailDto.fromJson(dynamic json) =>
      _$StockTransactionDetailDtoFromJson(json as Map<String, dynamic>);

  Map<String, dynamic> toJson() => _$StockTransactionDetailDtoToJson(this);
}

extension StockTransactionDetailMapper on StockTransactionDetailDto{
  StockTransactionDetail toModel() {
    return StockTransactionDetail(symbol: symbol ?? "",
        quantity: quantity ?? 0,
        price: price ?? 0,
        amount: amount ?? 0,
        amountWithoutFee: amountWithoutFee ?? 0,
        fee: fee ?? 0,
        transactionCode: transactionCode ?? "",
        requestTime: requestTime ?? DateTime.now(),
        status: status ?? StockTransactionState.failed);
  }
}