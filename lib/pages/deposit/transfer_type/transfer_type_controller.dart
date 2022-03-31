import 'package:get/get.dart';
import 'package:trading_module/cores/states/base_controller.dart';
import 'package:trading_module/domain/entities/cash_in_create_model.dart';
import 'package:trading_module/utils/enums.dart';

class TDTransferTypeController extends BaseController {
  final CashInCreateModel data;
  TDTransferTypeController(this.data);

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




  Future<void> checkTransferFromSaving() async {
    // if (data.target != null && config.showSavingProductTranfer) {
    //   showProgressingDialog();
    //   final result =
    //       await _savingRepository.getListSavingFromInvestRecharge(data.amount);
    //   hideDialog();
    //   if (result.success) {
    //     listProduct.value = result.model;
    //   } else if (result.hasError) {
    //     showSnackBar(result.error!.message);
    //   }
    // }
  }
}
