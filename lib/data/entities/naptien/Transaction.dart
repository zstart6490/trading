import 'package:get/get.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:tikop/models/SavingProduct.dart';
import 'package:tikop/modules/main_provider.dart';
import 'package:tikop/services/server_config.dart';
import 'package:tikop/utils/enums.dart';
import 'package:tikop/utils/util.dart';

import 'Fund.dart';
import 'Target.dart';

part 'Transaction.g.dart';

@JsonSerializable()
class Transaction {
  @JsonKey(name: "is_expired", defaultValue: false)
  final bool isExpired;
  @JsonKey(name: "id")
  final dynamic transactionIdDynamic;
  @JsonKey(name: "nine_pay_trans_id")
  final String? ninePayTransId;
  @JsonKey(name: "user_id")
  final dynamic userIdDynamic;
  @JsonKey(name: "target_id")
  final dynamic targetIdDynamic;
  final String? title;
  final String? description;
  final String? content;
  @JsonKey(name: "amount")
  final num? amount;
  @JsonKey(name: "international_amount", defaultValue: 0)
  final int internationalAmount;
  @JsonKey(name: "period_interest", defaultValue: 0)
  final int periodInterest;
  @JsonKey(name: "remain_amount", defaultValue: 0)
  final int remainAmount;
  @JsonKey(name: "interest_rate", defaultValue: 0)
  final double interestRate;
  @JsonKey(defaultValue: 0)
  final int fee;
  @JsonKey(defaultValue: 0)
  final int total;
  @JsonKey(name: "payment_date")
  final String? paymentDate;
  @JsonKey(name: "temporary_interest", defaultValue: 0)
  final int temporaryInterest;
  @JsonKey(name: "available_interest", defaultValue: 0)
  final int availableInterest;
  @JsonKey(name: "interest")
  final int? interest;
  @JsonKey(name: "currency_unit")
  final String? currencyUnit;
  @JsonKey(name: "methodStr")
  final String? methodStr;

  @JsonKey(unknownEnumValue: TransactionType.withdraw)
  final TransactionType type;
  @JsonKey(unknownEnumValue: TransactionMethod.none)
  final TransactionMethod method;
  @JsonKey(unknownEnumValue: TransactionState.failed)
  final TransactionState status;

  final TransInfo? info;

  final int? vat;
  @JsonKey(name: "transaction_type")
  final String? transactionType;
  @JsonKey(name: "amount_pending", defaultValue: 0)
  final int amountPending;
  @JsonKey(name: "min_interest", defaultValue: 0)
  final int minInterest;
  @JsonKey(name: "min_interest_rate", defaultValue: 0.0)
  final double minInterestRate;
  @JsonKey(name: "max_interest_rate", defaultValue: 0.0)
  final double maxInterestRate;
  @JsonKey(name: "max_interest", defaultValue: 0.0)
  final double maxInterest;
  @JsonKey(name: "duration")
  final dynamic durationDynamic;
  @JsonKey(defaultValue: 0)
  final int period;
  final String? icon;
  @JsonKey(name: "product_id")
  final dynamic productIdDynamic;
  @JsonKey(name: "notice_status")
  final String? noticeStatus;
  @JsonKey(name: "paypal_bank_email")
  final String? paypalBankEmail;
  final String? note;
  final String? savingTargetId;
  @JsonKey(name: "vat_percent", defaultValue: 5.0)
  final double vatPercent;
  @JsonKey(name: "buying_fee", defaultValue: 0)
  final int buyingFee;
  @JsonKey(name: "selling_fee", defaultValue: 0)
  final int sellingFee;
  @JsonKey(name: "transfer_fee", defaultValue: 0)
  final int transferFee;
  @JsonKey(name: "withdraw_fee", defaultValue: 0)
  final int withdrawFee;
  @JsonKey(name: "final_amount", defaultValue: 0)
  final int finalAmount;

  /// UTC time. Need convert to local
  @JsonKey(name: "created_at")
  final DateTime? createAt;
  @JsonKey(name: "updated_at")
  final DateTime? updatedAt;

  ///Object
  final Target? target;
  @JsonKey(name: "saving_target")
  final SavingTarget? savingTarget;
  @JsonKey(name: "product")
  final SavingProduct? product;
  final Partner? partner;
  final Location? location;
  final List<TransactionFund>? funds;
  @JsonKey(name: "child_transaction")
  final Transaction? childTransaction;

