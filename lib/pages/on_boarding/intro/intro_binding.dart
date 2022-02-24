import 'package:get/get.dart';
import 'package:trading_project/pages/on_boarding/intro/intro_controller.dart';


class IntroBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => IntroController());
  }
}
