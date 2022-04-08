// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_transaction_detail_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StockTransactionDetailDto _$StockTransactionDetailDtoFromJson(
        Map<String, dynamic> json) =>
    StockTransactionDetailDto(
      symbol: json['symbol'] as String?,
      quantity: (json['quantity'] as num?)?.toDouble(),
      price: (json['price'] as num?)?.toDouble(),
      amount: (json['amount'] as num?)?.toDouble(),
      amountWithoutFee: (json['amountWithoutFee'] as num?)?.toDouble(),
      fee: (json['fee'] as num?)?.toDouble(),
      transactionCode: json['transactionCode'] as String?,
      requestTime: json['requestTime'] == null
          ? null
          : DateTime.parse(json['requestTime'] as String),
      status:
          $enumDecodeNullable(_$StockTransactionStateEnumMap, json['status']),
    );

Map<String, dynamic> _$StockTransactionDetailDtoToJson(
        StockTransactionDetailDto instance) =>
    <String, dynamic>{
      'symbol': instance.symbol,
      'quantity': instance.quantity,
      'price': instance.price,
      'amount': instance.amount,
      'amountWithoutFee': instance.amountWithoutFee,
      'fee': instance.fee,
      'transactionCode': instance.transactionCode,
      'requestTime': instance.requestTime?.toIso8601String(),
      'status': _$StockTransactionStateEnumMap[instance.status],
    };

const _$StockTransactionStateEnumMap = {
  StockTransactionState.pending: 0,
  StockTransactionState.success: 1,
  StockTransactionState.failed: -1,
  StockTransactionState.block: -2,
};
