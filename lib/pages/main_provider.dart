import 'dart:developer';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:trading_module/cores/states/base_common_widget.dart';
import 'package:trading_module/data/entities/data_input_app.dart';
import 'package:trading_module/domain/entities/data_login.dart';
import 'package:trading_module/domain/entities/user_data.dart';
import 'package:trading_module/shared_widgets/NetworkDialog.dart';

class MainTradingProvider with BaseCommonWidgets {
  UserData? userData;
  ConfigMap? configMap;

  GetStorage get box => GetStorage();
  final _connectivity = Connectivity();
  DataInputApp dataInputApp;
  Function()? callToEKYC;
  Function()? callToActiveOTP;
  Function()? callToForgetPin;

  MainTradingProvider(this.dataInputApp, this.callToEKYC, this.callToActiveOTP,
      this.callToForgetPin);

  // void updateDataInput(DataInputApp dataInputApp){
  //   this.dataInputApp =dataInputApp;
  // }

  String deviceId = "";
  String deviceName = "";
  String appVersion = "";
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
