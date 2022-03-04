import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_module/configs/constants.dart';
import 'package:trading_module/configs/service_api_config.dart';
import 'package:trading_module/data/entities/data_input_app.dart';
import 'package:trading_module/data/entities/kyc_status.dart';
import 'package:trading_module/data/entities/otp_status.dart';
import 'package:trading_module/data/repos/onboarding_repos_impl.dart';
import 'package:trading_module/data/services/onboarding_service.dart';
import 'package:trading_module/domain/use_cases/user_onboarding_usecase.dart';
import 'package:trading_module/lang/translation_service.dart';
import 'package:trading_module/pages/main_controller.dart';
import 'package:trading_module/pages/main_provider.dart';
import 'package:trading_module/routes/app_pages.dart';
import 'package:trading_module/routes/app_routes.dart';
import 'package:trading_module/theme/app_theme.dart';

enum CallbackType {
  resultEKYC,
  resultActiveSmartOTP,
  resultForgetSmartOTP,
}

class DataCallback {
  KycStatus kycStatus;
  OtpStatus otpStatus;
  DataCallback(this.kycStatus, this.otpStatus);
}

void callbackToApp(CallbackType callbackType, DataCallback dataCallback) {
  switch (callbackType) {
    case CallbackType.resultEKYC:
      // TODO: Handle this case.

      break;
    case CallbackType.resultActiveSmartOTP:
      // TODO: Handle this case.
      break;
    case CallbackType.resultForgetSmartOTP:
      // TODO: Handle this case.
      break;
  }
}

void openTradingModule({
  required BuildContext context,
  required DataInputApp dataInput,
  Function()? callToEKYC,
  Function()? callToActiveSmartOtpPin,
  Function()? callToForgetPin,
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
          dataInput, callToEKYC, callToActiveSmartOtpPin, callToForgetPin),
      permanent: true);

  Get.lazyPut(() =>
      UserOnBoardingUseCase(OnBoardingReposImpl(OnBoardingServiceImpl())));
  Get.create(() => MainController(), permanent: true);

  Get.find<MainController>().getDataLogin();
  Get.toNamed(AppRoutes.MAIN);
}
