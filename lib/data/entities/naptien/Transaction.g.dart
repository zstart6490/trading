// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Transaction _$TransactionFromJson(Map<String, dynamic> json) => Transaction(
      isExpired: json['is_expired'] as bool? ?? false,
      ninePayTransId: json['nine_pay_trans_id'] as String?,
      transactionIdDynamic: json['id'],
      userIdDynamic: json['user_id'],
      targetIdDynamic: json['target_id'],
      target: json['target'] == null
          ? null
          : Target.fromJson(json['target'] as Map<String, dynamic>),
      savingTarget: json['saving_target'] == null
          ? null
          : SavingTarget.fromJson(
              json['saving_target'] as Map<String, dynamic>),
      title: json['title'] as String?,
      description: json['description'] as String?,
      content: json['content'] as String?,
      amount: json['amount'] as num?,
      internationalAmount: json['international_amount'] as int? ?? 0,
      periodInterest: json['period_interest'] as int? ?? 0,
      remainAmount: json['remain_amount'] as int? ?? 0,
      interestRate: (json['interest_rate'] as num?)?.toDouble() ?? 0,
      fee: json['fee'] as int? ?? 0,
      total: json['total'] as int? ?? 0,
      paymentDate: json['payment_date'] as String?,
      temporaryInterest: json['temporary_interest'] as int? ?? 0,
      availableInterest: json['available_interest'] as int? ?? 0,
      currencyUnit: json['currency_unit'] as String?,
      type: $enumDecodeNullable(_$TransactionTypeEnumMap, json['type'],
              unknownValue: TransactionType.withdraw) ??
          TransactionType.withdraw,
      method: $enumDecodeNullable(_$TransactionMethodEnumMap, json['method'],
              unknownValue: TransactionMethod.none) ??
          TransactionMethod.none,
      status: $enumDecodeNullable(_$TransactionStateEnumMap, json['status'],
              unknownValue: TransactionState.failed) ??
          TransactionState.failed,
      methodStr: json['methodStr'] as String?,
      info: json['info'] == null
          ? null
          : TransInfo.fromJson(json['info'] as Map<String, dynamic>),
      createAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      vat: json['vat'] as int?,
      transactionType: json['transaction_type'] as String?,
      amountPending: json['amount_pending'] as int? ?? 0,
      minInterest: json['min_interest'] as int? ?? 0,
      minInterestRate: (json['min_interest_rate'] as num?)?.toDouble() ?? 0.0,
      maxInterestRate: (json['max_interest_rate'] as num?)?.toDouble() ?? 0.0,
      maxInterest: (json['max_interest'] as num?)?.toDouble() ?? 0.0,
      durationDynamic: json['duration'],
      period: json['period'] as int? ?? 0,
      icon: json['icon'] as String?,
      productIdDynamic: json['product_id'],
      product: json['product'] == null
          ? null
          : SavingProduct.fromJson(json['product'] as Map<String, dynamic>),
      noticeStatus: json['notice_status'] as String?,
      partner: json['partner'] == null
          ? null
          : Partner.fromJson(json['partner'] as Map<String, dynamic>),
      location: json['location'] == null
          ? null
          : Location.fromJson(json['location'] as Map<String, dynamic>),
      paypalBankEmail: json['paypal_bank_email'] as String?,
      note: json['note'] as String?,
      savingTargetId: json['savingTargetId'] as String?,
      vatPercent: (json['vat_percent'] as num?)?.toDouble() ?? 5.0,
      funds: (json['funds'] as List<dynamic>?)
          ?.map((e) => TransactionFund.fromJson(e as Map<String, dynamic>))
          .toList(),
      buyingFee: json['buying_fee'] as int? ?? 0,
      sellingFee: json['selling_fee'] as int? ?? 0,
      interest: json['interest'] as int?,
      transferFee: json['transfer_fee'] as int? ?? 0,
      withdrawFee: json['withdraw_fee'] as int? ?? 0,
      finalAmount: json['final_amount'] as int? ?? 0,
      childTransaction: json['child_transaction'] == null
          ? null
          : Transaction.fromJson(
              json['child_transaction'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TransactionToJson(Transaction instance) =>
    <String, dynamic>{
      'is_expired': instance.isExpired,
      'id': instance.transactionIdDynamic,
      'nine_pay_trans_id': instance.ninePayTransId,
      'user_id': instance.userIdDynamic,
      'target_id': instance.targetIdDynamic,
      'title': instance.title,
      'description': instance.description,
      'content': instance.content,
      'amount': instance.amount,
      'international_amount': instance.internationalAmount,
      'period_interest': instance.periodInterest,
      'remain_amount': instance.remainAmount,
      'interest_rate': instance.interestRate,
      'fee': instance.fee,
      'total': instance.total,
      'payment_date': instance.paymentDate,
      'temporary_interest': instance.temporaryInterest,
      'available_interest': instance.availableInterest,
      'interest': instance.interest,
      'currency_unit': instance.currencyUnit,
      'methodStr': instance.methodStr,
      'type': _$TransactionTypeEnumMap[instance.type],
      'method': _$TransactionMethodEnumMap[instance.method],
      'status': _$TransactionStateEnumMap[instance.status],
      'info': instance.info,
      'vat': instance.vat,
      'transaction_type': instance.transactionType,
      'amount_pending': instance.amountPending,
      'min_interest': instance.minInterest,
      'min_interest_rate': instance.minInterestRate,
      'max_interest_rate': instance.maxInterestRate,
      'max_interest': instance.maxInterest,
      'duration': instance.durationDynamic,
      'period': instance.period,
      'icon': instance.icon,
      'product_id': instance.productIdDynamic,
      'notice_status': instance.noticeStatus,
      'paypal_bank_email': instance.paypalBankEmail,
      'note': instance.note,
      'savingTargetId': instance.savingTargetId,
      'vat_percent': instance.vatPercent,
      'buying_fee': instance.buyingFee,
      'selling_fee': instance.sellingFee,
      'transfer_fee': instance.transferFee,
      'withdraw_fee': instance.withdrawFee,
      'final_amount': instance.finalAmount,
      'created_at': instance.createAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'target': instance.target,
      'saving_target': instance.savingTarget,
      'product': instance.product,
      'partner': instance.partner,
      'location': instance.location,
      'funds': instance.funds,
      'child_transaction': instance.childTransaction,
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

TransInfo _$TransInfoFromJson(Map<String, dynamic> json) => TransInfo(
      transactionId: json['transaction_id'] as int?,
      bankName: json['bank_name'] as String?,
      bankBranch: json['bank_branch'] as String?,
      bankAccount: json['bank_account'] as String?,
      bankAccountName: json['bank_account_name'] as String?,
      serviceBankName: json['service_bank_name'] as String?,
      serviceBankBranch: json['service_bank_branch'] as String?,
      serviceBankAccount: json['service_bank_account'] as String?,
      serviceBankAccountName: json['service_bank_account_name'] as String?,
      bankImageUrl: json['bank_image_url'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$TransInfoToJson(TransInfo instance) => <String, dynamic>{
      'transaction_id': instance.transactionId,
      'bank_name': instance.bankName,
      'bank_branch': instance.bankBranch,
      'bank_account': instance.bankAccount,
      'bank_account_name': instance.bankAccountName,
      'service_bank_name': instance.serviceBankName,
      'service_bank_branch': instance.serviceBankBranch,
      'service_bank_account': instance.serviceBankAccount,
      'service_bank_account_name': instance.serviceBankAccountName,
      'bank_image_url': instance.bankImageUrl,
      'updated_at': instance.updatedAt,
    };

SavingTarget _$SavingTargetFromJson(Map<String, dynamic> json) => SavingTarget(
      idDynamic: json['id'] as String?,
      transactionId: json['transaction_id'] as String?,
      userId: json['user_id'] as String?,
      targetId: json['target_id'] as String?,
      title: json['title'] as String?,
      titleOrigin: json['title_origin'] as String?,
      description: json['description'] as String?,
      content: json['content'] as String?,
      amount: json['amount'] as int?,
      periodInterest: json['period_interest'] as int?,
      remainAmount: json['remain_amount'] as int?,
      interestRate: (json['interest_rate'] as num?)?.toDouble(),
      fee: json['fee'] as String?,
      total: json['total'] as String?,
      startTime: json['start_time'] == null
          ? null
          : DateTime.parse(json['start_time'] as String),
      endTime: json['end_time'] == null
          ? null
          : DateTime.parse(json['end_time'] as String),
      paymentDate: json['payment_date'] as String?,
      temporaryInterest: json['temporary_interest'] as int?,
      availableInterest: json['available_interest'] as int?,
      currencyUnit: json['currency_unit'] as String?,
      type: json['type'] as String?,
      method: json['method'] as String?,
      info: json['info'] == null
          ? null
          : TransInfo.fromJson(json['info'] as Map<String, dynamic>),
      status: json['status'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      vat: json['vat'] as int?,
      product: json['product'] == null
          ? null
          : SavingProduct.fromJson(json['product'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SavingTargetToJson(SavingTarget instance) =>
    <String, dynamic>{
      'id': instance.idDynamic,
      'transaction_id': instance.transactionId,
      'user_id': instance.userId,
      'target_id': instance.targetId,
      'title': instance.title,
      'title_origin': instance.titleOrigin,
      'description': instance.description,
      'content': instance.content,
      'amount': instance.amount,
      'period_interest': instance.periodInterest,
      'remain_amount': instance.remainAmount,
      'interest_rate': instance.interestRate,
      'fee': instance.fee,
      'total': instance.total,
      'start_time': instance.startTime?.toIso8601String(),
      'end_time': instance.endTime?.toIso8601String(),
      'payment_date': instance.paymentDate,
      'temporary_interest': instance.temporaryInterest,
      'available_interest': instance.availableInterest,
      'currency_unit': instance.currencyUnit,
      'type': instance.type,
      'method': instance.method,
      'info': instance.info,
      'status': instance.status,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'vat': instance.vat,
      'product': instance.product,
    };

Partner _$PartnerFromJson(Map<String, dynamic> json) => Partner(
      id: json['id'] as String?,
      phone: json['phone'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      avatar: json['avatar'] as String?,
      address: json['address'] as String?,
      isActive: json['isActive'] as int?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$PartnerToJson(Partner instance) => <String, dynamic>{
      'id': instance.id,
      'phone': instance.phone,
      'name': instance.name,
      'email': instance.email,
      'avatar': instance.avatar,
      'address': instance.address,
      'isActive': instance.isActive,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

Location _$LocationFromJson(Map<String, dynamic> json) => Location(
      provinceName: json['province_name'] as String?,
      allowCashTransfer: json['allow_cash_transfer'] as int?,
      countryName: json['country_name'] as String?,
      code: json['code'] as String?,
      dialCode: json['dial_code'] as String?,
    );

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'province_name': instance.provinceName,
      'allow_cash_transfer': instance.allowCashTransfer,
      'country_name': instance.countryName,
      'code': instance.code,
      'dial_code': instance.dialCode,
    };

TransferFee _$TransferFeeFromJson(Map<String, dynamic> json) => TransferFee(
      json['amount'],
      json['fee'] as int,
      json['total_amount'] as int,
      json['buying_fee'] as int?,
    );

Map<String, dynamic> _$TransferFeeToJson(TransferFee instance) =>
    <String, dynamic>{
      'amount': instance.amountDynamic,
      'fee': instance.fee,
      'total_amount': instance.totalAmount,
      'buying_fee': instance.buyFee,
    };

TransactionFund _$TransactionFundFromJson(Map<String, dynamic> json) =>
    TransactionFund(
      idDynamic: json['id'],
      transactionId: json['transaction_id'] as int,
      batch: json['batch'] as String?,
      type: json['type'] as String,
      status: $enumDecode(_$TranFunStatusEnumMap, json['status'],
          unknownValue: TranFunStatus.none),
      fundId: json['fund_id'] as int,
      packageId: json['package_id'] as int? ?? 0,
      referId: json['refer_id'] as int? ?? 0,
      percent: (json['percent'] as num?)?.toDouble() ?? 0.0,
      nav: (json['nav'] as num?)?.toDouble() ?? 0.0,
      total: json['total'] as num? ?? 0.0,
      currentTotal: json['current_total'] as num? ?? 0.0,
      originAmount: json['origin_amount'] as num? ?? 0.0,
      amount: json['amount'] as num? ?? 0,
      currentAmount: json['current_amount'] as num? ?? 0,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      fundNavId: json['fund_nav_id'] as int?,
      orderFundId: json['order_fund_id'],
      collectedAt: json['collectedAt'] == null
          ? null
          : DateTime.parse(json['collectedAt'] as String),
      successAt: json['success_at'] == null
          ? null
          : DateTime.parse(json['success_at'] as String),
      fee: json['fee'] as num? ?? 0.0,
      transferFee: json['transfer_fee'] as num? ?? 0,
      fund: json['fund'] == null
          ? null
          : Fund.fromJson(json['fund'] as Map<String, dynamic>),
      currentNav: json['current_nav'] as num? ?? 0,
      profit: json['profit'] as num? ?? 0,
      expectedDate: json['expected_date'] == null
          ? null
          : DateTime.parse(json['expected_date'] as String),
      updateAt: json['update_at'] == null
          ? null
          : DateTime.parse(json['update_at'] as String),
    );

Map<String, dynamic> _$TransactionFundToJson(TransactionFund instance) =>
    <String, dynamic>{
      'id': instance.idDynamic,
      'transaction_id': instance.transactionId,
      'batch': instance.batch,
      'type': instance.type,
      'status': _$TranFunStatusEnumMap[instance.status],
      'fund_id': instance.fundId,
      'package_id': instance.packageId,
      'refer_id': instance.referId,
      'percent': instance.percent,
      'nav': instance.nav,
      'total': instance.total,
      'current_total': instance.currentTotal,
      'origin_amount': instance.originAmount,
      'amount': instance.amount,
      'current_amount': instance.currentAmount,
      'fund_nav_id': instance.fundNavId,
      'order_fund_id': instance.orderFundId,
      'fee': instance.fee,
      'transfer_fee': instance.transferFee,
      'current_nav': instance.currentNav,
      'profit': instance.profit,
      'expected_date': instance.expectedDate?.toIso8601String(),
      'update_at': instance.updateAt?.toIso8601String(),
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'collectedAt': instance.collectedAt?.toIso8601String(),
      'success_at': instance.successAt?.toIso8601String(),
      'fund': instance.fund,
    };

const _$TranFunStatusEnumMap = {
  TranFunStatus.none: 'none',
  TranFunStatus.cancel: 'CANCELED',
  TranFunStatus.success: 'SUCCEED',
  TranFunStatus.progressing: 'PROCESSING',
  TranFunStatus.collected: 'COLLECTED',
  TranFunStatus.created: 'CREATED',
};
