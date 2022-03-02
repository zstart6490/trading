import 'package:get/get.dart';
import 'package:trading_project/pages/home/bindings/home_binding.dart';
import 'package:trading_project/pages/home/views/home_view.dart';
import 'package:trading_project/pages/smart_otp/input_smart_otp/input_smart_otp_binding.dart';
import 'package:trading_project/pages/smart_otp/input_smart_otp/input_smart_otp_scene.dart';

import '../pages/homePage/home_page.dart';
import 'package:trading_project/pages/on_boarding/intro/intro_binding.dart';
import 'package:trading_project/pages/on_boarding/verify_policy/verify_policy_binding.dart';
import 'package:trading_project/pages/on_boarding/intro/intro_product_view.dart';
import 'package:trading_project/pages/on_boarding/verify_policy/verify_policy_view.dart';
import 'package:trading_project/pages/smart_otp/generate_otp/generate_otp_binding.dart';
import 'package:trading_project/pages/smart_otp/generate_otp/generate_otp_scene.dart';
import 'package:trading_project/pages/smart_otp/verify_sms_otp/verify_sms_otp_binding.dart';
import 'package:trading_project/pages/smart_otp/verify_sms_otp/verify_sms_otp_view.dart';

import '../pages/main_tabbar/main_tabbar.dart';
import '../pages/main_tabbar/main_tabbar_binding.dart';

part 'app_routes.dart';

// ignore: avoid_classes_with_only_static_members
class AppPages {
  static const INITIAL = Routes.BOARDING_INTRO;
  //static const INITIAL = Routes.HOME;
  static final routes = [
    GetPage(
      name: Routes.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.BOARDING_INTRO,
      page: () => const IntroProductView(),
      binding: IntroBinding(),
    ), GetPage(
      name: Routes.BOARDING_VERIFY_POLICY,
      page: () => const VerifyPolicyView(),
      binding: VerifyPolicyBinding(),
    ),GetPage(
      name: Routes.SMART_OPT_INPUT,
      page: () => const InputSmartOTPScene(),
      binding: InputSmartOTPBinding(),
    ),GetPage(
      name: Routes.SMART_OPT_GENERATE,
      page: () => const GenerateOtpScene(),
      binding: GenerateOtpBinding(),
    ),GetPage(
      name: Routes.SMART_OPT_VERIFY_SMS,
      page: () => const VerifySMSOTPView(),
      binding: VerifySMSOTPBinding(),
    ),
    // GetPage(
    //   name: Routes.HOME,
    //   page: () => const MainTabBar(),
    //   binding: MainBinding(),
    // ),
  ];
}
