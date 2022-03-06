import 'package:get/get.dart';
import 'package:trading_module/pages/main/views/home_view.dart';
import 'package:trading_module/pages/main_binding.dart';
import 'package:trading_module/pages/on_boarding/intro/intro_binding.dart';
import 'package:trading_module/pages/on_boarding/intro/intro_product_view.dart';
import 'package:trading_module/pages/on_boarding/verify_policy/verify_policy_binding.dart';
import 'package:trading_module/pages/on_boarding/verify_policy/verify_policy_view.dart';
import 'package:trading_module/pages/pdf_reader/pdf_binddings.dart';
import 'package:trading_module/pages/pdf_reader/pdf_reader_page.dart';
import 'package:trading_module/pages/smart_otp/generate_otp/generate_otp_binding.dart';
import 'package:trading_module/pages/smart_otp/generate_otp/generate_otp_scene.dart';
import 'package:trading_module/pages/smart_otp/input_smart_otp/input_smart_otp_binding.dart';
import 'package:trading_module/pages/smart_otp/input_smart_otp/input_smart_otp_scene.dart';
import 'package:trading_module/pages/smart_otp/verify_sms_otp/verify_sms_otp_binding.dart';
import 'package:trading_module/pages/smart_otp/verify_sms_otp/verify_sms_otp_view.dart';
import 'package:trading_module/routes/app_routes.dart';

import 'package:trading_module/pages/contract/contract_scene.dart';
import '../pages/contract/contract_binding.dart';

// ignore: avoid_classes_with_only_static_members
class AppPages {
  //static const INITIAL = AppRoutes.MAIN;
  static const INITIAL = AppRoutes.CONTRACT;

  static final tradingRoutes = [
    GetPage(
      name: AppRoutes.MAIN,
      page: () => MainView(),
      binding: MainBinding(),
    ),
    GetPage(
      name: AppRoutes.BOARDING_INTRO,
      page: () => const IntroProductView(),
      binding: IntroBinding(),
    ),
    GetPage(
      name: AppRoutes.BOARDING_VERIFY_POLICY,
      page: () => const VerifyPolicyView(),
      binding: VerifyPolicyBinding(),
    ),
    GetPage(
      name: AppRoutes.SMART_OPT_VERIFY_SMS,
      page: () => const VerifySMSOTPView(),
      binding: VerifySMSOTPBinding(),
    ),
    // GetPage(
    //   name: AppRoutes.SMART_OPT_CREATE,
    //   page: () => const CreateSmartOTPScene(),
    //   binding: CreateSmartOTPConfirmBinding(),
    // ),
    // GetPage(
    //   name: AppRoutes.SMART_OPT_CONFIRM,
    //   page: () => const ConfirmSmartOTPScene(),
    //   binding: ConfirmSmartOTPBinding(),
    // ),
    GetPage(
      name: AppRoutes.SMART_OPT_GENERATE,
      page: () => const GenerateOtpScene(),
      binding: GenerateOtpBinding(),
    ),
    GetPage(
      name: AppRoutes.SMART_OPT_INPUT,
      page: () => const InputSmartOTPScene(),
      binding: InputSmartOTPBinding(),
    ),
    GetPage(
      name: AppRoutes.PDF_VIEW,
      page: () => PdfReadePager(),
      binding: PdfReaderBinding(),
    ),
    GetPage(
        name: AppRoutes.CONTRACT,
        page: () => const ContractPage(),
        binding: ContractBinding(),
       ),
  ];
}
