import 'package:get_storage/get_storage.dart';
import 'package:trading_module/data/entities/data_input_app.dart';
import 'package:trading_module/domain/entities/user_data.dart';

class MainTradingProvider {
  UserData? userData;

  GetStorage get box => GetStorage();

  DataInputApp dataInputApp;
  Function()? callToEKYC;
  Function()? callToActiveOTP;
  Function()? callToForgetPin;

  MainTradingProvider(this.dataInputApp, this.callToEKYC, this.callToActiveOTP, this.callToForgetPin);

  String deviceId = "";
  String deviceName = "";
  String appVersion = "";
  String osVersion = "";

  AccessToken? _accessToken;

  AccessToken? get accessToken => _accessToken;

  set accessToken(AccessToken? accessToken) => _setAccessToken(accessToken);

  _setAccessToken(AccessToken? accessToken) {
    _accessToken = accessToken;
    // callBackEky?.call();
  }

  void clearAccessToken() {
    _accessToken = null;
  }
}
