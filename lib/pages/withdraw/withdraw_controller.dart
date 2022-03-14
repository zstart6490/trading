import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:trading_module/cores/states/base_controller.dart';
import 'package:trading_module/data/entities/info_withdraw_dto.dart';
import 'package:trading_module/domain/entities/bank.dart';
import 'package:trading_module/domain/entities/navigate_withdraw_data.dart';
import 'package:trading_module/domain/use_cases/withdraw_usecase.dart';
import 'package:trading_module/pages/smart_otp/base_check_smart_otp.dart';
import 'package:trading_module/routes/app_routes.dart';

class WithdrawController extends BaseController with BaseCheckSmartOTP {
  final NavigateWithdrawData data;
  final WithdrawUseCase _withdrawUseCase = Get.find<WithdrawUseCase>();
  late FocusNode focusNode;
  int minMoneyCanWithdraw = 0;
  bool canSelectTotal = false;


  WithdrawController(this.data);

  RxInt otpExpired = 1000.obs;
  int requestAmount = 0;
  Rx<UserBank?> selectedBank = Rx<UserBank?>(null);
  RxList<UserBank> userBanks = <UserBank>[].obs;
  RxBool isAllin = true.obs;
  RxBool canConfirm = true.obs;
  TextEditingController textEditController = TextEditingController();
  double vatPercent = 5.0;
  int maxMoneyCanWithdraw = 0;
  int multipileOf = 1;
  bool mustAllin = false;
  InfoWithdraw? withdrawInfo;

  @override
  void onInit() {
    super.onInit();
    //To-do : get tu api config
    vatPercent = double.parse(mainProvider.configMap?.vatPercent ?? "0");
    maxMoneyCanWithdraw = data.totalMoneyUser;
    minMoneyCanWithdraw =
        int.parse(mainProvider.configMap?.minMoneyUser ?? "50000");

    focusNode = FocusNode();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        setAllin(false);
      }
    });
  }

  @override
  void onReady() {
    checkRequestAmount();
    getListBank();
    super.onReady();
  }

  Future getListBank() async {
    showProgressingDialog();
    final result = await _withdrawUseCase.listBankUser(
        tokenApp: mainProvider.dataInputApp.token);
    hideDialog();
    if (result.data != null) {
      userBanks.clear();
      userBanks.addAll(result.data!);
      if (userBanks.isNotEmpty) {
        selectedBank.value = userBanks.first;
      }
    } else {
      showSnackBar(result.error!.message);
    }
  }

  @override
  void onClose() {
    super.onClose();
    textEditController.dispose();
  }

  void onChangedMoney(String val) {
    checkRequestAmount();
  }

  // ignore: avoid_positional_boolean_parameters
  void setAllin(bool isAllin) {
    if (!isAllin) focusNode.requestFocus();
    if (isAllin) focusNode.unfocus();
    if (mustAllin) {
      this.isAllin.value = true;
      return;
    }
    this.isAllin.value = isAllin;

    checkRequestAmount();
  }

  void checkRequestAmount() {
    if (isAllin.value) {
      canConfirm.value = true;
    } else {
      requestAmount =
          (int.tryParse(textEditController.text.numericOnly()) ?? 0) *
              multipileOf;
      canConfirm.value = requestAmount >= minMoneyCanWithdraw &&
          requestAmount <= data.totalMoneyUser;
    }
  }

  Future<void> onConfirmAmount() async {
    if (selectedBank.value == null) {
      showSnackBar(
          "Bạn chưa chọn ngân hàng rút tiền. Nếu chưa có bạn hãy thêm ngân hàng mới");
      return;
    }
    hideKeyboard();

    showProgressingDialog();
    final result = await _withdrawUseCase.createCashOut(
        linkId: selectedBank.value!.id.toString(),
        amount: requestAmount.toString());
    //call api rut tien
    hideDialog();
    if (result.data != null) {
      withdrawInfo = result.data!;
      // final tranId = withdrawInfo.transactionId;
      moveToConfirmScene();
    } else if (result.error != null) {
      showSnackBar(result.error!.message);
    }
  }


  void moveToConfirmScene() {
    Get.toNamed(AppRoutes.withdrawConfirm);
  }

  void onInputOver() {
    showSnackBar("Bạn không được nhập số tiền lớn hơn bạn đang có");
  }

  Future<void> onAddBank() async {
    // final bank = await Get.toNamed(Routes.addUserBank) as UserBank?;
    // if (bank != null) {
    //   userBanks.add(bank);
    //   selectedBank.value = bank;
    // }
  }

  void onSelectBank(UserBank bank) {
    selectedBank.value = bank;
  }

  Future<void> onConfirm() async {
    // if (config.smartOTPEnable) {
    //   checkSmartOTPState(SmartOTPType.savingWithdraw);
    // } else {
    //   smsOTP();
    // }
  }

  @override
  void onActive() {
    // Get.toNamed(Routes.createSmartOtp,
    //     arguments: NavigateSmartOTPData(
    //       phone: userData.user?.phone ?? "",
    //       country: savedCountry,
    //       smartOTPType: SmartOTPType.savingWithdraw,
    //     ));
  }

  @override
  void onSkip() {
    // smsOTP();
  }
}