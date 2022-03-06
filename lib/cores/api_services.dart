import 'package:get/get.dart';
import 'package:trading_module/configs/constants.dart';
import 'package:trading_module/configs/service_api_config.dart';
import 'package:trading_module/cores/networking/api.dart';
import 'package:trading_module/cores/networking/result.dart';
import 'package:trading_module/pages/main_provider.dart';

class ApiServices {
  String get backendUrl => "";

  final String tokenTest ="eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJleHAiOjE2NDY1MTcxMjYsInVzZXJJZCI6MTUxLCJ1dWlkIjoiMDk1ZTA3Y2QtYzFkZC00N2ZmLWI1NzgtMTg4M2IyZDc3Mjc3IiwidXNlcm5hbWUiOiIwOTczNTkxNzI4In0.bDiMRl3n3yYJRMb7mbv74TcuOm0eTThHGBsS-zZ2fSD4qaonIF134MdoCE56XtNTMcuGowRW9MPcl_5qkbyVI5lPw5SBcGmVPwjtAHFzQ1Q8M6iPDlHNy1p5Hz1jVWcaVEVMhn06ZGl-JoraRAd7UPESe5IQCXz4TvWm7kLfG5K2ifK-5-2zF8JNHKswN1mXy9TbV8Cje8l6zfan3jUvQuT-SKq6eyfotDptRhYwMUw4ff_zDD6Bspqcy9Q7UhQAOq3mG_m99P4LzZz62J4sLENmZuEXoWbdo8mQJnuOAe_KiIDwhF1Ai5zZywxZbT1R3SgEV1mTvTMxGqjJJIKPKsMk9hNHF8bbmMK2Uxqv_QU4AhwkycZ2S-fk7wxZ-Z68AcoWAVHkQkCpN05xgtiHfNTdFhe5lXS0wOM_DOvz_Ny_KUIGhvtkbOwxPx050-Zkd46bLEVxsl2qt-i5qMcy6rZBCZeaifOO2kxq_veBrrwmk6ALt3ia-C4i1MAhVpRP6engM1mHM_tEG1Lo1UikIwhdqrRyZrCWgFPNvIBWVsWs--t77s2fURalL-tzBbzq7YkBvc9uRDT3wMJnnfCi8BPHiQmC9TwdlZvk4xRHAmKT8aBwpZ59ZkoY7Wv3h6uDKHnlzwifYzz998n2HAG_szKu5MjisK-e3NqWI0D7eHE";
  ApiServices() {
    MainTradingProvider mainProvider = Get.find<MainTradingProvider>();

    //mainProvider.accessToken?.fullToken = tokenTest;
    api = Api(backendUrl: Environment().backendUrl, fullToken: tokenTest);

  }

  late Api api;

  Future<Result> getData({
    required String endPoint,
    Map<String, dynamic>? params,
    Duration timeOut = AppConstants.TIME_OUT,
  }) async {
    return api.getData(endPoint: endPoint, params: params, timeOut: timeOut);
  }

  Future<Result> postData({
    required String endPoint,
    dynamic params,
    Duration timeOut = AppConstants.TIME_OUT,
  }) async {
    return api.postData(endPoint: endPoint, params: params, timeOut: timeOut);
  }

  Future<Result> deleteData({
    required String endPoint,
    Map<String, dynamic>? params,
    Duration timeOut = AppConstants.TIME_OUT,
  }) async {
    return api.deleteData(endPoint: endPoint, params: params, timeOut: timeOut);
  }
}
