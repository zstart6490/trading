import 'dart:developer';

import 'package:get/get.dart';
import 'package:trading_module/data/entities/naptien/NavigateData.dart';


import 'transaction_confirm_controller.dart';

class TDTransactionConfirmBinding extends Bindings {
  @override
  void dependencies() {
    final arg = Get.arguments;
    if (arg is NavigateTransferData) {
      Get.lazyPut(() => TDTransactionConfirmController(arg));
    } else {
      log("Navigate Error");
    }
  }
}
