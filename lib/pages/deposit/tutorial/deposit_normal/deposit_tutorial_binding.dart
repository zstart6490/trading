import 'package:get/instance_manager.dart';

import 'deposit_tutorial_controller.dart';

class DepositeTutorialBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DepositeTutorialController());
  }
}
