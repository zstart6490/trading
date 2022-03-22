import 'package:json_annotation/json_annotation.dart';

//import 'package:tikop/base/networking/result.dart';

part 'Bank.g.dart';

@JsonSerializable()
class OurBank {
  final dynamic id;
  final String name;
  final String code;
  @JsonKey(name: "account_number")
  final String? accountNumber;
  @JsonKey(name: "account_name")
  final String? accountName;
  @JsonKey(name: "branch_name")
  final String branchName;
  @JsonKey(name: "image_url")
  final String imageUrl;
  final int? fee;
  final int? order;

  OurBank({
    required this.id,
    required this.name,
    required this.code,
    required this.accountNumber,
    this.accountName,
    required this.branchName,
    required this.imageUrl,
    this.fee,
    this.order,
  });

  static List<OurBank> getList(dynamic map) {
    List list;
    if (map is List) {
      list = map;
    } else {
      list = map["banks"] as List;
    }
    return list
        .map((e) => OurBank.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  factory OurBank.fromJson(Map<String, dynamic> json) =>
      _$OurBankFromJson(json);
  Map<String, dynamic> toJson() => _$OurBankToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Bank {
  final String? id;
  final String? code;
  final String? name;
  @JsonKey(name: "image_url")
  final String? imageUrl;
  final String? type;
  final List<BankBranch>? branches;

  Bank(
      {this.id, this.code, this.name, this.imageUrl, this.type, this.branches});
  factory Bank.fromJson(Map<String, dynamic> json) => _$BankFromJson(json);
  Map<String, dynamic> toJson() => _$BankToJson(this);
}

@JsonSerializable()
class BankBranch {
  final String? id;
  final String? name;

  BankBranch({this.id, this.name});
  factory BankBranch.fromJson(Map<String, dynamic> json) =>
      _$BankBranchFromJson(json);
  Map<String, dynamic> toJson() => _$BankBranchToJson(this);
}

/// Must handler banks in .g file
@JsonSerializable()
class BankData {
  final List<Bank>? banks;
  final String? title;

  BankData({this.banks, this.title});

  factory BankData.fromJson(Map<String, dynamic> json) =>
      _$BankDataFromJson(json);
  Map<String, dynamic> toJson() => _$BankDataToJson(this);
  //
  // factory BankData.fromResult(Result result) =>
  //     _$BankDataFromJson(result.data as Map<String, dynamic>);
}

@JsonSerializable()
class BankDataSection {
  final List<BankData> sections;

  BankDataSection(this.sections);
  factory BankDataSection.fromJson(Map<String, dynamic> json) =>
      _$BankDataSectionFromJson(json);
  Map<String, dynamic> toJson() => _$BankDataSectionToJson(this);
}

@JsonSerializable()
class BankInfo {
  @JsonKey(name: "bank_name")
  final String? bankName;
  @JsonKey(name: "bank_branch")
  final BankBranch? bankBranch;
  @JsonKey(name: "bank_account")
  final String? bankAccount;
  @JsonKey(name: "bank_account_name")
  final String? bankAccountName;
  @JsonKey(name: "created_at")
  final String? createdAt;
  @JsonKey(name: "updated_at")
  final String? updatedAt;
  final String? id;
  @JsonKey(name: "user_id")
  final String? userId;
  final Bank? bank;

  BankInfo({
    this.bankName,
    this.bankBranch,
    this.bankAccount,
    this.bankAccountName,
    this.createdAt,
    this.updatedAt,
    this.id,
    this.userId,
    this.bank,
  });

  factory BankInfo.fromJson(Map<String, dynamic> json) =>
      _$BankInfoFromJson(json);
  Map<String, dynamic> toJson() => _$BankInfoToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UserBank {
  final String? id;
  @JsonKey(name: "user_id")
  final String? userId;
  @JsonKey(name: "bank_id")
  final String? bankId;
  @JsonKey(name: "bank_branch_id")
  final String? bankBranchId;
  @JsonKey(name: "account_name")
  final String? accountName;
  @JsonKey(name: "account_no")
  final String? accountNo;

  final Bank? bank;
  @JsonKey(name: "bank_branch")
  final BankBranch? bankBranch;
  @JsonKey(name: "created_at")
  final String? createdAt;
  @JsonKey(name: "updated_at")
  final String? updatedAt;

  UserBank({
    this.id,
    this.userId,
    this.bankId,
    this.bankBranchId,
    this.accountName,
    this.accountNo,
    this.bank,
    this.bankBranch,
    this.createdAt,
    this.updatedAt,
  });

  static UserBank fromResult(dynamic data) =>
      UserBank.fromJson(data["bank"] as Map<String, dynamic>);
  factory UserBank.fromJson(Map<String, dynamic> json) =>
      _$UserBankFromJson(json);
  Map<String, dynamic> toJson() => _$UserBankToJson(this);
}

@JsonSerializable()
class UserBankData {
  @JsonKey(name: "banks")
  final List<UserBank>? userBanks;

  static UserBankData fromResult(dynamic map) =>
      UserBankData.fromJson(map as Map<String, dynamic>);
  UserBankData({this.userBanks});
  factory UserBankData.fromJson(Map<String, dynamic> json) =>
      _$UserBankDataFromJson(json);
  Map<String, dynamic> toJson() => _$UserBankDataToJson(this);
}

@JsonSerializable()
class ServiceBank {
  final String? id;
  final String? code;
  final String? name;
  @JsonKey(name: "image_url")
  final String? imageUrl;
  final int? type;
  final int? order;
  final List<BankBranch>? branches;

  ServiceBank(this.id, this.code, this.name, this.imageUrl, this.type,
      this.order, this.branches);
  factory ServiceBank.nullData() {
    return ServiceBank("", "", "", "", -1, -1, []);
  }
  factory ServiceBank.fromJson(Map<String, dynamic> json) =>
      _$ServiceBankFromJson(json);
  Map<String, dynamic> toJson() => _$ServiceBankToJson(this);
}

class ServiceBankType {
  List<ServiceBank>? banks;
  final String? title;

  ServiceBankType(
    this.banks,
    this.title,
  );
  factory ServiceBankType.fromMap(Map<String, dynamic> map) {
    List data;
    if (map.containsKey("banks")) {
      data = map['banks'] as List;
    } else if (map.containsKey("banksAll")) {
      data = map['banksAll'] as List;
    } else if (map.containsKey("banksUse")) {
      data = map['banksUse'] as List;
    } else {
      throw Exception();
    }

    return ServiceBankType(
      data.map((x) => ServiceBank.fromJson(x as Map<String, dynamic>)).toList(),
      map['title'] as String?,
    );
  }

  static List<ServiceBankType> getList(dynamic map) {
    final list = map["banks"] as List;
    return list
        .map((e) => ServiceBankType.fromMap(e as Map<String, dynamic>))
        .toList();
  }
}

@JsonSerializable()
class RecurringBank {
  RecurringBank(
    this.id,
    this.name,
    this.code,
    this.imageUrl,
    this.branchName,
    this.accountNo,
    this.accountName,
    // ignore: avoid_positional_boolean_parameters
    this.isVa,
  );

  final String id;
  final String name;
  final String code;
  @JsonKey(name: "image_url")
  final String imageUrl;
  @JsonKey(name: "branch_name")
  final String? branchName;
  @JsonKey(name: "account_no")
  final String? accountNo;
  @JsonKey(name: "account_name")
  final String? accountName;
  @JsonKey(name: "is_va")
  final bool isVa;

  factory RecurringBank.fromJson(Map<String, dynamic> json) =>
      _$RecurringBankFromJson(json);
  Map<String, dynamic> toJson() => _$RecurringBankToJson(this);
}

@JsonSerializable()
class RecurringBankGuide {
  RecurringBankGuide(this.id, this.bankId, this.code, this.name, this.imageUrl);
  final dynamic id;
  @JsonKey(name: "bank_id")
  final String bankId;
  final String code;
  final String name;
  @JsonKey(name: "image_url")
  final String imageUrl;

  static List<RecurringBankGuide> getList(dynamic map) {
    final list = map as List;

    return list
        .map((e) => RecurringBankGuide.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  factory RecurringBankGuide.fromJson(Map<String, dynamic> json) =>
      _$RecurringBankGuideFromJson(json);
  Map<String, dynamic> toJson() => _$RecurringBankGuideToJson(this);
}

@JsonSerializable()
class RecurringBankGuideData {
  RecurringBankGuideData(this.image, this.text);
  final String image;
  final String text;

  static List<RecurringBankGuideData> getList(dynamic map) {
    final list = map as List;

    return list
        .map((e) => RecurringBankGuideData.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  factory RecurringBankGuideData.fromJson(Map<String, dynamic> json) =>
      _$RecurringBankGuideDataFromJson(json);
  Map<String, dynamic> toJson() => _$RecurringBankGuideDataToJson(this);
}
