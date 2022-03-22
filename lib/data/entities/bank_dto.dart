import 'package:json_annotation/json_annotation.dart';
import 'package:trading_module/domain/entities/bank.dart';

part 'bank_dto.g.dart';

@JsonSerializable()
class UserBankDto {
  final int? id;
  final String? userId;
  final String? bankId;
  final String? bankBranchId;
  final String? accountName;
  final String? accountNo;
  final BankDto? bank;

  final String? createdAt;
  final String? updatedAt;

  UserBankDto({
    this.id,
    this.userId,
    this.bankId,
    this.bankBranchId,
    this.accountName,
    this.accountNo,
    this.bank,
    this.createdAt,
    this.updatedAt,
  });

  factory UserBankDto.fromJson(dynamic json) =>
      _$UserBankDtoFromJson(json as Map<String, dynamic>);

  Map<String, dynamic> toJson() => _$UserBankDtoToJson(this);

  static List<UserBankDto> getList(dynamic data) {
    final list = data as List;
    return list
        .map((e) => UserBankDto.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}

extension UserBankMapper on UserBankDto {
  UserBank toModel() {
    return UserBank(
        id: id,
        accountName: accountName,
        accountNo: accountNo,
        bank: bank?.toModel(),
        bankId: bankId,
        createdAt: createdAt,
        updatedAt: updatedAt,
        userId: userId);
  }
}

@JsonSerializable()
class BankDto {
  final int? id;
  final String? code;
  final String? name;
  final String? logo;
  final String? type;

  BankDto({this.id, this.code, this.name, this.logo, this.type});

  factory BankDto.fromJson(dynamic json) =>
      _$BankDtoFromJson(json as Map<String, dynamic>);
}

extension BankMapper on BankDto {
  Bank toModel() {
    return Bank(
        id: id ?? -1, code: code, type: type, name: name, logo: logo);
  }
}