  Transaction(
      {this.isExpired = true,
      this.ninePayTransId,
      this.transactionIdDynamic,
      this.userIdDynamic,
      this.targetIdDynamic,
      this.target,
      this.savingTarget,
      this.title,
      this.description,
      this.content,
      this.amount,
      this.internationalAmount = 0,
      this.periodInterest = 0,
      this.remainAmount = 0,
      this.interestRate = 0,
      this.fee = 0,
      this.total = 0,
      this.paymentDate,
      this.temporaryInterest = 0,
      this.availableInterest = 0,
      this.currencyUnit,
      this.type = TransactionType.withdraw,
      this.method = TransactionMethod.none,
      this.status = TransactionState.failed,
      this.methodStr,
      this.info,
      this.createAt,
      this.updatedAt,
      this.vat,
      this.transactionType,
      this.amountPending = 0,
      this.minInterest = 0,
      this.minInterestRate = 0,
      this.maxInterestRate = 0,
      this.maxInterest = 0,
      this.durationDynamic,
      this.period = 0,
      this.icon,
      this.productIdDynamic,
      this.product,
      this.noticeStatus,
      this.partner,
      this.location,
      this.paypalBankEmail,
      this.note,
      this.savingTargetId,
      this.vatPercent = 5.0,
      this.funds,
      this.buyingFee = 0,
      this.sellingFee = 0,
      this.interest,
      this.transferFee = 0,
      this.withdrawFee = 0,
      this.finalAmount = 0,
      this.childTransaction});

  String get productId => "$productIdDynamic";
  String get transactionId => "$transactionIdDynamic";
  String get userId => "$userIdDynamic";
  String get targetId => "$targetIdDynamic";

  String get interestTitle => isExpired ? "Lãi đến hôm nay" : "Tiền lãi";
  bool get isBank =>
      method == TransactionMethod.bankTransfer ||
      method == TransactionMethod.ninePayKeep;
  bool get hasFunds => funds != null && funds!.isNotEmpty;

  TransactionType get getType => type;
  TransactionState get getState => status;
  TransactionMethod get getMethod => method;

  bool get isEnd =>
      remainAmount <= 0 && temporaryInterest <= 0 && availableInterest <= 0;
  bool get isLimited => type == TransactionType.limited;

  bool get canWithdraw =>
      remainAmount + availableInterest + temporaryInterest > 0;
  int get withdrawDisplayMoney => _getWithdrawDisplayMoney();
  int get withdrawTotalMoney => _getWithdrawDisplayMoney();

  DateTime? get createDate => createAt?.toLocal();

  num get getTotalAmount => _getTotalAmount();

  bool get isUnfinishDeposit =>
      type == TransactionType.deposit &&
      method != TransactionMethod.moveProductFromTarget &&
      (status == TransactionState.create ||
          status == TransactionState.progressing);

  static List<Transaction> toList(dynamic data) {
    final list = data["transactions"] as List;
    return list
        .map((obj) => Transaction.fromJson(obj as Map<String, dynamic>))
        .toList();
  }

  static Transaction fromResult(dynamic data) {
    if (data['transaction'] != null) {
      return Transaction.fromJson(data["transaction"] as Map<String, dynamic>);
    } else if (data["contract"] != null) {
      return Transaction.fromJson(data["contract"] as Map<String, dynamic>);
    } else if (data["methods"] != null) {
      return Transaction.fromJson(data["methods"] as Map<String, dynamic>);
    } else if (data["saving_account"] != null) {
      return Transaction.fromJson(
          data["saving_account"] as Map<String, dynamic>);
    } else {
      throw UnimplementedError();
    }
  }

  factory Transaction.fromJson(Map<String, dynamic> json) =>
      _$TransactionFromJson(json);
  Map<String, dynamic> toJson() => _$TransactionToJson(this);

  int _getWithdrawDisplayMoney() {
    var total = 0;
    if (isLimited) {
      if (isExpired) {
        total = remainAmount +
            availableInterest +
            // temporaryInterest +
            periodInterest +
            maxInterest.floor();
      } else {
        total = remainAmount + minInterest;
      }
    } else {
      total =
          remainAmount + availableInterest + temporaryInterest + periodInterest;
    }
    return total;
  }

  factory Transaction.interest(
      {required int remainAmount,
      required String productId,
      String icon = "assets/images/png/ic_product_normal.png"}) {
    return Transaction(
        transactionIdDynamic: "@all$productId",
        title: "Tổng tiền lãi",
        remainAmount: remainAmount,
        icon: icon,
        type: TransactionType.interest,
        amount: 0,
        isExpired: false);
  }

  num _getTotalAmount() {
    return (amount ?? 0.0) + (interest ?? 0) - (vat ?? 0);
  }

  String? get getMethodDisplay => _getMethodDisplay();

