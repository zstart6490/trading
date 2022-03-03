import 'package:get/instance_manager.dart';
import 'package:trading_module/pages/homePage/controller/home_page_controller.dart';
import 'package:trading_module/pages/main_tabbar/main_tabbar_controller.dart';


class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomePageController());
    // Get.lazyPut(() => IntroController(userIsRegisteredKyc:true, userIsRegisteredOTP: true));
    Get.lazyPut(() => MainTabController());
  }
}