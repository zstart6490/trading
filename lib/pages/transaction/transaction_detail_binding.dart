import 'dart:developer';

import 'package:get/get.dart';
import 'package:trading_module/data/entities/navigate_trans_detail.dart';
import 'package:trading_module/pages/transaction/transaction_detail_controller.dart';

class TransactionBinding extends Bindings {
  @override
  void dependencies() {
    final arg = Get.arguments;
    if (arg is NavigateTranDetail) {
      Get.lazyPut(() => TransactionDetailController(arg));
    } else {
      log("Navigate Error $arg");
    }
  }
}
