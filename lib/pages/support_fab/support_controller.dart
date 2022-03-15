import 'dart:developer';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
//import 'package:tikop/base/stateManagement/base_controller.dart';
//import 'package:tikop/modules/develop/event_tracking_scene.dart';
// import 'package:tikop/modules/main_provider.dart';
// import 'package:tikop/routes/routes.dart';
import 'package:trading_module/configs/constants.dart';
//import 'package:tikop/utils/util.dart';
import 'package:trading_module/cores/states/base_controller.dart';
import 'package:trading_module/data/entities/data_input_app.dart';
import 'package:trading_module/trading_module.dart';
//import 'package:url_launcher/url_launcher.dart';

// import '../../models/NavigateData.dart';
// import '../../utils/enums.dart';
// import '../develop/api_log_scene.dart';
// // ignore: unused_import
// import '../develop/testScene.dart';

class SupportController extends BaseController {
  Future<void> openTelegram() async {
    // Get.back();
    // final company = await Get.find<MainProvider>().getCompany();
    // await Future.delayed(DUR_250);
    // final url = "tg://resolve?domain=${company!.telegram}";
    // final fallbackUrl = "http://www.telegram.me/${company.telegram}";
    // try {
    //   final bool launched = await launch(url, forceSafariVC: false);
    //   if (!launched) {
    //     await launch(fallbackUrl, forceSafariVC: false);
    //   }
    // } catch (e) {
    //   await launch(fallbackUrl, forceSafariVC: false);
    // }
  }

  Future<void> openHotline() async {
    Get.back();
    // final company = await Get.find<MainProvider>().getCompany();
    // await Future.delayed(DUR_250);
    // try {
    //   final bool launched = await launch("tel:${company!.hotline}");
    //   if (!launched) {
    //     await launch("tel:${company.hotline}");
    //   }
    // } catch (e) {
    //   log(e.toString());
    // }
  }

  Future<void> openEmail() async {
    Get.back();
    // final company = await Get.find<MainProvider>().getCompany();
    // await Future.delayed(DUR_250);
    // try {
    //   await launch("mailto:${company!.email}");
    // } catch (e) {
    //   log(e.toString());
    // }
  }

  Future<void> openFeedback() async {
    Get.back();
    //Future.delayed(DUR_250).then((_) => Get.toNamed(Routes.feedback));
  }

  Future<void> openZalo() async {
    Get.back();

    // final company = await Get.find<MainProvider>().getCompany();
    // await Future.delayed(DUR_250);
    // final url = "https://zalo.me/${company!.zalo}";
    // const fallbackUrl =
    //     "https://id.zalo.me/account?continue=https%3A%2F%2Fchat.zalo.me%2F";
    // try {
    //   final bool launched = await launch(url, forceSafariVC: false);
    //   if (!launched) {
    //     await launch(fallbackUrl, forceSafariVC: false);
    //   }
    // } catch (e) {
    //   await launch(fallbackUrl, forceSafariVC: false);
    // }
  }

  Future<void> openMessenger() async {
    Get.back();
    await Future.delayed(DUR_250);
    const messUrl = "fb-messenger-public://user-thread/107776564307512";
    const fallbackUrl = "https://m.me/tikopapp";
    // try {
    //   final bool launched = await launch(messUrl, forceSafariVC: false);
    //   if (!launched) {
    //     await launch(fallbackUrl, forceSafariVC: false);
    //   }
    // } catch (e) {
    //   await launch(fallbackUrl, forceSafariVC: false);
    // }
  }

  void openApiLog() {
    Get.back();
    // Get.to(() => const ApiLogScene());
  }

  void openEventLog() {
    Get.back();
    //Get.to(() => const EventTrackingScene());
  }


  String? _getPushTk() {
    //return GetStorage().read(PUSH_TOKEN_KEY);
  }

  void callToEKYC() {
    //Get.toNamed(Routes.eKYCBegin, arguments: [false, true]);
  }

  void callToForgetPin() {
    // Get.toNamed(Routes.createSmartOtp,
    //     arguments: NavigateSmartOTPData(
    //         smartOTPType: SmartOTPType.forgotToTrading,
    //         phone: userData.user?.phone ?? "",
    //         country: mainProvider.savedCountry));
  }

  void callToActiveSmartOtpPin() {
    // Get.toNamed(Routes.createSmartOtp,
    //     arguments: NavigateSmartOTPData(
    //       phone: userData.user?.phone ?? "",
    //       country: savedCountry,
    //       smartOTPType: SmartOTPType.trading,
    //     ));
  }
}
