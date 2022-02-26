import 'package:get/instance_manager.dart';
import 'package:trading_project/pages/homePage/controller/home_page_controller.dart';
import 'package:trading_project/pages/main_tabbar/main_tabbar_controller.dart';
import 'package:trading_project/pages/on_boarding/intro/intro_controller.dart';


class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomePageController());
    Get.lazyPut(() => IntroController());
    Get.lazyPut(() => MainTabController());
  }
}
