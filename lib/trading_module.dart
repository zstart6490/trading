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
import 'package:trading_module/pages/on_boarding/verify_policy/verify_policy_controller.dart';
import 'package:trading_module/routes/app_pages.dart';
import 'package:trading_module/routes/app_routes.dart';
import 'package:trading_module/theme/app_theme.dart';
import 'package:trading_module/utils/enums.dart';

enum CallbackType {
  resultEKYC,
  resultActiveSmartOTP,
  resultForgetSmartOTP,
}

class DataCallback {
  KycStatus? kycStatus;
  OtpStatus? otpStatus;
  String? otpPin;

  DataCallback({this.kycStatus, this.otpStatus, this.otpPin});
}

class TradingModule {
  static String versionTrading = "-dev-1.0.0.1";

  static void openTradingModule({
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
    print("===data input===");
    print("token=${dataInput.token}");
    print("userIsRegisteredKyc=${dataInput.userIsRegisteredKyc}");
    print("userIsRegisteredOTP=${dataInput.userIsRegisteredOTP}");
    print("email=${dataInput.email}");
    print("phone=${dataInput.phone}");
    print("phoneCountryCode=${dataInput.phoneCountryCode}");
    print("fbDeviceId=${dataInput.fbDeviceId}");
    print("===data input===");
    Get.replace<MainTradingProvider>(MainTradingProvider(
        dataInput, callToEKYC, callToActiveSmartOtpPin, callToForgetPin));

    Get.lazyPut(() =>
        UserOnBoardingUseCase(OnBoardingReposImpl(OnBoardingServiceImpl())));
    Get.lazyPut(() => MainController());

    Get.find<MainController>().getDataLogin();
    // Get.toNamed(AppRoutes.MAIN);
  }

  static void callbackToApp(
      CallbackType callbackType, DataCallback dataCallback) {
    switch (callbackType) {
      case CallbackType.resultEKYC:
        //result
        final VerifyPolicyController verifyPolicyController =
            Get.find<VerifyPolicyController>();
        verifyPolicyController
            .setStatusEKYCAndVerifyNext(dataCallback.kycStatus);
        break;
      case CallbackType.resultActiveSmartOTP:
        if (dataCallback.otpStatus == OtpStatus.enable) {
          //Get.toNamed(AppRoutes.SMART_OPT_GENERATE);
          Get.toNamed(AppRoutes.smartOtpGenerate,
              arguments: [dataCallback.otpPin ?? "", "", SmartOTPType.fromAppParent]);
        }
        break;
      case CallbackType.resultForgetSmartOTP:
        Get.toNamed(AppRoutes.smartOtpInput);
        break;
    }
  }

  static void clearCache() {
    Get.find<MainTradingProvider>().clearAccessToken();
  }

  void onInit() {}
}
