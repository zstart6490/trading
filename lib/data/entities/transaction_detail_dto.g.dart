// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_detail_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionDetailDto _$TransactionDetailDtoFromJson(
        Map<String, dynamic> json) =>
    TransactionDetailDto(
      id: json['id'] as String,
      transactionCode: json['transactionCode'] as String?,
      requestAmount: json['requestAmount'] as num?,
      amount: json['amount'] as num?,
      fee: json['fee'] as num?,
      vat: json['vat'] as num?,
      receiveAmount: json['receiveAmount'] as num?,
      name: json['name'] as String?,
      bankName: json['bankName'] as String?,
      bankCode: json['bankCode'] as String?,
      accountName: json['accountName'] as String?,
      accountNo: json['accountNo'] as String?,
      transferType: json['transferType'] as String?,
      feeType: json['feeType'] as String?,
      content: json['content'] as String?,
      methodLabel: json['methodLabel'] as String?,
      fundsLabel: json['fundsLabel'] as String?,
      pendingStatus: json['pendingStatus'] as String?,
      type: $enumDecode(_$TransactionTypeEnumMap, json['type'],
          unknownValue: TransactionType.withdraw),
      method: $enumDecodeNullable(_$TransactionMethodEnumMap, json['method'],
              unknownValue: TransactionMethod.none) ??
          TransactionMethod.bankTransfer,
      status: $enumDecodeNullable(_$TransactionStateEnumMap, json['status'],
              unknownValue: TransactionState.failed) ??
          TransactionState.progressing,
      createDate: DateTime.parse(json['createDate'] as String),
      completed: json['completed'] as bool?,
      statusName: json['statusName'] as String?,
      typeName: json['typeName'] as String?,
    );

Map<String, dynamic> _$TransactionDetailDtoToJson(
        TransactionDetailDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'transactionCode': instance.transactionCode,
      'requestAmount': instance.requestAmount,
      'amount': instance.amount,
      'fee': instance.fee,
      'vat': instance.vat,
      'receiveAmount': instance.receiveAmount,
      'name': instance.name,
      'bankName': instance.bankName,
      'bankCode': instance.bankCode,
      'accountName': instance.accountName,
      'accountNo': instance.accountNo,
      'transferType': instance.transferType,
      'feeType': instance.feeType,
      'content': instance.content,
      'methodLabel': instance.methodLabel,
      'fundsLabel': instance.fundsLabel,
      'pendingStatus': instance.pendingStatus,
      'type': _$TransactionTypeEnumMap[instance.type],
      'method': _$TransactionMethodEnumMap[instance.method],
      'status': _$TransactionStateEnumMap[instance.status],
      'createDate': instance.createDate.toIso8601String(),
      'completed': instance.completed,
      'statusName': instance.statusName,
      'typeName': instance.typeName,
    };

const _$TransactionTypeEnumMap = {
  TransactionType.deposit: 'DEPOSIT',
  TransactionType.withdraw: 'WITHDRAW',
  TransactionType.interest: 'INTEREST',
  TransactionType.limited: 'LIMITED',
  TransactionType.unlimited: 'UNLIMITED',
};

const _$TransactionMethodEnumMap = {
  TransactionMethod.bankTransfer: 'BANK_TRANSFER',
  TransactionMethod.ninePayKeep: '9PAY_KEEP',
  TransactionMethod.ninePayGateWay: '9PAY_GATEWAY',
  TransactionMethod.bankTransferGlobal: 'BANK_TRANSFER_INTERNATIONAL',
  TransactionMethod.paypal: 'PAYPAL',
  TransactionMethod.referral: 'REFERRAL',
  TransactionMethod.renew: 'RENEW',
  TransactionMethod.moveProduct: 'MOVE_PRODUCT',
  TransactionMethod.moveProductFromTarget: 'MOVE_PRODUCT_FROM_TARGET',
  TransactionMethod.moveSavingFromRealEstate: 'MOVE_SAVING_FROM_REAL_ESTATE',
  TransactionMethod.transferSaving: 'TRANSFER_SAVING',
  TransactionMethod.ninePay_withdraw: '9PAY_WITHDRAW',
  TransactionMethod.none: 'none',
};

const _$TransactionStateEnumMap = {
  TransactionState.create: 'CREATED',
  TransactionState.progressing: 'PROCESSING',
  TransactionState.success: 'SUCCESS',
  TransactionState.cancel: 'CANCEL',
  TransactionState.lock: 'LOCK',
  TransactionState.delete: 'DELETED',
  TransactionState.failed: 'failed',
};
