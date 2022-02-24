import 'package:get/get.dart';
import 'package:trading_project/pages/on_boarding/verify_policy/verify_policy_controller.dart';

class VerifyPolicyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VerifyPolicyController());
  }
}
