import 'dart:developer';
import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:package_info/package_info.dart';
import 'package:trading_module/cores/states/base_common_widget.dart';
import 'package:trading_module/data/entities/data_input_app.dart';
import 'package:trading_module/domain/entities/data_login.dart';
import 'package:trading_module/domain/entities/user_data.dart';
import 'package:trading_module/shared_widgets/NetworkDialog.dart';
import 'package:trading_module/utils/enums.dart';

class MainTradingProvider with BaseCommonWidgets {
  UserData? userData;
  ConfigMap? configMap;

  GetStorage get box => GetStorage();
  final BaseCacheManager imageCacheManager = DefaultCacheManager();
  final _connectivity = Connectivity();
  DataInputApp dataInputApp;
  Function()? callToEKYC;
  Function(Function()? onComplete)? callToAddBank;
  Function(TradingSmartOTPType smartOTPType)? callToActiveOTP;
  Function(TradingSmartOTPType smartOTPType)? callToForgetPin;
  Function()? callToSignIn;
  Function(List<String> subscribeTopics, List<String> unSubscribeTopics)? registerNotifyTopic;

  MainTradingProvider(this.dataInputApp, this.callToEKYC, this.callToAddBank,
      this.callToActiveOTP, this.callToForgetPin, this.callToSignIn, this.registerNotifyTopic);

  // void updateDataInput(DataInputApp dataInputApp){
  //   this.dataInputApp =dataInputApp;
  // }

  Future loadDataDeviceInfo() async {
    final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    appVersion = packageInfo.version;

    try {
      if (Platform.isAndroid) {
        final data = await deviceInfoPlugin.androidInfo;
        deviceId = data.androidId ?? '';
        osVersion = data.version.release ?? '0.0';
        deviceName = data.model ?? '';
      } else if (Platform.isIOS) {
        final data = await deviceInfoPlugin.iosInfo;
        deviceId = data.identifierForVendor ?? '';
        osVersion = data.systemVersion ?? '0.0';
        deviceName = data.name ?? '';
      }
    } on PlatformException {
      log("Cant get device info");
    }
    String platform = "";
    if (Platform.isAndroid) {
      platform = "android";
    } else if (Platform.isIOS) {
      platform = "ios";
    } else {
      return;
    }
  }

  String deviceId = "";
  String deviceName = "";
  String appVersion = "";
  String appTradingVersion = "";
  String osVersion = "";
  String? accessToken;

  // set accessToken(String? accessToken) => _accessToken;

  void clearAccessToken() {
    accessToken = null;
    userData = null;
    configMap = null;
    // box.remove(AUTH_TOKEN_KEY);
  }

  String? getMethodDisplay(TransactionMethod method, {TransactionType? type}) {
    switch (method) {
      case TransactionMethod.bankTransfer:
        return "Chuy???n kho???n ng??n h??ng";
      case TransactionMethod.ninePayKeep:
        return "Chuy???n kho???n ng??n h??ng";
      case TransactionMethod.ninePayGateWay:
        return "Th??? ATM/Internet Banking";
      case TransactionMethod.bankTransferGlobal:
        return "N???p ti???n m???t";
      case TransactionMethod.paypal:
        return "V?? Paypal";
      case TransactionMethod.referral:
        return "Tr??? th?????ng";
      case TransactionMethod.none:
        return "Chuy???n kho???n ng??n h??ng";
      case TransactionMethod.renew:
        return "Gia h???n h???p ?????ng";
      case TransactionMethod.moveProduct:
        return "Chuy???n ?????i h???p ?????ng";
      case TransactionMethod.transferSaving:
        return "Chuy???n ?????i h???p ?????ng";
      case TransactionMethod.moveProductFromTarget:
        if (type != null && type == TransactionType.deposit) {
          return "N???p ti???n t??? g??i t??ch l??y";
        }
        return "R??t v??? g??i t??ch lu???";
      default:
        return null;
    }
  }

  Future<bool> hasConnectInternet() async {
    ConnectivityResult result;
    try {
      result = await _connectivity.checkConnectivity();
      return result != ConnectivityResult.none;
    } on PlatformException catch (e) {
      log(e.toString());
    }
    return false;
  }

  Future<void> checkConnect() async {
    ConnectivityResult result;
    try {
      result = await _connectivity.checkConnectivity();
      _updateStatus(result);
      _connectivity.onConnectivityChanged.listen((event) {
        _updateStatus(event);
      });
    } on PlatformException catch (e) {
      log(e.toString());
    }
  }

  void _updateStatus(ConnectivityResult event) {
    switch (event) {
      case ConnectivityResult.wifi:
        break;
      case ConnectivityResult.mobile:
        break;
      case ConnectivityResult.none:
        hideDialog();
        Get.dialog(NetworkDialog(), name: "NetworkError");
        break;
    }
  }
}
