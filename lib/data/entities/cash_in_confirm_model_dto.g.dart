// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cash_in_confirm_model_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CashInConfirmModelDTO _$CashInConfirmModelDTOFromJson(
        Map<String, dynamic> json) =>
    CashInConfirmModelDTO(
      id: json['id'] as String?,
      requestAmount: json['requestAmount'] as int?,
      amount: json['amount'] as int?,
      fee: json['fee'] as int?,
      vat: json['vat'] as int?,
      discount: json['discount'],
      name: json['name'] as String?,
      type: json['type'] as String?,
      bankCode: json['bankCode'],
      transferType: json['transferType'] as String?,
      transferCode: json['transferCode'] as String?,
      feeType: json['feeType'] as String?,
      content: json['content'],
      status: json['status'] as String?,
      createDate: json['createDate'] as String?,
      updateDate: json['updateDate'] as String?,
      refId: json['refId'],
      parentId: json['parentId'] as String?,
      plus: json['plus'] as bool?,
      icon: json['icon'] as String?,
      method: json['method'],
      banks: (json['data'] as List<dynamic>?)
          ?.map((e) => BankCashInModelDTO.fromJson(e))
          .toList(),
      redirectUrl: json['redirectUrl'] as String?,
      order: json['order'],
      fromUserId: json['fromUserId'] as int?,
      toUserId: json['toUserId'] as int?,
      fromUserBalance: json['fromUserBalance'] as int?,
      toUserBalance: json['toUserBalance'] as int?,
      linkBanks: json['linkBanks'],
      total: json['total'] as int?,
      typeName: json['typeName'] as String?,
      completed: json['completed'] as bool?,
      statusName: json['statusName'] as String?,
      disable: json['disable'] as bool?,
      free: json['free'] as bool?,
      balanceFromUser: json['balanceFromUser'] as int?,
      totalBalanceFromUser: json['totalBalanceFromUser'] as int?,
      totalBalanceToUser: json['totalBalanceToUser'] as int?,
    );

Map<String, dynamic> _$CashInConfirmModelDTOToJson(
        CashInConfirmModelDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'requestAmount': instance.requestAmount,
      'amount': instance.amount,
      'fee': instance.fee,
      'vat': instance.vat,
      'discount': instance.discount,
      'name': instance.name,
      'type': instance.type,
      'bankCode': instance.bankCode,
      'transferType': instance.transferType,
      'transferCode': instance.transferCode,
      'feeType': instance.feeType,
      'content': instance.content,
      'status': instance.status,
      'createDate': instance.createDate,
      'updateDate': instance.updateDate,
      'refId': instance.refId,
      'parentId': instance.parentId,
      'plus': instance.plus,
      'icon': instance.icon,
      'method': instance.method,
      'data': instance.banks,
      'redirectUrl': instance.redirectUrl,
      'order': instance.order,
      'fromUserId': instance.fromUserId,
      'toUserId': instance.toUserId,
      'fromUserBalance': instance.fromUserBalance,
      'toUserBalance': instance.toUserBalance,
      'linkBanks': instance.linkBanks,
      'total': instance.total,
      'typeName': instance.typeName,
      'completed': instance.completed,
      'statusName': instance.statusName,
      'disable': instance.disable,
      'free': instance.free,
      'balanceFromUser': instance.balanceFromUser,
      'totalBalanceFromUser': instance.totalBalanceFromUser,
      'totalBalanceToUser': instance.totalBalanceToUser,
    };

BankCashInModelDTO _$BankCashInModelDTOFromJson(Map<String, dynamic> json) =>
    BankCashInModelDTO(
      id: json['id'] as String?,
      name: json['name'] as String?,
      code: json['code'] as String?,
      imageUrl: json['imageUrl'] as String?,
      branchName: json['branchName'] as String?,
      accountNo: json['accountNo'] as String?,
      accountName: json['accountName'] as String?,
      va: json['va'] as bool?,
    );

Map<String, dynamic> _$BankCashInModelDTOToJson(BankCashInModelDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'imageUrl': instance.imageUrl,
      'branchName': instance.branchName,
      'accountNo': instance.accountNo,
      'accountName': instance.accountName,
      'va': instance.va,
    };
