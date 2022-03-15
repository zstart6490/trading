import 'package:get/get.dart';
import 'package:trading_module/domain/entities/navigate_withdraw_data.dart';
import 'package:trading_module/pages/withdraw/reason/withdraw_reason_controller.dart';

class WithdrawReasonBinding extends Bindings {
  @override
  void dependencies() {
    final arg = Get.arguments;
    if (arg is NavigateWithdrawData) {
      Get.lazyPut(() => WithdrawReasonController(arg));
    }
  }
}
