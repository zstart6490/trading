import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_project/configs/constants.dart';
import 'package:trading_project/configs/service_api_config.dart';
import 'package:trading_project/data/repos/onboarding_repos_impl.dart';
import 'package:trading_project/data/services/onboarding_service.dart';
import 'package:trading_project/domain/repos/onboarding_repos.dart';
import 'package:trading_project/domain/use_cases/user_onboarding_usecase.dart';
import 'package:trading_project/lang/translation_service.dart';
import 'package:trading_project/pages/main/views/home_view.dart';
import 'package:trading_project/pages/main_binding.dart';
import 'package:trading_project/pages/main_controller.dart';
import 'package:trading_project/pages/main_provider.dart';
import 'package:trading_project/routes/app_pages.dart';
import 'package:trading_project/routes/app_routes.dart';
import 'package:trading_project/shared/logger/logger_utils.dart';
import 'package:trading_project/theme/app_theme.dart';

Future<void> mainCommon(EnvironmentConfiguration serverConfig) async {
  Environment().initConfig(serverConfig);
  log(Environment().config.toString());
  runApp(MyApp());
}

final String tokenTest =
    "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJiaXJ0aGRheSI6IjIwMjIvMDIvMjMiLCJwaG9uZU51bWJlciI6IjA5NzI0NDYwMjMiLCJhZGRyZXNzIjoiVGF5IEhhIFRvd2VyLCAxOCBUbyBIdXUsIE5hbSBUdSBMaWVtLCBIYSBOb2ksIFZpZXQgTmFtZSIsImdlbmRlciI6IjAiLCJuYW1lIjoiMDk3MjQ0NjAyMyIsImlkIjozNCwiZXhwIjoxNjQ2MzAyNzk2LCJ1dWlkIjoiMmE1MzY3Y2EtMGY5My00YWMwLWE4ZjAtMDcyM2NlNWJjYjNhIiwiZW1haWwiOiJ0cmFkaW5nQHRlY2hsYWIuYWkifQ.Oxc6nvzYGXzmXz4ViEdCTc2B7tgUKh7rnF4m7TyQPOTLCzey2S4xNmZT6OXnPsMTeGg--9y_ryXH9tz1iV7hjqE4wwquYYZJnrWD4mB5BzxfchNlJnnCekc5NXNIQjxLeJ2ixPfT40DdcGNpEaTCI5Kqmf8x7NEVMNAhW-5mAt1BOGy9KxRRA0LH_S0HCQvhNcmUORPXH23Up7zzAlJbJSnd4_btOrlxl-9EqjzutfZV2d7H7T1SwznLyp6G-XWGQ7rk0awzyWGb1NPt-DUjrqkFTp653jrpn2357C09g8j7Ntqn-XjrVsGyIz8918wt2mOslM5r-7Y8si7YWyY3fyJx-KwJVNA5404pTj_vtJvsQMFbWMdw7OA5V6amaTRTN2Sf_t6eTBtRTyPBBvE16v_WXGrhnDMvoveKSgXCwIn4h1iFmEUtw3hDgJxzwI8rP5eiVyoW0LGk3jEXzMSFZnACgXerEWRmJas5ArdhX4i-E20066PTwrSgbdcrnfPBvZ6vOpq1hnxFwXHMhEk2_7ShUDVvvRv6vJF5OXPPlvCddbbo12cnA-Pp0GOnhDvmAufvDPHMrASDpAfYuEo1AVOmMi4jzihV3ALtVvyDYzorv4VFjMjY2llkwYRvRIa28_UnAa1dUH4RxgjMRFt4RFEiIUIAEvhJ-DSY5hIEtfs";

void openTradingModule(BuildContext context, String token, bool kyc, bool otp) {
  Environment().initConfig(EnvironmentConfiguration.develop);
  Get.lazyPut(() => MainTradingProvider());
  final OnBoardingRepos repos = Get.put<OnBoardingReposImpl>(
      OnBoardingReposImpl(OnBoardingServiceImpl()));
  Get.lazyPut(() => UserOnBoardingUseCase(repos));
  Get.lazyPut(() => MainController(
      tokenTest: tokenTest,
      userIsRegisteredKyc: false,
      userIsRegisteredOTP: false));
  Get.find<MainController>().getDataLogin();
  // Navigator.push(
  //   context,
  //   MaterialPageRoute(builder: (context) => MainView()),
  // );
  Get.toNamed(AppRoutes.MAIN);
  // runApp(MyApp());
}

class _MyAppState extends State<MyApp> {
  final String tokenTest =
      "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJiaXJ0aGRheSI6IjIwMjIvMDIvMjMiLCJwaG9uZU51bWJlciI6IjA5NzI0NDYwMjMiLCJhZGRyZXNzIjoiVGF5IEhhIFRvd2VyLCAxOCBUbyBIdXUsIE5hbSBUdSBMaWVtLCBIYSBOb2ksIFZpZXQgTmFtZSIsImdlbmRlciI6IjAiLCJuYW1lIjoiMDk3MjQ0NjAyMyIsImlkIjozNCwiZXhwIjoxNjQ2MzAyNzk2LCJ1dWlkIjoiMmE1MzY3Y2EtMGY5My00YWMwLWE4ZjAtMDcyM2NlNWJjYjNhIiwiZW1haWwiOiJ0cmFkaW5nQHRlY2hsYWIuYWkifQ.Oxc6nvzYGXzmXz4ViEdCTc2B7tgUKh7rnF4m7TyQPOTLCzey2S4xNmZT6OXnPsMTeGg--9y_ryXH9tz1iV7hjqE4wwquYYZJnrWD4mB5BzxfchNlJnnCekc5NXNIQjxLeJ2ixPfT40DdcGNpEaTCI5Kqmf8x7NEVMNAhW-5mAt1BOGy9KxRRA0LH_S0HCQvhNcmUORPXH23Up7zzAlJbJSnd4_btOrlxl-9EqjzutfZV2d7H7T1SwznLyp6G-XWGQ7rk0awzyWGb1NPt-DUjrqkFTp653jrpn2357C09g8j7Ntqn-XjrVsGyIz8918wt2mOslM5r-7Y8si7YWyY3fyJx-KwJVNA5404pTj_vtJvsQMFbWMdw7OA5V6amaTRTN2Sf_t6eTBtRTyPBBvE16v_WXGrhnDMvoveKSgXCwIn4h1iFmEUtw3hDgJxzwI8rP5eiVyoW0LGk3jEXzMSFZnACgXerEWRmJas5ArdhX4i-E20066PTwrSgbdcrnfPBvZ6vOpq1hnxFwXHMhEk2_7ShUDVvvRv6vJF5OXPPlvCddbbo12cnA-Pp0GOnhDvmAufvDPHMrASDpAfYuEo1AVOmMi4jzihV3ALtVvyDYzorv4VFjMjY2llkwYRvRIa28_UnAa1dUH4RxgjMRFt4RFEiIUIAEvhJ-DSY5hIEtfs";

  @override
  void initState() {
    Get.lazyPut(() => MainTradingProvider());
    final OnBoardingRepos repos = Get.put<OnBoardingReposImpl>(
        OnBoardingReposImpl(OnBoardingServiceImpl()));
    Get.lazyPut(() => UserOnBoardingUseCase(repos));
    Get.lazyPut(() => MainController(
        tokenTest: tokenTest,
        userIsRegisteredKyc: false,
        userIsRegisteredOTP: false));
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
      navigatorKey: Get.addKey(GlobalKey()),
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
