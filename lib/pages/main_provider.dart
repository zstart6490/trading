import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:trading_module/domain/entities/user_data.dart';
import 'package:trading_module/kyc/kyc_callback.dart';

class MainTradingProvider {
  GetStorage get box => GetStorage();
   KycStatus userIsRegisteredKyc;
   bool userIsRegisteredOTP;


  MainTradingProvider({required this.userIsRegisteredKyc, required this.userIsRegisteredOTP});

  String deviceId = "";
  String deviceName = "";
  String appVersion = "";
  String osVersion = "";

  AccessToken? _accessToken;

  AccessToken? get accessToken => _accessToken;

  set accessToken(AccessToken? accessToken) => _setAccessToken(accessToken);

  _setAccessToken(AccessToken? accessToken) {
    _accessToken = accessToken;
  }

  void clearAccessToken() {
    _accessToken = null;
  }
}