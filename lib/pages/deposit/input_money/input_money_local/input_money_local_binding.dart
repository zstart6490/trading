import 'package:get/get.dart';
import 'package:trading_module/data/entities/naptien/SavingProduct.dart';


import 'input_money_local_controller.dart';

class TDInputMoneyLocalBinding extends Bindings {
  @override
  void dependencies() {
    final arg = Get.arguments;
    if (arg is SavingProduct) {
      Get.lazyPut(() => TDInputMoneyLocalController(product: arg));
    }
  }
}
