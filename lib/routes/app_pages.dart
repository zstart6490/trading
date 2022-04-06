import 'package:get/get.dart';
import 'package:trading_module/pages/buy_stock/buy_stock_binding.dart';
import 'package:trading_module/pages/buy_stock/buy_stock_scene.dart';
import 'package:trading_module/pages/contract/contract_binding.dart';
import 'package:trading_module/pages/contract/contract_scene.dart';
import 'package:trading_module/pages/deposit/input_money/input_money_local/input_money_local_binding.dart';
import 'package:trading_module/pages/deposit/input_money/input_money_local/input_money_local_scene.dart';
import 'package:trading_module/pages/deposit/transaction_confirm/transaction_confirm_binding.dart';
import 'package:trading_module/pages/deposit/transaction_confirm/transaction_confirm_scene.dart';
import 'package:trading_module/pages/deposit/transfer_info/transfer_info_binding.dart';
import 'package:trading_module/pages/deposit/transfer_info/transfer_info_sence.dart';
import 'package:trading_module/pages/deposit/transfer_type/transfer_type_binding.dart';
import 'package:trading_module/pages/deposit/transfer_type/transfer_type_scene.dart';
import 'package:trading_module/pages/deposit/tutorial/deposit_normal/deposit_tutorial_binding.dart';
import 'package:trading_module/pages/deposit/tutorial/deposit_normal/deposit_tutorial_scene.dart';
import 'package:trading_module/pages/exchange/buy/buy_stock_binding.dart';
import 'package:trading_module/pages/exchange/buy/buy_stock_scene.dart';
import 'package:trading_module/pages/exchange/sell/sell_stock_binding.dart';
import 'package:trading_module/pages/exchange/sell/sell_stock_scene.dart';
import 'package:trading_module/pages/main_tabbar/main_tabbar.dart';
import 'package:trading_module/pages/main_tabbar/main_tabbar_binding.dart';
import 'package:trading_module/pages/market/market_binding.dart';
import 'package:trading_module/pages/market/market_scene.dart';
import 'package:trading_module/pages/on_boarding/intro/intro_binding.dart';
import 'package:trading_module/pages/on_boarding/intro/intro_product_view.dart';
import 'package:trading_module/pages/on_boarding/verify_policy/verify_policy_binding.dart';
import 'package:trading_module/pages/on_boarding/verify_policy/verify_policy_view.dart';
import 'package:trading_module/pages/pdf_reader/pdf_binddings.dart';
import 'package:trading_module/pages/pdf_reader/pdf_reader_page.dart';
import 'package:trading_module/pages/select_stock/select_stock_binding.dart';
import 'package:trading_module/pages/select_stock/select_stock_scene.dart';
import 'package:trading_module/pages/smart_otp/generate_otp/generate_otp_binding.dart';
import 'package:trading_module/pages/smart_otp/generate_otp/generate_otp_scene.dart';
import 'package:trading_module/pages/smart_otp/input_smart_otp/input_smart_otp_binding.dart';
import 'package:trading_module/pages/smart_otp/input_smart_otp/input_smart_otp_scene.dart';
import 'package:trading_module/pages/smart_otp/verify_sms_otp/verify_sms_otp_binding.dart';
import 'package:trading_module/pages/smart_otp/verify_sms_otp/verify_sms_otp_view.dart';
import 'package:trading_module/pages/stock_detail/stock_detail_binding.dart';
import 'package:trading_module/pages/stock_detail/stock_detail_scene.dart';
import 'package:trading_module/pages/stock_more_detail/stock_more_binding.dart';
import 'package:trading_module/pages/stock_more_detail/stock_more_detail_scene.dart';
import 'package:trading_module/pages/transaction/transaction_detail_binding.dart';
import 'package:trading_module/pages/transaction/transaction_detail_scene.dart';
import 'package:trading_module/pages/transaction_stock/stock_transaction_detail_binding.dart';
import 'package:trading_module/pages/transaction_stock/transaction_stock_detail_scene.dart';
import 'package:trading_module/pages/withdraw/choose_money/choose_money_binding.dart';
import 'package:trading_module/pages/withdraw/choose_money/withdraw_money_scene.dart';
import 'package:trading_module/pages/withdraw/confirm/withdraw_binding.dart';
import 'package:trading_module/pages/withdraw/confirm/withdraw_confirm_scene.dart';
import 'package:trading_module/pages/withdraw/reason/withdraw_reason_binding.dart';
import 'package:trading_module/pages/withdraw/reason/withdraw_reason_scene.dart';
import 'package:trading_module/routes/app_routes.dart';

// ignore: avoid_classes_with_only_static_members
class AppPages {
  static const INITIAL = AppRoutes.mainView;

  static final tradingRoutes = [
    GetPage(
      name: AppRoutes.mainView,
      page: () => const MainTabBar(),
      binding: MainTabBinding(),
    ),
    GetPage(
      name: AppRoutes.market,
      page: () => const MarketScene(),
      binding: MarketBinding(),
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
      name: AppRoutes.tdInputMoneyLocal,
      page: () => const TDInputMoneyLocalScene(),
      binding: TDInputMoneyLocalBinding(),
    ),
    GetPage(
      name: AppRoutes.tdTransactionConfirm,
      page: () => const TDTransactionConfirmScene(),
      binding: TDTransactionConfirmBinding(),
    ),
    GetPage(
      name: AppRoutes.tdTransferType,
      page: () => const TDTransferTypeScene(),
      binding: TDTransferTypeBinding(),
    ),
    GetPage(
      name: AppRoutes.tdTransferInfo,
      page: () => const TDTransferInfoScene(),
      binding: TDTransferInfoBinding(),
    ),
    GetPage(
      name: AppRoutes.tdDepositTutorial,
      page: () => const TDDepositeTutorialScene(),
      binding: TDDepositeTutorialBinding(),
    ),
    GetPage(
        name: AppRoutes.transactionDetail,
        page: () => const TransactionDetailScene(),
        binding: TransactionBinding()),
    // GetPage(
    //     name: AppRoutes.tdBuyStock,
    //     page: () => const BuyStockScene(),
    //     binding: BuyStockBinding()),
    GetPage(
        name: AppRoutes.buyStock,
        page: () => BuyStockScene(),
        binding: BuyStockBinding()),
    GetPage(
        name: AppRoutes.stockDetail,
        page: () => const StockDetailScene(),
        binding: StockDetailBinding()),
    GetPage(
        name: AppRoutes.stockMoreDetail,
        page: () => const StockMoreDetailScene(),
        binding: StockMoreDetailBinding()),
    GetPage(
        name: AppRoutes.selectStock,
        page: () => const SelectStockScene(),
        binding: SelectStockBinding()),
    GetPage(
        name: AppRoutes.sellStock,
        page: () => const SellStockScene(),
        binding: SellStockBinding()),
    GetPage(
        name: AppRoutes.stTransactionDetail,
        page: () => TransactionStockDetailScene(),
        binding: TransactionStockDetailBinding()),
  ];
}
