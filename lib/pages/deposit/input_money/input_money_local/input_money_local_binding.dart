import 'package:get/get.dart';


import 'input_money_local_controller.dart';

class TDInputMoneyLocalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TDInputMoneyLocalController());
  }
}
