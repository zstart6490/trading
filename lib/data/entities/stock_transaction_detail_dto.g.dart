// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_transaction_detail_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StockTransactionDetailDto _$StockTransactionDetailDtoFromJson(
        Map<String, dynamic> json) =>
    StockTransactionDetailDto(
      id: json['id'] as int?,
      symbol: json['symbol'] as String?,
      quantity: (json['quantity'] as num?)?.toDouble(),
      price: (json['price'] as num?)?.toDouble(),
      amount: (json['amount'] as num?)?.toDouble(),
      amountWithoutFeeVat: (json['amountWithoutFeeVat'] as num?)?.toDouble(),
      fee: (json['fee'] as num?)?.toDouble(),
      feePartner: (json['feePartner'] as num?)?.toDouble(),
      feePartnerPercent: (json['feePartnerPercent'] as num?)?.toDouble(),
      feePercent: (json['feePercent'] as num?)?.toDouble(),
      vatPercent: (json['vatPercent'] as num?)?.toDouble(),
      priceMatch: (json['priceMatch'] as num?)?.toDouble(),
      quantityMatch: (json['quantityMatch'] as num?)?.toDouble(),
      orderType: json['orderType'] as String?,
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
      'id': instance.id,
      'symbol': instance.symbol,
      'quantity': instance.quantity,
      'price': instance.price,
      'amount': instance.amount,
      'amountWithoutFeeVat': instance.amountWithoutFeeVat,
      'fee': instance.fee,
      'feePartner': instance.feePartner,
      'feePartnerPercent': instance.feePartnerPercent,
      'feePercent': instance.feePercent,
      'vatPercent': instance.vatPercent,
      'priceMatch': instance.priceMatch,
      'quantityMatch': instance.quantityMatch,
      'orderType': instance.orderType,
      'transactionCode': instance.transactionCode,
      'requestTime': instance.requestTime?.toIso8601String(),
      'status': _$StockTransactionStateEnumMap[instance.status],
    };

const _$StockTransactionStateEnumMap = {
  StockTransactionState.pending: 0,
  StockTransactionState.partiallyProcessed: 1,
  StockTransactionState.processed: 2,
  StockTransactionState.failed: -1,
  StockTransactionState.block: -2,
};
