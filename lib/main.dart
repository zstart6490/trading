import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_module/configs/constants.dart';
import 'package:trading_module/configs/service_api_config.dart';
import 'package:trading_module/data/repos/onboarding_repos_impl.dart';
import 'package:trading_module/data/services/onboarding_service.dart';
import 'package:trading_module/domain/repos/onboarding_repos.dart';
import 'package:trading_module/domain/use_cases/user_onboarding_usecase.dart';
import 'package:trading_module/lang/translation_service.dart';
import 'package:trading_module/pages/main_binding.dart';
import 'package:trading_module/pages/main_controller.dart';
import 'package:trading_module/pages/main_provider.dart';
import 'package:trading_module/pages/on_boarding/intro/intro_product_view.dart';
import 'package:trading_module/routes/app_pages.dart';
import 'package:trading_module/routes/app_routes.dart';
import 'package:trading_module/shared/logger/logger_utils.dart';
import 'package:trading_module/theme/app_theme.dart';

Future<void> mainCommon(EnvironmentConfiguration serverConfig) async {
  Environment().initConfig(serverConfig);
  log(Environment().config.toString());
  runApp(MyApp());
}

void toMain(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const IntroProductView()),
  );
}

const tokenTest =
    "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJiaXJ0aGRheSI6IjIwMjIvMDIvMjMiLCJwaG9uZU51bWJlciI6IjA5NzI0NDYwMjMiLCJhZGRyZXNzIjoiVGF5IEhhIFRvd2VyLCAxOCBUbyBIdXUsIE5hbSBUdSBMaWVtLCBIYSBOb2ksIFZpZXQgTmFtZSIsImdlbmRlciI6IjAiLCJuYW1lIjoiMDk3MjQ0NjAyMyIsImlkIjozNCwiZXhwIjoxNjQ2MzY0MzQ5LCJ1dWlkIjoiOTQ4NjZjY2UtNDY2Yi00YzZmLTkzNTQtYmFjMzgxYzM0ZThlIiwiZW1haWwiOiJ0cmFkaW5nQHRlY2hsYWIuYWkifQ.VuzB4y-uLOsfvtpVga0mjXKFh4W_qlHJA4F8IRv8UzZu2Stmpr5I9hz533rxrv_P4b5Orv7tEQE1WoXaYh9tBF6jKUSU1mzZ0ABTW6QC1lEdpmCZvlhj-XZSL_r-MNow3YPLDrXxceffQE1Oiew9QkzgsKFHhMUrQp_qOW-W53WFy2aCdIJc8U72ae7QNE7lDbM1Xj4fD1eDVsO1Wt2K99dcXLvqHHq9i8qPxExE5ysldVDspipN8Z1rl5QI4fwxnwqLo-8_hRXVhv6HlWzlBl_meWrA-BajKuyCJwUQeWJ06pj4UD4P1nj5N6vAx_xRowwc9qc0UH00SHieEkoEjgj-SXadcETYdjvWEL14QM0HJPCIuNN6GWJVH4EtrYA7V5y57H7J1G7BKLaMMJM64DLzxesMTyQ5xzDvK4vH7XuL_MAs5Y4hQBSyXnlZj8I5uuEYipEq7WwiH0WnezdS5wQNSJ1Wbir0Ut4I2EN3YUk8oeVBjDkJyFwjHf-W130wfCBrH69vwekCWFQ7D56b_pxEOmro5c6G_th5YtUwNXv8FaHtH6pHiyWrVzEHvi-EGmmK3Vqrn-Gx0MpwvLZMaWCN4AaanCA2YHsDkz4CBnwjGZrmJ_oZ41HUiUpXh5f6uNb3K-m9R3OCz1BnrZ1WxzBg6p_JTPLdK2f8zDdmdGk";

