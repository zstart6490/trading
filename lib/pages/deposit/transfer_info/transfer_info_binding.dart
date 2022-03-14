import 'package:get/get.dart';
import 'package:tikop/models/NavigateData.dart';
import 'package:tikop/modules/deposit/transfer_info/transfer_info_controller.dart';

class TransferInfoBinding extends Bindings {
  @override
  void dependencies() {
    final arg = Get.arguments;
    if (arg is NavigateTransferData) {
      Get.lazyPut(() => TransferInfoController(data: arg));
    }
  }
}
