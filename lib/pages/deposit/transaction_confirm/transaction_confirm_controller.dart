import 'package:get/get.dart';
import 'package:trading_module/cores/states/base_controller.dart';
import 'package:trading_module/domain/entities/cash_in_create_model.dart';
import 'package:trading_module/domain/use_cases/cash_in_usecase.dart';
import 'package:trading_module/routes/app_routes.dart';


class TDTransactionConfirmController extends BaseController
    with StateMixin<CashInCreateModel> {
  final int amount;

  final CashInUseCase _cashInUseCase = Get.find();
  bool canShowMore = false;
  RxString swapName = "".obs;
  RxString methodName = "".obs;


  late CashInCreateModel transaction;

  bool originRecurringTransfer = false;
  RxBool shouldShowRecurringTransfer = false.obs;
  RxBool recurringTransfer = false.obs;

  RxBool showDesc1 = false.obs;

  TDTransactionConfirmController(this.amount);

  bool chooseSaving = false;


  @override
  void onInit() {
    checkRecurringTransferView();
    super.onInit();
  }

  @override
  void onReady() {
    getTransferFee();
    super.onReady();
  }

  Future<void> getTransferFee() async {
    showProgressingDialog();
    final result = await _cashInUseCase.createCashIn(amount.toString());
    hideDialog();

    if (result.data != null) {
      transaction = result.data!;
      change(result.data, status: RxStatus.success());
    } else if (result.error != null) {
      showSnackBar(result.error!.message);
      change(null, status: RxStatus.error());
    }
  }

  void onFinish() {
    backToHome();
  }

  Future<void> onConfirm() async {
    // if (originRecurringTransfer != recurringTransfer.value) {
    //   _commonRepository.changeRecurringTransferStatus(
    //       isOn: recurringTransfer.value);
    // }
    // if (chooseSaving) {
    //   showProgressingDialog();
    //   final deposit = await _investRepository.depositInvestFromSaving(
    //       data.target!.targetId, amountEnough, data.funds!,
    //       userTargetId: data.target!.userId,
    //       savingAccountId: savingProduct!.savingAccountId);
    //   hideDialog();
    //   if (deposit.success) {
    //     Get.toNamed(Routes.transactionDetail,
    //         arguments: NavigateTranDetail(deposit.model, hasBtn: true));
    //   } else if (deposit.hasError) {
    //     showSnackBar(deposit.error!.message);
    //   }
    // } else if (recurringTransfer.value &&
    //     virtualAccounts.isNotEmpty &&
    //     data.transferType != TransferType.manual) {
    //   data.listVA = virtualAccounts;
    //   Get.toNamed(Routes.transferRecurringInfo, arguments: data);
    // } else {
    //   requestServer();
    // }

    Get.toNamed(AppRoutes.tdTransferInfo, arguments: transaction);
  }



  void onChangePaymentMethod() {
    Get.toNamed(AppRoutes.tdTransferType, arguments: transaction);
  }






  void getDepositMethod() {
    // if (config.showBankingRemote) {
    //   onSetTransferMethod(TransferType.keep);
    // } else if (config.showBankTransfer) {
    //   onSetTransferMethod(TransferType.manual);
    // }
  }

  void onToggleSwitch({required bool newVal}) {
    // if (virtualAccounts.isNotEmpty) {
    //   recurringTransfer.value = newVal;
    // } else {
    //   showSnackBar(UNKNOWN_ERROR);
    // }
  }

  void getRecurringTransferData() {
    // final savingProduct = data.product;
    // if (savingProduct != null && savingProduct.isLimited) {
    //   generateVirtualAccount();
    // }
  }

  Future<void> checkRecurringTransfer() async {
    // final result = await _commonRepository.checkRecurringTransfer();
    // recurringTransfer.value = result;
    // originRecurringTransfer = result;
  }

  Future<void> generateVirtualAccount() async {
    // final result = await _commonRepository.generateVirtualAccount();
    // if (result.success) {
    //   virtualAccounts = result.model.obs;
    //   showDesc1.value = virtualAccounts.length < 2;
    // } else {
    //   recurringTransfer.value = false;
    //   originRecurringTransfer = false;
    //   showSnackBar(result.error!.message);
    // }
  }

  void checkRecurringTransferView() {
    // shouldShowRecurringTransfer.value = data.product?.isLimited == false &&
    //     data.product?.isRealEstate == false &&
    //     data.transferType != TransferType.manual;
  }
}
