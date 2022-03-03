import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_module/configs/constants.dart';
import 'package:trading_module/configs/service_api_config.dart';
import 'package:trading_module/data/repos/onboarding_repos_impl.dart';
import 'package:trading_module/data/services/onboarding_service.dart';
import 'package:trading_module/domain/repos/onboarding_repos.dart';
import 'package:trading_module/domain/use_cases/user_onboarding_usecase.dart';
import 'package:trading_module/kyc/kyc_callback.dart';
import 'package:trading_module/lang/translation_service.dart';
import 'package:trading_module/pages/main_controller.dart';
import 'package:trading_module/pages/main_provider.dart';
import 'package:trading_module/routes/app_pages.dart';
import 'package:trading_module/routes/app_routes.dart';
import 'package:trading_module/theme/app_theme.dart';

void openTradingModule({
  required BuildContext context,
  String tokenParent =
      "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJiaXJ0aGRheSI6IjIwMjIvMDIvMjMiLCJwaG9uZU51bWJlciI6IjA5NzI0NDYwMjMiLCJhZGRyZXNzIjoiVGF5IEhhIFRvd2VyLCAxOCBUbyBIdXUsIE5hbSBUdSBMaWVtLCBIYSBOb2ksIFZpZXQgTmFtZSIsImdlbmRlciI6IjAiLCJuYW1lIjoiMDk3MjQ0NjAyMyIsImlkIjozNCwiZXhwIjoxNjQ2MzY0MzQ5LCJ1dWlkIjoiOTQ4NjZjY2UtNDY2Yi00YzZmLTkzNTQtYmFjMzgxYzM0ZThlIiwiZW1haWwiOiJ0cmFkaW5nQHRlY2hsYWIuYWkifQ.VuzB4y-uLOsfvtpVga0mjXKFh4W_qlHJA4F8IRv8UzZu2Stmpr5I9hz533rxrv_P4b5Orv7tEQE1WoXaYh9tBF6jKUSU1mzZ0ABTW6QC1lEdpmCZvlhj-XZSL_r-MNow3YPLDrXxceffQE1Oiew9QkzgsKFHhMUrQp_qOW-W53WFy2aCdIJc8U72ae7QNE7lDbM1Xj4fD1eDVsO1Wt2K99dcXLvqHHq9i8qPxExE5ysldVDspipN8Z1rl5QI4fwxnwqLo-8_hRXVhv6HlWzlBl_meWrA-BajKuyCJwUQeWJ06pj4UD4P1nj5N6vAx_xRowwc9qc0UH00SHieEkoEjgj-SXadcETYdjvWEL14QM0HJPCIuNN6GWJVH4EtrYA7V5y57H7J1G7BKLaMMJM64DLzxesMTyQ5xzDvK4vH7XuL_MAs5Y4hQBSyXnlZj8I5uuEYipEq7WwiH0WnezdS5wQNSJ1Wbir0Ut4I2EN3YUk8oeVBjDkJyFwjHf-W130wfCBrH69vwekCWFQ7D56b_pxEOmro5c6G_th5YtUwNXv8FaHtH6pHiyWrVzEHvi-EGmmK3Vqrn-Gx0MpwvLZMaWCN4AaanCA2YHsDkz4CBnwjGZrmJ_oZ41HUiUpXh5f6uNb3K-m9R3OCz1BnrZ1WxzBg6p_JTPLdK2f8zDdmdGk",
  required KycStatus kyc,
  required bool otp,
}) {
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
  Get.create(
      () => MainTradingProvider(
            userIsRegisteredKyc: kyc,
            userIsRegisteredOTP: otp,
          ),
      permanent: true);
  final OnBoardingRepos repos = Get.put<OnBoardingReposImpl>(
    OnBoardingReposImpl(OnBoardingServiceImpl()),
  );
  Get.create(() => UserOnBoardingUseCase(repos), permanent: true);
  Get.create(
      () => MainController(
            tokenTest: tokenParent
          ),
      permanent: true);

  Get.find<MainController>().getDataLogin();
  Get.toNamed(AppRoutes.MAIN);
}
