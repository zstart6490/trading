import 'dart:developer';
import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/services.dart';
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
  final _connectivity = Connectivity();
  DataInputApp dataInputApp;
  Function()? callToEKYC;
  Function(Function()? onComplete)? callToAddBank;
  Function(TradingSmartOTPType smartOTPType)? callToActiveOTP;
  Function(TradingSmartOTPType smartOTPType)? callToForgetPin;

  MainTradingProvider(this.dataInputApp, this.callToEKYC, this.callToAddBank,
      this.callToActiveOTP, this.callToForgetPin);

  // void updateDataInput(DataInputApp dataInputApp){
  //   this.dataInputApp =dataInputApp;
  // }

  Future loadDataDeviceInfo() async{
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

  String? _accessToken;

  String? get accessToken => _accessToken;

  set accessToken(String? accessToken) => _setAccessToken(accessToken);

  _setAccessToken(String? accessToken) {
    _accessToken = accessToken;
  }

  void clearAccessToken() {
    _accessToken = null;
    userData = null;
    configMap = null;
    // box.remove(AUTH_TOKEN_KEY);
  }

  String? getMethodDisplay(TransactionMethod method, {TransactionType? type}) {
    switch (method) {
      case TransactionMethod.bankTransfer:
        return "Chuyển khoản ngân hàng";
      case TransactionMethod.ninePayKeep:
        return "Chuyển khoản ngân hàng";
      case TransactionMethod.ninePayGateWay:
        return "Thẻ ATM/Internet Banking";
      case TransactionMethod.bankTransferGlobal:
        return "Nạp tiền mặt";
      case TransactionMethod.paypal:
        return "Ví Paypal";
      case TransactionMethod.referral:
        return "Trả thưởng";
      case TransactionMethod.none:
        return "Chuyển khoản ngân hàng";
      case TransactionMethod.renew:
        return "Gia hạn hợp đồng";
      case TransactionMethod.moveProduct:
        return "Chuyển đổi hợp đồng";
      case TransactionMethod.transferSaving:
        return "Chuyển đổi hợp đồng";
      case TransactionMethod.moveProductFromTarget:
        if (type != null && type == TransactionType.deposit) {
          return "Nạp tiền từ gói tích lũy";
        }
        return "Rút về gói tích luỹ";
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
