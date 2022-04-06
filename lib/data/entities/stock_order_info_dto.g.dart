// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_order_info_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StockOrderInfoDto _$StockOrderInfoDtoFromJson(Map<String, dynamic> json) =>
    StockOrderInfoDto(
      symbol: json['symbol'] as String?,
      quantity: (json['quantity'] as num?)?.toDouble(),
      price: (json['price'] as num?)?.toDouble(),
      amountMaximum: (json['amountMaximum'] as num?)?.toDouble(),
      quantityMaximum: (json['quantityMaximum'] as num?)?.toDouble(),
      amount: (json['amount'] as num?)?.toDouble(),
      amountWithoutFee: (json['amountWithoutFee'] as num?)?.toDouble(),
      fee: (json['fee'] as num?)?.toDouble(),
      feePercent: (json['feePercent'] as num?)?.toDouble(),
      amountWithoutFeeTax: (json['amountWithoutFeeTax'] as num?)?.toDouble(),
      vat: (json['vat'] as num?)?.toDouble(),
      vatPercent: (json['vatPercent'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$StockOrderInfoDtoToJson(StockOrderInfoDto instance) =>
    <String, dynamic>{
      'symbol': instance.symbol,
      'quantity': instance.quantity,
      'price': instance.price,
      'amountMaximum': instance.amountMaximum,
      'quantityMaximum': instance.quantityMaximum,
      'amount': instance.amount,
      'amountWithoutFee': instance.amountWithoutFee,
      'fee': instance.fee,
      'feePercent': instance.feePercent,
      'amountWithoutFeeTax': instance.amountWithoutFeeTax,
      'vat': instance.vat,
      'vatPercent': instance.vatPercent,
    };
