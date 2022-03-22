// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Bank.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OurBank _$OurBankFromJson(Map<String, dynamic> json) => OurBank(
      id: json['id'],
      name: json['name'] as String,
      code: json['code'] as String,
      accountNumber: json['account_number'] as String?,
      accountName: json['account_name'] as String?,
      branchName: json['branch_name'] as String,
      imageUrl: json['image_url'] as String,
      fee: json['fee'] as int?,
      order: json['order'] as int?,
    );

Map<String, dynamic> _$OurBankToJson(OurBank instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'account_number': instance.accountNumber,
      'account_name': instance.accountName,
      'branch_name': instance.branchName,
      'image_url': instance.imageUrl,
      'fee': instance.fee,
      'order': instance.order,
    };

Bank _$BankFromJson(Map<String, dynamic> json) => Bank(
      id: json['id'] as String?,
      code: json['code'] as String?,
      name: json['name'] as String?,
      imageUrl: json['image_url'] as String?,
      type: json['type'] as String?,
      branches: (json['branches'] as List<dynamic>?)
          ?.map((e) => BankBranch.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BankToJson(Bank instance) => <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'image_url': instance.imageUrl,
      'type': instance.type,
      'branches': instance.branches?.map((e) => e.toJson()).toList(),
    };

BankBranch _$BankBranchFromJson(Map<String, dynamic> json) => BankBranch(
      id: json['id'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$BankBranchToJson(BankBranch instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

BankData _$BankDataFromJson(Map<String, dynamic> json) => BankData(
      banks: (json['banks'] as List<dynamic>?)
          ?.map((e) => Bank.fromJson(e as Map<String, dynamic>))
          .toList(),
      title: json['title'] as String?,
    );

Map<String, dynamic> _$BankDataToJson(BankData instance) => <String, dynamic>{
      'banks': instance.banks,
      'title': instance.title,
    };

BankDataSection _$BankDataSectionFromJson(Map<String, dynamic> json) =>
    BankDataSection(
      (json['sections'] as List<dynamic>)
          .map((e) => BankData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BankDataSectionToJson(BankDataSection instance) =>
    <String, dynamic>{
      'sections': instance.sections,
    };

BankInfo _$BankInfoFromJson(Map<String, dynamic> json) => BankInfo(
      bankName: json['bank_name'] as String?,
      bankBranch: json['bank_branch'] == null
          ? null
          : BankBranch.fromJson(json['bank_branch'] as Map<String, dynamic>),
      bankAccount: json['bank_account'] as String?,
      bankAccountName: json['bank_account_name'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      id: json['id'] as String?,
      userId: json['user_id'] as String?,
      bank: json['bank'] == null
          ? null
          : Bank.fromJson(json['bank'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BankInfoToJson(BankInfo instance) => <String, dynamic>{
      'bank_name': instance.bankName,
      'bank_branch': instance.bankBranch,
      'bank_account': instance.bankAccount,
      'bank_account_name': instance.bankAccountName,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'id': instance.id,
      'user_id': instance.userId,
      'bank': instance.bank,
    };

UserBank _$UserBankFromJson(Map<String, dynamic> json) => UserBank(
      id: json['id'] as String?,
      userId: json['user_id'] as String?,
      bankId: json['bank_id'] as String?,
      bankBranchId: json['bank_branch_id'] as String?,
      accountName: json['account_name'] as String?,
      accountNo: json['account_no'] as String?,
      bank: json['bank'] == null
          ? null
          : Bank.fromJson(json['bank'] as Map<String, dynamic>),
      bankBranch: json['bank_branch'] == null
          ? null
          : BankBranch.fromJson(json['bank_branch'] as Map<String, dynamic>),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$UserBankToJson(UserBank instance) => <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'bank_id': instance.bankId,
      'bank_branch_id': instance.bankBranchId,
      'account_name': instance.accountName,
      'account_no': instance.accountNo,
      'bank': instance.bank?.toJson(),
      'bank_branch': instance.bankBranch?.toJson(),
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };

UserBankData _$UserBankDataFromJson(Map<String, dynamic> json) => UserBankData(
      userBanks: (json['banks'] as List<dynamic>?)
          ?.map((e) => UserBank.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserBankDataToJson(UserBankData instance) =>
    <String, dynamic>{
      'banks': instance.userBanks,
    };

ServiceBank _$ServiceBankFromJson(Map<String, dynamic> json) => ServiceBank(
      json['id'] as String?,
      json['code'] as String?,
      json['name'] as String?,
      json['image_url'] as String?,
      json['type'] as int?,
      json['order'] as int?,
      (json['branches'] as List<dynamic>?)
          ?.map((e) => BankBranch.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ServiceBankToJson(ServiceBank instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'image_url': instance.imageUrl,
      'type': instance.type,
      'order': instance.order,
      'branches': instance.branches,
    };

RecurringBank _$RecurringBankFromJson(Map<String, dynamic> json) =>
    RecurringBank(
      json['id'] as String,
      json['name'] as String,
      json['code'] as String,
      json['image_url'] as String,
      json['branch_name'] as String?,
      json['account_no'] as String?,
      json['account_name'] as String?,
      json['is_va'] as bool,
    );

Map<String, dynamic> _$RecurringBankToJson(RecurringBank instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'image_url': instance.imageUrl,
      'branch_name': instance.branchName,
      'account_no': instance.accountNo,
      'account_name': instance.accountName,
      'is_va': instance.isVa,
    };

RecurringBankGuide _$RecurringBankGuideFromJson(Map<String, dynamic> json) =>
    RecurringBankGuide(
      json['id'],
      json['bank_id'] as String,
      json['code'] as String,
      json['name'] as String,
      json['image_url'] as String,
    );

Map<String, dynamic> _$RecurringBankGuideToJson(RecurringBankGuide instance) =>
    <String, dynamic>{
      'id': instance.id,
      'bank_id': instance.bankId,
      'code': instance.code,
      'name': instance.name,
      'image_url': instance.imageUrl,
    };

RecurringBankGuideData _$RecurringBankGuideDataFromJson(
        Map<String, dynamic> json) =>
    RecurringBankGuideData(
      json['image'] as String,
      json['text'] as String,
    );

Map<String, dynamic> _$RecurringBankGuideDataToJson(
        RecurringBankGuideData instance) =>
    <String, dynamic>{
      'image': instance.image,
      'text': instance.text,
    };
