import 'package:get/get.dart';
import 'package:trading_module/pages/contract/contract_binding.dart';
import 'package:trading_module/pages/contract/contract_scene.dart';
import 'package:trading_module/pages/homePage/home_page.dart';
import 'package:trading_module/pages/homePage/home_page_bindding.dart';
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
import 'package:trading_module/pages/transaction/transaction_detail_binding.dart';
import 'package:trading_module/pages/transaction/transaction_detail_scene.dart';
import 'package:trading_module/pages/withdraw/choose_money/choose_money_binding.dart';
import 'package:trading_module/pages/withdraw/choose_money/withdraw_money_scene.dart';
import 'package:trading_module/pages/withdraw/confirm/withdraw_binding.dart';
import 'package:trading_module/pages/withdraw/confirm/withdraw_confirm_scene.dart';
import 'package:trading_module/pages/withdraw/reason/withdraw_reason_binding.dart';
import 'package:trading_module/pages/withdraw/reason/withdraw_reason_scene.dart';
import 'package:trading_module/routes/app_routes.dart';

// ignore: avoid_classes_with_only_static_members
class AppPages {
  //static const INITIAL = AppRoutes.MAIN;
  static const INITIAL = AppRoutes.contractPage;

  static final tradingRoutes = [
    GetPage(
      name: AppRoutes.mainView,
      page: () => MainView(),
      binding: MainBinding(),
    ),
    GetPage(
      name: AppRoutes.homeTrading,
      page: () => const HomePageView(),
      binding: HomePageBinding(),
    ),
    GetPage(
      name: AppRoutes.boardingIntro,
      page: () => const IntroProductView(),
      binding: IntroBinding(),
    ),
    GetPage(
      name: AppRoutes.boardingVerifyPolicy,
      page: () => const VerifyPolicyView(),
      binding: VerifyPolicyBinding(),
    ),
    GetPage(
      name: AppRoutes.smartOtpVerifySms,
      page: () => const VerifySMSOTPView(),
      binding: VerifySMSOTPBinding(),
    ),
    GetPage(
      name: AppRoutes.smartOtpGenerate,
      page: () => const GenerateOtpScene(),
      binding: GenerateOtpBinding(),
    ),
    GetPage(
      name: AppRoutes.smartOtpInput,
      page: () => const InputSmartOTPScene(),
      binding: InputSmartOTPBinding(),
    ),
    GetPage(
      name: AppRoutes.pdfView,
      page: () => PdfReadePager(),
      binding: PdfReaderBinding(),
    ),
    GetPage(
      name: AppRoutes.contractPage,
      page: () => const ContractPage(),
      binding: ContractBinding(),
    ),
    GetPage(
      name: AppRoutes.withdrawReasonScene,
      page: () => const WithdrawReasonScene(),
      binding: WithdrawReasonBinding(),
    ),
    GetPage(
      name: AppRoutes.withdrawMoney,
      page: () => const WithdrawMoneyScene(),
      binding: ChooseMoneyBinding(),
    ),
    GetPage(
      name: AppRoutes.withdrawConfirm,
      page: () => const WithdrawConfirmScene(),
      binding: WithdrawBinding(),
    ),
    GetPage(
        name: AppRoutes.transactionDetail,
        page: () => const TransactionDetailScene(),
        binding: TransactionBinding()),
  ];
}
