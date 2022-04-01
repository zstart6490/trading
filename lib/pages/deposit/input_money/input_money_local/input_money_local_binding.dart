import 'package:get/get.dart';
import 'package:trading_module/pages/deposit/input_money/input_money_local/input_money_local_controller.dart';

class TDInputMoneyLocalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TDInputMoneyLocalController());
  }
}
