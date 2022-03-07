import 'package:get/get.dart';
import 'package:trading_module/configs/constants.dart';
import 'package:trading_module/configs/service_api_config.dart';
import 'package:trading_module/cores/networking/api.dart';
import 'package:trading_module/cores/networking/result.dart';
import 'package:trading_module/pages/main_provider.dart';

class ApiServices {
  String get backendUrl => "";

  final String tokenTest ="eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJleHAiOjE2NDY2NTgzOTEsInVzZXJJZCI6MTUxLCJ1dWlkIjoiODU3OWNjNDUtNWNhMi00NTZlLWEyZjUtNTRmZTFjMWEwMjBmIiwidXNlcm5hbWUiOiIwOTczNTkxNzI4In0.dcY9NlL6ApNdL02pGfuT2SKbUX7B6C5BI2fRHjVoY0mx5coK0lvgtreD3080_VQsw6WLc8r_glVfNNTW0mPYEGyj7JoaHK-BvT0Pp7JcULKqCgeES-3ihiJ6u3AMo74okt3ZsbVeBXQCSMJEl0cKix7xSeH7GZ9RZ2VdYJK3kHZLAj6X6lHY8sjUOevUEgNg8AWAaieDAs0JLd3Ctdhqg9a3dEWZpw5X3d2TCO2Bql9f6A8olHdiFEzwF9q8WuUFXCDfaz6KRGYdGUH3gI4N42wZXJ2oegl1YpTwPQkBYrH2wVdZ8gLd3Ljq6T6GgjXtjxFHxfYHuyqTNFLpluE98cM_xIXYkEWALR5E3d1pDJHpMNXtf_YVLaB9NT_vEvFqrK8P1mg3ABGpWZev2iqzPmnZuMvhRwkH3TRgCOq_IEoWkjD-Q3hRKJGeLrY2Dy1gh7vkmYX0fAFB6mvtcYMmtfY1Qis7CnKpZSpuK9f5YhdDjcmjPTI9i8Psb43tjaIKZ9nOr3c4PRopWBWrEnILkNzXiAntfi6oRmqaDhd35xGPfSXf0oJSfmLvMHI5hLoZP3K9o3iP5sPTIltpAzbzF0mPuqMJD0dGDeg9ubZgUZCpSEf0Wzf4a6fq-LL-0oBV16w6Ws5Zfc4aPw4GkPCPVKXyOTVA8zqG-OihauYoffE";
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