void openTradingModule(
    {required BuildContext context,
    String tokenParent = tokenTest,
    required bool kyc,
    required bool otp,}) {
  //setup getx
  Get.addPages(AppPages.tradingRoutes);
  Get.locale = TranslationService.locale;
  Get.fallbackLocale = TranslationService.fallbackLocale;
  Get.addTranslations(TranslationService().keys);
  final appTheme = AppTheme();
  Get.changeTheme(appTheme.lightTheme);
  Get.changeThemeMode(ThemeMode.light);
  //init
  Environment().initConfig(EnvironmentConfiguration.develop);
  Get.lazyPut(() => MainTradingProvider());
  final OnBoardingRepos repos = Get.put<OnBoardingReposImpl>(
      OnBoardingReposImpl(OnBoardingServiceImpl()),);
  Get.lazyPut(() => UserOnBoardingUseCase(repos));
  Get.lazyPut(() => MainController(
      tokenTest: tokenParent,
      userIsRegisteredKyc: kyc,
      userIsRegisteredOTP: otp,),);
  Get.toNamed(AppRoutes.MAIN);
  Get.find<MainController>().getDataLogin();
}

class _MyAppState extends State<MyApp> {
  final String tokenTest =
      "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJiaXJ0aGRheSI6IjIwMjIvMDIvMjMiLCJwaG9uZU51bWJlciI6IjA5NzI0NDYwMjMiLCJhZGRyZXNzIjoiVGF5IEhhIFRvd2VyLCAxOCBUbyBIdXUsIE5hbSBUdSBMaWVtLCBIYSBOb2ksIFZpZXQgTmFtZSIsImdlbmRlciI6IjAiLCJuYW1lIjoiMDk3MjQ0NjAyMyIsImlkIjozNCwiZXhwIjoxNjQ2MzAyNzk2LCJ1dWlkIjoiMmE1MzY3Y2EtMGY5My00YWMwLWE4ZjAtMDcyM2NlNWJjYjNhIiwiZW1haWwiOiJ0cmFkaW5nQHRlY2hsYWIuYWkifQ.Oxc6nvzYGXzmXz4ViEdCTc2B7tgUKh7rnF4m7TyQPOTLCzey2S4xNmZT6OXnPsMTeGg--9y_ryXH9tz1iV7hjqE4wwquYYZJnrWD4mB5BzxfchNlJnnCekc5NXNIQjxLeJ2ixPfT40DdcGNpEaTCI5Kqmf8x7NEVMNAhW-5mAt1BOGy9KxRRA0LH_S0HCQvhNcmUORPXH23Up7zzAlJbJSnd4_btOrlxl-9EqjzutfZV2d7H7T1SwznLyp6G-XWGQ7rk0awzyWGb1NPt-DUjrqkFTp653jrpn2357C09g8j7Ntqn-XjrVsGyIz8918wt2mOslM5r-7Y8si7YWyY3fyJx-KwJVNA5404pTj_vtJvsQMFbWMdw7OA5V6amaTRTN2Sf_t6eTBtRTyPBBvE16v_WXGrhnDMvoveKSgXCwIn4h1iFmEUtw3hDgJxzwI8rP5eiVyoW0LGk3jEXzMSFZnACgXerEWRmJas5ArdhX4i-E20066PTwrSgbdcrnfPBvZ6vOpq1hnxFwXHMhEk2_7ShUDVvvRv6vJF5OXPPlvCddbbo12cnA-Pp0GOnhDvmAufvDPHMrASDpAfYuEo1AVOmMi4jzihV3ALtVvyDYzorv4VFjMjY2llkwYRvRIa28_UnAa1dUH4RxgjMRFt4RFEiIUIAEvhJ-DSY5hIEtfs";

  @override
  void initState() {
    Get.lazyPut(() => MainTradingProvider());
    final OnBoardingRepos repos = Get.put<OnBoardingReposImpl>(
        OnBoardingReposImpl(OnBoardingServiceImpl()),);
    Get.lazyPut(() => UserOnBoardingUseCase(repos));
    Get.lazyPut(() => MainController(
        tokenTest: tokenTest,
        userIsRegisteredKyc: false,
        userIsRegisteredOTP: false,),);
    Get.find<MainController>();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme.lightTheme,
      darkTheme: appTheme.darkTheme,
      themeMode: ThemeMode.light,
      logWriterCallback: Logger.write,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.tradingRoutes,
      initialBinding: MainBinding(),
      locale: TranslationService.locale,
      fallbackLocale: TranslationService.fallbackLocale,
      translations: TranslationService(),
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}
