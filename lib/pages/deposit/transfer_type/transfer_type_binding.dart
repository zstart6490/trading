import 'package:get/get.dart';
import 'package:tikop/models/NavigateData.dart';

import 'transfer_type_controller.dart';

class TransferTypeBinding extends Bindings {
  @override
  void dependencies() {
    final arg = Get.arguments;
    if (arg is NavigateTransferData) {
      Get.lazyPut<TransferTypeController>(() => TransferTypeController(arg));
    }
  }
}
