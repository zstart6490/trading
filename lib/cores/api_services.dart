import 'package:get/get.dart';
import 'package:trading_module/configs/constants.dart';
import 'package:trading_module/configs/service_api_config.dart';
import 'package:trading_module/cores/networking/result.dart';
import 'package:trading_module/cores/networking/api.dart';
import 'package:trading_module/pages/main_provider.dart';


class ApiServices {
  String get backendUrl => "";
  final String tokenTest ="eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJleHAiOjE2NDYzOTQxNjgsInVzZXJJZCI6MTUxLCJ1dWlkIjoiNDRkYTEyMzYtNDdkNC00MGM3LTgzMzktNzQ2NWM1M2RmNzNhIiwidXNlcm5hbWUiOiIwOTczNTkxNzI4In0.s6A2UkvdYPUxDlsYZHKMVXTRE5zR9GVQzh9jjRJKjsHIrWUmpdoe6pb9OJbeK55SCF-i2AwlVPD8kEEG31_XmbyVWyNlMM4RRMWIVZ4lF1cPMNO6kFXxbJy2ftpoHRKiesCNbkHVyLyMLQNK0QSSKa_l4RPSfWuyV7OM4iVBMiRMcGtPaFTtZZ0NgGajEkJuKbWarVigidC92jlhDTmRxFoj0A1NAk5YB75cKFs43U_doGNvsJxi3p0_8XQVMkq8HGzkI-1KONIaTkv3NOBM0exTmVAwT6andr0ClfmcaLcFqXIgodTOtmhkrRmpEjXmUtK38nJBjgmnwDKKRddAsi23ife5KrigORSmvu1TnA6I6-776uyB_hb9xTq480O4hIhyupTBVlfyGBiR94JJyJp5MykSZ0NtlkVgRL5hIsic1sJZyZnH9xudWCdWaCMSwfPp83qKGjeyDYKPRMwfSKIvFsqWocl90BA9SF_NR_LzAxK2R2ZSNLU5DLou0T5bV-WSO4CFd2o5QizBxefrc4go4h8JM54clJU2U2BsIzUfm1yp8RBYZ6xAd09KMlM2M7xpKLVPdwUTLVh5fCb7bW0Lwcu1XM7KVFrMtJArlALCyQIKOdRxNC79KSJu4cf0Zq_E_Hlm9D31IuthUDcDKlgkv7vx5DtV-cU3d2d2W4c";
  ApiServices() {
    MainTradingProvider mainProvider = Get.find<MainTradingProvider>();

    //mainProvider.accessToken?.fullToken = tokenTest;
    api = Api(backendUrl: Environment().backendUrl, fullToken: mainProvider.accessToken?.fullToken ?? tokenTest);
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
