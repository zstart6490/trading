import 'package:get/get.dart';
// import 'package:tikop/models/NavigateData.dart';
import 'package:trading_module/data/entities/naptien/NavigateData.dart';

import 'transfer_type_controller.dart';

class TDTransferTypeBinding extends Bindings {
  @override
  void dependencies() {
    final arg = Get.arguments;
    if (arg is NavigateTransferData) {
      Get.lazyPut<TDTransferTypeController>(() => TDTransferTypeController(arg));
    }
  }
}
