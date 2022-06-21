import 'package:get/get.dart';
import 'package:trading_module/configs/constants.dart';
import 'package:trading_module/cores/states/base_controller.dart';
import 'package:trading_module/domain/entities/bank.dart';
import 'package:trading_module/domain/entities/info_withdraw.dart';
import 'package:trading_module/domain/use_cases/withdraw_usecase.dart';
import 'package:trading_module/pages/smart_otp/base_check_smart_otp.dart';
import 'package:trading_module/routes/app_routes.dart';
import 'package:trading_module/utils/enums.dart';

class WithdrawController extends BaseController with BaseCheckSmartOTP {
  final InfoWithdraw withdrawInfo;
  final WithdrawUseCase _withdrawUseCase = Get.find<WithdrawUseCase>();

  WithdrawController(this.withdrawInfo);

  Rx<UserBank?> selectedBank = Rx<UserBank?>(null);
  RxList<UserBank> userBanks = <UserBank>[].obs;

  @override
  void onReady() {
    if (withdrawInfo.userBank != null) {
      selectedBank.value = withdrawInfo.userBank;
    } else {
      getListBank();
    }
    // getListBank();
    super.onReady();
  }

  Future getListBank() async {
    showProgressingDialog();
    final result = await _withdrawUseCase.listBankUser(
      tokenApp: mainProvider.dataInputApp.token,
    );
    hideDialog();
    if (result.data != null) {
      userBanks.clear();
      userBanks.addAll(result.data!);
      if (userBanks.isNotEmpty) {
        selectedBank.value = userBanks.first;
      }
    } else {
      showSnackBar(UNKNOWN_ERROR);
    }
  }

  Future<void> onConfirm() async {
    if (dataAppParent.smartOTPEnable) {
      checkSmartOTPState(TradingSmartOTPType.cashOutTrading);
    } else {
      Get.toNamed(AppRoutes.smartOtpVerifySms);
    }
  }

  @override
  void onActive() {
    mainProvider.callToActiveOTP?.call(TradingSmartOTPType.cashOutTrading);
  }

  @override
  void onSkip() {
    verifySMS();
  }

  Future verifySMS() async {
    Get.toNamed(AppRoutes.smartOtpVerifySms,
        arguments: SmsOTPType.cashOutTrading);

  }

  void onAddBank() {}

  void onSelectBank(UserBank bank) {}
}
