import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:trading_module/cores/states/base_controller.dart';
import 'package:trading_module/data/entities/naptien/Bank.dart';

import 'package:trading_module/domain/entities/cash_in_confirm_model.dart';
import 'package:trading_module/domain/entities/cash_in_create_model.dart';
import 'package:trading_module/domain/use_cases/cash_in_usecase.dart';
import 'package:trading_module/pages/deposit/transfer_info/component/overlay_widget/overlay_widget.dart';
import 'package:trading_module/shared_widgets/CustomAlertDialog.dart';
import 'package:trading_module/shared_widgets/CustomOverlay.dart';
import 'package:trading_module/utils/enums.dart';
import 'package:trading_module/utils/util.dart';
import 'package:trading_module/utils/widget_utils.dart';

class TDTransferInfoController extends BaseController
    with StateMixin<CashInConfirmModel> {
  final CashInCreateModel data;

  final ScrollController scrollController = ScrollController();

  TDTransferInfoController({required this.data});

  RxList<OurBank> banks = RxList<OurBank>();
  Rx<OurBank?> selectedBank = Rx<OurBank?>(null);
  int selectedIndex = 0;

  // bool needScrolled = false;
  final box = GetStorage();

  RxBool canNext = false.obs;
  GlobalKey bankKey = GlobalKey();
  GlobalKey accountNumberKey = GlobalKey();
  GlobalKey paymentContentKey = GlobalKey();

  Rx<OptionGuide> optionGuide = Rx<OptionGuide>(OptionGuide.choiceBank);

  bool reverseViewPaymentContent = false;
  late Offset bankOffset;
  late Offset accountNumberOffset;
  late Offset paymentContentOffset;


  final CashInUseCase _cashInUseCase = Get.find();

  @override
  void onReady() {
    super.onReady();
    const Duration(milliseconds: 1000)
        .delay()
        .then((value) => onLoadingFinish());
    cashInConfirm();
  }

  @override
  Future<bool> onWillPop() {
    return Future.value(false);
  }

  void scrollToIndex(int index) {
    if (index > 4) {
      final toOffset = index ~/ 4 * Get.width;
      final clamp = toOffset.clamp(scrollController.position.minScrollExtent,
          scrollController.position.maxScrollExtent);
      scrollController.animateTo(clamp,
          duration: DUR_250, curve: Curves.easeIn);
    }
  }


  void showGuide() {
    Navigator.of(Get.context!).push(
      CustomOverlay(
        child: OverlayWidget(
          bankOffset: bankOffset,
          accountNumberOffset: accountNumberOffset,
          paymentContentOffset: paymentContentOffset,
          reverseViewPaymentContent: reverseViewPaymentContent,
        ),
      ),
    );
  }

  void onChoiceBankContinue() {
    optionGuide.value = OptionGuide.bankAccount;
  }

  void onAccountNumberContinue() {
    optionGuide.value = OptionGuide.paymentContent;
  }

  void onAccountNumberBack() {
    optionGuide.value = OptionGuide.choiceBank;
  }

  void onPaymentContentContinue() {

  }

  void onPaymentContentBack() {
    optionGuide.value = OptionGuide.bankAccount;
  }

  Offset getOffsetWidget(GlobalKey globalKey) {
    final RenderBox? renderBox =
        globalKey.currentContext?.findRenderObject() as RenderBox?;
    return renderBox?.localToGlobal(Offset.zero) ?? Offset.zero;
  }

  void getPositionWidget() {
    // final key = mainProvider.savedPhone + DEPOSIT_FIRST_SUFFIX;
    // if (box.read(key) ?? false) return;
    // if (userData.user?.hasDeposited ?? false) return;
    bankOffset = getOffsetWidget(bankKey);
    accountNumberOffset = getOffsetWidget(accountNumberKey);
    paymentContentOffset = getOffsetWidget(paymentContentKey);
    checkViewPaymentContent();
    showGuide();
  }

  void checkViewPaymentContent() {
    final spacingBottom =
        WidgetUtils.getSpacingWidgetToBottom(paymentContentKey);
    if (spacingBottom < 180) {
      reverseViewPaymentContent = true;
    }
  }

  void onSelectedIndex(int index) {
    selectedBank.value = banks[index];
    //box.write(data.transferType.toString(), banks[index].id);
  }

  Future<void> getListBank() async {
    // BaseDecoder<List<OurBank>> result;
    // if (data.transferType == TransferType.manual) {
    //   result = await _commonRepository.getListBank();
    // } else {
    //   result = await _commonRepository.getList9PayBank();
    // }
    //
    // if (result.success) {
    //   onSetSelectedBank(result.model);
    // } else if (result.hasError) {
    //   showSnackBar(result.error!.message);
    // }
  }

  Future<void> cashInConfirm() async {
    showProgressingDialog();
    final result = await _cashInUseCase.confirmCashIn(data.amount.toString() ,data.transactionId);
    hideDialog();
    if (result.data != null) {
      change(result.data, status: RxStatus.success());
    } else if (result.error != null) {
      showSnackBar(result.error!.message);
    }
  }



  void onSelectBackHome() {
    final alert = CustomAlertDialog(
        title: "Hoàn thành chuyển khoản",
        desc: "Bạn đã hoàn thành bước chuyển khoản của giao dịch này?",
        actions: [
          AlertAction(
              text: "Chưa hoàn thành",
              onPressed: () {
                Get.back();
              }),
          AlertAction(
              text: "Đã hoàn thành",
              isDefaultAction: true,
              onPressed: () {
                Get.back();
                DUR_250.delay().then((value) => onFinish());
              }),
        ]);
    showAlertDialog(alert);
  }

  void onFinish() {
    backToHome();
    // if (Get.isRegistered<ListTransactionController>()) {
    //   Get.find<ListTransactionController>().onReceivePush();
    // }
  }

  void onLoadingFinish() {
    getPositionWidget();
    // if (banks.isNotEmpty) {
    //   scrollToIndex(selectedIndex);
    //   needScrolled = true;
    // }
  }
}
