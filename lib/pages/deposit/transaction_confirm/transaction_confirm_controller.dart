import 'package:get/get.dart';
import 'package:tikop/base/networking/decoder.dart';
import 'package:tikop/base/stateManagement/base_controller.dart';
import 'package:tikop/models/NavigateData.dart'
    show NavigateTranDetail, NavigateTransferData;
import 'package:tikop/models/SavingProduct.dart';
import 'package:tikop/models/Transaction.dart';
import 'package:tikop/models/VirtualAccount.dart';
import 'package:tikop/modules/withdraw/contract_detail/component/swap_product_bottomsheet.dart';
import 'package:tikop/repository/common_repository.dart';
import 'package:tikop/repository/invest_repository.dart';
import 'package:tikop/repository/saving_repository.dart';
import 'package:tikop/routes/routes.dart';
import 'package:tikop/utils/enums.dart';
import 'package:tikop/utils/util.dart';

class TransactionConfirmController extends BaseController
    with StateMixin<TransferFee> {
  final NavigateTransferData data;
  late List<SavingProduct> products;
  SavingProduct? swapProduct;
  final CommonRepository _commonRepository = CommonRepository();
  bool canShowMore = false;
  RxString swapName = "".obs;
  RxString methodName = "".obs;
  RxList<VirtualAccount> virtualAccounts = RxList<VirtualAccount>();
  final InvestRepository _investRepository = InvestRepository();
  final SavingRepository _savingRepository = SavingRepository();
  late Transaction transaction;

  bool originRecurringTransfer = false;
  RxBool shouldShowRecurringTransfer = false.obs;
  RxBool recurringTransfer = false.obs;

  RxBool showDesc1 = false.obs;

  TransactionConfirmController(this.data);

  bool chooseSaving = false;
  SavingProduct? savingProduct;
  int amountEnough = 0;

  @override
  void onInit() {
    checkRecurringTransferView();
    super.onInit();
  }

  @override
  void onReady() {
    amountEnough = data.amount;
    getTransferFee();
    getDepositMethod();
    getRecurringTransferData();
    super.onReady();
  }

  Future<void> getTransferFee() async {
    showProgressingDialog();
    await getSwapProduct();
    final result = await _commonRepository
        .getTransferFee(NinePayType.keep, amountEnough, target: data.target);

    hideDialog();
    if (result.success) {
      change(result.model, status: RxStatus.success());
    } else if (result.hasError) {
      showSnackBar(result.error!.message);
    }
  }

  Future<void> onConfirm() async {
    if (originRecurringTransfer != recurringTransfer.value) {
      _commonRepository.changeRecurringTransferStatus(
          isOn: recurringTransfer.value);
    }
    if (chooseSaving) {
      showProgressingDialog();
      final deposit = await _investRepository.depositInvestFromSaving(
          data.target!.targetId, amountEnough, data.funds!,
          userTargetId: data.target!.userId,
          savingAccountId: savingProduct!.savingAccountId);
      hideDialog();
      if (deposit.success) {
        Get.toNamed(Routes.transactionDetail,
            arguments: NavigateTranDetail(deposit.model, hasBtn: true));
      } else if (deposit.hasError) {
        showSnackBar(deposit.error!.message);
      }
    } else if (recurringTransfer.value &&
        virtualAccounts.isNotEmpty &&
        data.transferType != TransferType.manual) {
      data.listVA = virtualAccounts;
      Get.toNamed(Routes.transferRecurringInfo, arguments: data);
    } else {
      requestServer();
    }
  }

  Future<void> requestServer() async {
    showProgressingDialog();
    BaseDecoder<Transaction> deposit;
    try {
      if (data.product != null) {
        deposit = await _savingRepository.depositSaving(
            data.transferType!,
            data.product!.id,
            data.amount,
            data.swapProduct?.id ?? data.product!.id);
      } else if (data.target != null) {
        deposit = await _investRepository.depositInvest(
            data.transferType!, data.target!.targetId, data.amount, data.funds!,
            userTargetId: data.target!.userId);
      } else {
        throw Exception();
      }
      hideDialog();
      if (deposit.success) {
        transaction = deposit.model;
        data.transaction = transaction;
        Get.toNamed(Routes.transferInfo, arguments: data);
      } else if (deposit.hasError) {
        showSnackBar(deposit.error!.message);
      } else {
        showSnackBar(UNKNOWN_ERROR);
      }
    } catch (e) {
      showSnackBar(UNKNOWN_ERROR);
    }
  }

  Future<void> onChangePaymentMethod() async {
    final result = await Get.toNamed(Routes.transferType, arguments: data);
    if (result != null) {}
    if (result is SavingProduct) {
      onSetTransferProduct(result);
    }
    if (result is TransferType) {
      onSetTransferMethod(result);
    }
    if (result is SavingProductNotEnough) {
      onSetTransferProductNotEnough(result);
    }
  }

  void onSetSwapProduct(SavingProduct toProduct) {
    data.swapProduct = toProduct;
    swapProduct = toProduct;
    final bool isSame = toProduct.id == data.product?.id;
    swapName.value = isSame
        ? "Tự động gia hạn hợp đồng"
        : "Chuyển sang ${toProduct.fullName}";
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
    amountEnough = savingProductNotEnough.amount.toInt();
    getTransferFee();
  }

  void onSetTransferMethod(TransferType newType) {
    chooseSaving = false;
    data.transferType = newType;
    checkRecurringTransferView();
    switch (newType) {
      case TransferType.manual:
        methodName.value = config.manualBankTitle ?? "Chuyển khoản ngân hàng";
        break;
      case TransferType.gateway:
        methodName.value = config.iosInternetBankingTransferTitle ??
            "Thẻ ATM/Internet Banking";
        break;
      case TransferType.keep:
        methodName.value =
            config.iosBankingTransferTitle ?? "Chuyển khoản ngân hàng";
        break;
      default:
        methodName.value = "Chưa chọn";
    }
  }

  void onChangeSwapProduct() {
    final String productId = data.product?.id ?? '';
    bottomSheet(SwapProductBottomSheet(
      movedProductId: productId,
      currentProductId: productId,
      products: products,
      onConfirm: (product) {
        Get.back();
        onSetSwapProduct(product);
      },
    ));
  }

  Future<void> getSwapProduct() async {
    if (data.product != null) {
      final result = await _commonRepository.getListProducts(1);
      if (result.success) {
        products = result.model.where((element) => element.canRenew).toList();

        bool found = false;
        for (final p in products) {
          if (p.id == data.product!.id) {
            onSetSwapProduct(p);
            found = true;
          }
        }

        if (found) {
          //bring selected to first
          products.remove(swapProduct);
          products.insert(0, swapProduct!);
        } else {
          onSetSwapProduct(products.first);
        }
      }
    }
  }

  void getDepositMethod() {
    if (config.showBankingRemote) {
      onSetTransferMethod(TransferType.keep);
    } else if (config.showBankTransfer) {
      onSetTransferMethod(TransferType.manual);
    }
  }

  void onToggleSwitch({required bool newVal}) {
    if (virtualAccounts.isNotEmpty) {
      recurringTransfer.value = newVal;
    } else {
      showSnackBar(UNKNOWN_ERROR);
    }
  }

  void getRecurringTransferData() {
    final savingProduct = data.product;
    if (savingProduct != null && savingProduct.isLimited) {
      generateVirtualAccount();
    }
  }

  Future<void> checkRecurringTransfer() async {
    final result = await _commonRepository.checkRecurringTransfer();
    recurringTransfer.value = result;
    originRecurringTransfer = result;
  }

  Future<void> generateVirtualAccount() async {
    final result = await _commonRepository.generateVirtualAccount();
    if (result.success) {
      virtualAccounts = result.model.obs;
      showDesc1.value = virtualAccounts.length < 2;
    } else {
      recurringTransfer.value = false;
      originRecurringTransfer = false;
      showSnackBar(result.error!.message);
    }
  }

  void checkRecurringTransferView() {
    shouldShowRecurringTransfer.value = data.product?.isLimited == false &&
        data.product?.isRealEstate == false &&
        data.transferType != TransferType.manual;
  }
}
