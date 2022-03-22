import 'package:get/get.dart';
import 'package:trading_module/cores/states/base_controller.dart';
import 'package:trading_module/data/entities/naptien/NavigateData.dart' show NavigateTranDetail, NavigateTransferData;
import 'package:trading_module/data/entities/naptien/SavingProduct.dart';
import 'package:trading_module/domain/entities/cash_in_create_model.dart';
import 'package:trading_module/domain/use_cases/cash_in_usecase.dart';
import 'package:trading_module/routes/app_routes.dart';
import 'package:trading_module/utils/enums.dart';

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
  SavingProduct? savingProduct;


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
    }
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

  void onSetSwapProduct(SavingProduct toProduct) {
    //data.swapProduct = toProduct;
    // final bool isSame = toProduct.id == data.product?.id;
    // swapName.value = isSame
    //     ? "Tự động gia hạn hợp đồng"
    //     : "Chuyển sang ${toProduct.fullName}";
  }

  void onSetTransferProduct(SavingProduct product) {
    chooseSaving = true;
    savingProduct = product;
    methodName.value = product.fullName ?? "";
  }

  void onSetTransferProductNotEnough(
      SavingProductNotEnough savingProductNotEnough) {
    chooseSaving = true;
    savingProduct = savingProductNotEnough.savingProduct;
    methodName.value = savingProductNotEnough.savingProduct.fullName ?? "";
   // amountEnough = savingProductNotEnough.amount.toInt();
    getTransferFee();
  }

  void onSetTransferMethod(TransferType newType) {
    methodName.value = "Chuyển khoản ngân hàng";
    // chooseSaving = false;
    // //data.transferType = newType;
    // checkRecurringTransferView();
    // switch (newType) {
    //   case TransferType.manual:
    //     methodName.value = config.manualBankTitle ?? "Chuyển khoản ngân hàng";
    //     break;
    //   case TransferType.gateway:
    //     methodName.value = config.iosInternetBankingTransferTitle ??
    //         "Thẻ ATM/Internet Banking";
    //     break;
    //   case TransferType.keep:
    //     methodName.value =
    //         config.iosBankingTransferTitle ?? "Chuyển khoản ngân hàng";
    //     break;
    //   default:
    //     methodName.value = "Chưa chọn";
    // }
  }

  void onChangeSwapProduct() {
    // final String productId = data.product?.id ?? '';
    // bottomSheet(SwapProductBottomSheet(
    //   movedProductId: productId,
    //   currentProductId: productId,
    //   onConfirm: (product) {
    //     Get.back();
    //     onSetSwapProduct(product);
    //   },
    // ));
  }

  Future<void> getSwapProduct() async {
    //if (data.product != null) {
      // final result = await _commonRepository.getListProducts(1);
      // if (result.success) {
      //   products = result.model.where((element) => element.canRenew).toList();
      //
      //   bool found = false;
      //   for (final p in products) {
      //     if (p.id == data.product!.id) {
      //       onSetSwapProduct(p);
      //       found = true;
      //     }
      //   }
      //
      //   if (found) {
      //     //bring selected to first
      //     products.remove(swapProduct);
      //     products.insert(0, swapProduct!);
      //   } else {
      //     onSetSwapProduct(products.first);
      //   }
      //}
    //}
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
