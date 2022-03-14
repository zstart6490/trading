import 'package:get/get.dart';
import 'package:tikop/base/stateManagement/base_controller.dart';
import 'package:tikop/models/NavigateData.dart';
import 'package:tikop/models/SavingProduct.dart';
import 'package:tikop/modules/deposit/transfer_type/component/popup_settlement.dart';
import 'package:tikop/repository/saving_repository.dart';
import 'package:tikop/utils/enums.dart';

class TransferTypeController extends BaseController {
  RxList<SavingProduct> listProduct = RxList<SavingProduct>();
  final NavigateTransferData data;
  final SavingRepository _savingRepository = SavingRepository();
  TransferTypeController(this.data);

  @override
  void onReady() {
    checkTransferFromSaving();
    super.onReady();
  }

  void onTappedBank() {
    Get.back(result: TransferType.manual);
  }

  void onTapped9Pay() {
    Get.back(result: TransferType.keep);
  }

  void onTappedInternetBanking() {
    Get.back(result: TransferType.gateway);
  }

  void onPressSettlement(SavingProduct product, double total) {
    hideDialog();
    Get.back(
        result: SavingProductNotEnough(
      savingProduct: product,
      amount: total,
    ));
  }

  void onTappedProduct(SavingProduct product) {
    //Check số tiền. Nếu tiền muốn nạp mà > số tiền hiện có thì show popup tất toán.
    final amount = data.amount;
    final totalBalance = product.totalBalance ?? 0;
    // final interest = product.temporaryInterest ?? 0;

    final productName = product.fullName;
    final double totalSettlement = product.totalSettlement ?? 0;
    if (totalBalance <= amount) {
      String compare = "lớn hơn";
      if (totalBalance == amount) {
        compare = "bằng với";
      }
      final desc1 =
          "Số tiền bạn muốn nạp $compare số tiền gốc bạn đang gửi tại @name. Bạn có đồng ý tất toán hợp đồng với số tiền "
              .replaceAll("@name", productName ?? "");
      const desc2 = " (đã tính Thuế TNCN) để nạp tiền đầu tư?";
      showAlertDialog(
        PopupSettlement(
          total: totalSettlement,
          desc1: desc1,
          desc2: desc2,
          onCancel: () {
            hideDialog();
          },
          onAccept: () => onPressSettlement(product, totalSettlement),
        ),
      );
    } else {
      Get.back(result: product);
    }
  }

  Future<void> checkTransferFromSaving() async {
    if (data.target != null && config.showSavingProductTranfer) {
      showProgressingDialog();
      final result =
          await _savingRepository.getListSavingFromInvestRecharge(data.amount);
      hideDialog();
      if (result.success) {
        listProduct.value = result.model;
      } else if (result.hasError) {
        showSnackBar(result.error!.message);
      }
    }
  }
}