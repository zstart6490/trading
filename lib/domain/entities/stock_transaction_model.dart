import 'package:get/get.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:trading_module/utils/enums.dart';



const REAL_ESTATE = 'REAL_ESTATE';
const SAVING = 'SAVING';
const INVEST = 'INVEST';

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
  @JsonKey(name: "saving_target")
  final SavingTarget? savingTarget;
  final Partner? partner;
  final Location? location;
  final List<TransactionFund>? funds;
  @JsonKey(name: "child_transaction")
  final Transaction? childTransaction;
  @JsonKey(name: "real_estate_info")
  final TransactionRsInfo? realEstateInfo;
  @JsonKey(name: "transaction_name")
  final String? transactionName;
  @JsonKey(name: "landing_name")
  final String? landingName;
  @JsonKey(name: "total_plot")
  final int? totalPlot;
  Transaction({
    this.isExpired = true,
    this.ninePayTransId,
    this.transactionIdDynamic,
    this.userIdDynamic,
    this.targetIdDynamic,
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
    this.childTransaction,
    this.realEstateInfo,
    this.transactionName,
    this.landingName,
    this.totalPlot,
  });

  String get productId => "$productIdDynamic";
  String get transactionId => "$transactionIdDynamic";
  String get userId => "$userIdDynamic";
  String get targetId => "$targetIdDynamic";

  String get interestTitle => isExpired ? "Lãi đến hôm nay" : "Tiền lãi";
  bool get isBank =>
      method == TransactionMethod.bankTransfer ||
          method == TransactionMethod.ninePayKeep;
  bool get hasFunds => funds != null && funds!.isNotEmpty;

  ///TODO improve change to enum
  bool get isInvest => transactionType == INVEST;
  bool get isSaving => transactionType == SAVING;
  bool get isRealEstate => transactionType == REAL_ESTATE;
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

  ///Số tiền hiển thị ở
  ///Transaction Cell
  ///Transition Status
  ///TODO check ảnh hưởng thuế + phí
  num get displayAmount {
    if (type == TransactionType.deposit) {
      return amount ?? finalAmount;
    } else if (isInvest) {
      return amount ?? finalAmount;
    } else {
      return finalAmount;
    }
  }

  factory Transaction.defaultTransaction() {
    return Transaction();
  }

  bool get isUnFinishDeposit =>
      type == TransactionType.deposit &&
          method != TransactionMethod.moveProductFromTarget &&
          (status == TransactionState.create ||
              status == TransactionState.progressing);





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
  });

  String get id => idDynamic.toString();

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
    required this.currentNav,
    required this.profit,
    this.expectedDate,
    this.updateAt,
  });


}

@JsonSerializable()
class TransactionRsInfo {
  TransactionRsInfo({
    required this.contractCode,
    required this.fromContract,
    required this.amount,
    required this.plot,
    this.interestRate,
    this.interest,
    this.vat,
    required this.transferCode,
    required this.moneyActuallyReceived,
    required this.isEarlyWithdrawal,
    this.totalMoney,
  });

  @JsonKey(name: "contract_code")
  final String contractCode;

  @JsonKey(name: "from_contract")
  final String fromContract;
  final int amount;
  @JsonKey(name: "interest_rate")
  final num? interestRate;
  @JsonKey(name: "interest")
  final num? interest;
  final num? vat;
  @JsonKey(name: "total_plot")
  final int plot;
  @JsonKey(name: "transfer_code")
  final String transferCode;
  @JsonKey(name: "money_actually_received")
  final num moneyActuallyReceived;

  @JsonKey(name: "is_early_withdrawal", defaultValue: false)
  final bool isEarlyWithdrawal;
  @JsonKey(name: "total_money")
  final int? totalMoney;
}