  String? _getMethodDisplay() {
    if (ServerConfig().isProduct) {
      if (methodStr.hasText) {
        return methodStr;
      } else {
        return Get.find<MainProvider>()
            .getMethodDisplay(getMethod, type: getType);
      }
    } else {
      if (methodStr.hasText) {
        return "$methodStr BE";
      } else {
        return "${Get.find<MainProvider>().getMethodDisplay(getMethod, type: getType)} FE";
      }
    }
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Transaction &&
        other.transactionIdDynamic == transactionIdDynamic;
  }

  @override
  int get hashCode {
    return transactionIdDynamic.hashCode;
  }
}

@JsonSerializable()
class TransInfo {
  @JsonKey(name: "transaction_id")
  final int? transactionId;
  @JsonKey(name: "bank_name")
  final String? bankName;
  @JsonKey(name: "bank_branch")
  final String? bankBranch;
  @JsonKey(name: "bank_account")
  final String? bankAccount;
  @JsonKey(name: "bank_account_name")
  final String? bankAccountName;

  @JsonKey(name: "service_bank_name")
  final String? serviceBankName;
  @JsonKey(name: "service_bank_branch")
  final String? serviceBankBranch;
  @JsonKey(name: "service_bank_account")
  final String? serviceBankAccount;
  @JsonKey(name: "service_bank_account_name")
  final String? serviceBankAccountName;
  @JsonKey(name: "bank_image_url")
  final String? bankImageUrl;
  @JsonKey(name: "updated_at")
  final String? updatedAt;

  TransInfo({
    this.transactionId,
    this.bankName,
    this.bankBranch,
    this.bankAccount,
    this.bankAccountName,
    this.serviceBankName,
    this.serviceBankBranch,
    this.serviceBankAccount,
    this.serviceBankAccountName,
    this.bankImageUrl,
    this.updatedAt,
  });

  factory TransInfo.fromJson(Map<String, dynamic> json) =>
      _$TransInfoFromJson(json);
  Map<String, dynamic> toJson() => _$TransInfoToJson(this);
}

@JsonSerializable()
class SavingTarget {
  @JsonKey(name: "id")
  final String? idDynamic;
  @JsonKey(name: "transaction_id")
  final String? transactionId;
  @JsonKey(name: "user_id")
  final String? userId;
  @JsonKey(name: "target_id")
  final String? targetId;
  final String? title;
  @JsonKey(name: "title_origin")
  final String? titleOrigin;
  final String? description;
  final String? content;
  final int? amount;
  @JsonKey(name: "period_interest")
  final int? periodInterest;
  @JsonKey(name: "remain_amount")
  final int? remainAmount;
  @JsonKey(name: "interest_rate")
  final double? interestRate;
  final String? fee;
  final String? total;
  @JsonKey(name: "start_time")
  final DateTime? startTime;
  @JsonKey(name: "end_time")
  final DateTime? endTime;
  @JsonKey(name: "payment_date")
  final String? paymentDate;
  @JsonKey(name: "temporary_interest")
  final int? temporaryInterest;
  @JsonKey(name: "available_interest")
  final int? availableInterest;
  @JsonKey(name: "currency_unit")
  final String? currencyUnit;
  final String? type;
  final String? method;
  final TransInfo? info;
  final String? status;
  @JsonKey(name: "created_at")
  final String? createdAt;
  @JsonKey(name: "updated_at")
  final String? updatedAt;
  final int? vat;
  @JsonKey(name: "product")
  final SavingProduct? product;

  SavingTarget({
    this.idDynamic,
    this.transactionId,
    this.userId,
    this.targetId,
    this.title,
    this.titleOrigin,
    this.description,
    this.content,
    this.amount,
    this.periodInterest,
    this.remainAmount,
    this.interestRate,
    this.fee,
    this.total,
    this.startTime,
    this.endTime,
    this.paymentDate,
    this.temporaryInterest,
    this.availableInterest,
    this.currencyUnit,
    this.type,
    this.method,
    this.info,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.vat,
    this.product,
  });

  String get id => idDynamic.toString();
  factory SavingTarget.fromJson(Map<String, dynamic> json) =>
      _$SavingTargetFromJson(json);
  Map<String, dynamic> toJson() => _$SavingTargetToJson(this);
}

@JsonSerializable()
class Partner {
  Partner({
    this.id,
    this.phone,
    this.name,
    this.email,
    this.avatar,
    this.address,
    this.isActive,
    this.createdAt,
    this.updatedAt,
  });

  final String? id;
  final String? phone;
  final String? name;
  final String? email;
  final String? avatar;
  final String? address;
  final int? isActive;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory Partner.fromJson(Map<String, dynamic> json) =>
      _$PartnerFromJson(json);
  Map<String, dynamic> toJson() => _$PartnerToJson(this);
}

