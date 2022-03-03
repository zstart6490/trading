import 'package:get/get.dart';
import 'package:trading_project/pages/contract/controllers/contract_controller.dart';

class ContractBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ContractController>(() => ContractController());
  }
}
