import 'package:get/get.dart';
import 'package:tikop/models/SavingProduct.dart';

import 'input_money_local_controller.dart';

class InputMoneyLocalBinding extends Bindings {
  @override
  void dependencies() {
    final arg = Get.arguments;
    if (arg is SavingProduct) {
      Get.lazyPut(() => InputMoneyLocalController(product: arg));
    }
  }
}