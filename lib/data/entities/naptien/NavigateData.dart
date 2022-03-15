
import 'package:trading_module/data/entities/naptien/Transaction.dart';
import 'package:trading_module/utils/enums.dart';
import 'package:trading_module/utils/util.dart';


import 'Country.dart';
import 'Fund.dart';
import 'Reason.dart';
import 'SavingProduct.dart';
import 'Target.dart';

class NavigateInvestOverview {
  final InvestData investData;
  bool isDeleted;
  bool isEdited;
  bool isFirstCreate;
  bool isCreate;
  bool fromSurvey;
  int? fromCopyTop;

  NavigateInvestOverview({
    required this.investData,
    this.isEdited = false,
    this.isDeleted = false,
    this.isFirstCreate = false,
    this.isCreate = false,
    this.fromSurvey = false,
    this.fromCopyTop,
  });
}

class NavigateInvestModifyData {
  Target target;
  final bool fromSurvey;
  final bool fromList;
  final bool isFirstCreate;
  final bool isCreate;

  NavigateInvestModifyData(
    this.target, {
    this.fromSurvey = false,
    this.fromList = false,
    this.isFirstCreate = false,
    this.isCreate = false,
  });
}

class NavigateWithdrawData {
  final List<Reason> listReason;
  Reason? selectedReason;
  String? transactionId;
  List<SavingProduct>? listSavingProduct;
  Target? selectedTarget;
  TargetData? targetData;
  String? userBankId;

  NavigateWithdrawData({
    required this.listReason,
    this.selectedReason,
    this.transactionId,
    this.listSavingProduct,
    this.selectedTarget,
    this.targetData,
    this.userBankId,
  });

  WithdrawType get withdrawType => _getType();

  WithdrawType _getType() {
    if (selectedTarget != null || targetData != null) {
      return WithdrawType.invest;
    }
    if ((transactionId ?? "").isNotEmpty || listSavingProduct != null) {
      return WithdrawType.saving;
    }
    return WithdrawType.saving;
  }
}

class NavigateBase {
  String phone;
  Country country;
  NavigateBase(this.phone, this.country);

  String get phoneWithDialCode => phone.phoneWithDialCode(country.dialCode);
}

class NavigateAuthenticData extends NavigateBase {
  @override
  String phone;
  @override
  Country country;

  //final OtpData? otpData;
  final bool canChangePhone;
  final bool fromSetting;
  final bool hasEmail;
  String? registerCode;
  String? resetPassCode;
  String? email;
  String? pin;

  bool? fromEmailOTP;

  NavigateAuthenticData({
    required this.phone,
    required this.country,
    //this.otpData,
    this.registerCode,
    this.canChangePhone = true,
    this.fromSetting = false,
    this.resetPassCode,
    this.email,
    this.pin,
    this.hasEmail = false,
    this.fromEmailOTP = false,
  }) : super(phone, country);
}

class NavigateSmartOTPData extends NavigateBase {
  @override
  String phone;
  @override
  Country country;

  SmartOTPType? smartOTPType;
  String? pin;

  NavigateSmartOTPData(
      {required this.phone, required this.country, this.smartOTPType, this.pin})
      : super(phone, country);
}

class NavigateTranDetail {
  Transaction transaction;
  bool hasBtn;
  final bool fromFundDetail;

  NavigateTranDetail(this.transaction,
      {this.hasBtn = false, this.fromFundDetail = false});
}

class NavigateTransferData {
  final int amount;
  final SavingProduct? product;
  final Target? target;
  final List<Fund>? funds;
  SavingProduct? swapProduct;
  Transaction? transaction;
  TransferType? transferType;
  //List<VirtualAccount>? listVA;

  NavigateTransferData(
      {required this.amount,
      this.product,
      this.swapProduct,
      this.target,
      this.funds,
      this.transaction,
      this.transferType,
      //this.listVA
      }
      );
}

class NavigateSavingTransferData {
  int? amount;
  SavingProduct? fromProduct;
  SavingProduct? toProduct;
  Transaction? fromContract;

  NavigateSavingTransferData({
    this.amount,
    this.fromProduct,
    this.toProduct,
    this.fromContract,
  });

  NavigateSavingTransferData copyWith({
    int? amount,
    SavingProduct? fromProduct,
    SavingProduct? toProduct,
    Transaction? fromContract,
  }) {
    return NavigateSavingTransferData(
      amount: amount ?? this.amount,
      fromProduct: fromProduct ?? this.fromProduct,
      toProduct: toProduct ?? this.toProduct,
      fromContract: fromContract ?? this.fromContract,
    );
  }

  @override
  String toString() {
    return 'NavigateSavingTransferData(amount: $amount, fromProduct: $fromProduct, toProduct: $toProduct, fromContract: $fromContract)';
  }
}
