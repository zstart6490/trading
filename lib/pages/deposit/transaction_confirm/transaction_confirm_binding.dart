import 'dart:developer';

import 'package:get/get.dart';
import 'package:tikop/models/NavigateData.dart';

import 'transaction_confirm_controller.dart';

class TransactionConfirmBinding extends Bindings {
  @override
  void dependencies() {
    final arg = Get.arguments;
    if (arg is NavigateTransferData) {
      Get.lazyPut(() => TransactionConfirmController(arg));
    } else {
      log("Navigate Error");
    }
  }
}