@JsonSerializable()
class Location {
  Location({
    this.provinceName,
    this.allowCashTransfer,
    this.countryName,
    this.code,
    this.dialCode,
  });
  @JsonKey(name: "province_name")
  final String? provinceName;
  @JsonKey(name: "allow_cash_transfer")
  final int? allowCashTransfer;
  @JsonKey(name: "country_name")
  final String? countryName;
  @JsonKey(name: "code")
  final String? code;
  @JsonKey(name: "dial_code")
  final String? dialCode;
  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);
  Map<String, dynamic> toJson() => _$LocationToJson(this);
}

@JsonSerializable()
class TransferFee {
  @JsonKey(name: "amount")
  final dynamic amountDynamic;
  final int fee;
  @JsonKey(name: "total_amount")
  final int totalAmount;
  @JsonKey(name: "buying_fee")
  final int? buyFee;

  TransferFee(this.amountDynamic, this.fee, this.totalAmount, this.buyFee);

  @JsonKey(ignore: true)
  int get amount => int.tryParse("$amountDynamic") ?? 0;
  static TransferFee fromResult(dynamic map) =>
      TransferFee.fromJson(map as Map<String, dynamic>);
  factory TransferFee.fromJson(Map<String, dynamic> json) =>
      _$TransferFeeFromJson(json);
  Map<String, dynamic> toJson() => _$TransferFeeToJson(this);
}

@JsonSerializable()
class TransactionFund {
  @JsonKey(name: "id")
  final dynamic idDynamic;
  @JsonKey(name: "transaction_id")
  final int transactionId;
  final String? batch;
  final String type;
  @JsonKey(name: "status", unknownEnumValue: TranFunStatus.none)
  final TranFunStatus status;
  @JsonKey(name: "fund_id")
  final int fundId;
  @JsonKey(name: "package_id", defaultValue: 0)
  final int packageId;
  @JsonKey(name: "refer_id", defaultValue: 0)
  final int referId;
  @JsonKey(name: "percent", defaultValue: 0.0)
  final double percent;
  @JsonKey(name: "nav", defaultValue: 0.0)
  final double nav;
  @JsonKey(name: "total", defaultValue: 0.0)
  final num total;
  @JsonKey(name: "current_total", defaultValue: 0.0)
  final num currentTotal;
  @JsonKey(name: "origin_amount", defaultValue: 0.0)
  final num originAmount;
  @JsonKey(name: "amount", defaultValue: 0)
  final num amount;
  @JsonKey(name: "current_amount", defaultValue: 0)
  final num currentAmount;

  @JsonKey(name: "fund_nav_id")
  final int? fundNavId;
  @JsonKey(name: "order_fund_id")
  final dynamic orderFundId;

  @JsonKey(name: "fee", defaultValue: 0.0)
  final num fee;
  @JsonKey(name: "transfer_fee", defaultValue: 0)
  final num transferFee;
  @JsonKey(name: "current_nav", defaultValue: 0)
  final num currentNav;
  @JsonKey(name: "profit", defaultValue: 0)
  final num profit;
  @JsonKey(name: "expected_date")
  final DateTime? expectedDate;
  @JsonKey(name: "update_at")
  final DateTime? updateAt;
  @JsonKey(name: "created_at")
  final DateTime? createdAt;
  @JsonKey(name: "updated_at")
  final DateTime? updatedAt;
  @JsonKey(name: "collectedAt")
  final DateTime? collectedAt;
  @JsonKey(name: "success_at")
  final DateTime? successAt;
  final Fund? fund;
  TransactionFund({
    required this.idDynamic,
    required this.transactionId,
    this.batch,
    required this.type,
    required this.status,
    required this.fundId,
    this.packageId = 0,
    this.referId = 0,
    this.percent = 0.0,
    this.nav = 0,
    this.total = 0,
    this.currentTotal = 0,
    this.originAmount = 0,
    this.amount = 0,
    this.currentAmount = 0,
    this.createdAt,
    this.updatedAt,
    this.fundNavId,
    this.orderFundId,
    this.collectedAt,
    this.successAt,
    this.fee = 0,
    this.transferFee = 0,
    required this.fund,
    required this.currentNav,
    required this.profit,
    this.expectedDate,
    this.updateAt,
  });

  static List<TransactionFund> toList(dynamic data) {
    final list = data["user_transaction_funds"] as List;
    return list
        .map((obj) => TransactionFund.fromJson(obj as Map<String, dynamic>))
        .toList();
  }

  factory TransactionFund.fromJson(Map<String, dynamic> json) =>
      _$TransactionFundFromJson(json);
  Map<String, dynamic> toJson() => _$TransactionFundToJson(this);
}
