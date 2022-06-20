import 'package:get/get.dart';
import 'package:trading_module/configs/constants.dart';
import 'package:trading_module/configs/service_api_config.dart';
import 'package:trading_module/cores/networking/api.dart';
import 'package:trading_module/cores/networking/result.dart';
import 'package:trading_module/pages/main_provider.dart';

class MarketApiServices {
  String get backendUrl => "";

  MarketApiServices() {
    final MainTradingProvider mainProvider = Get.find<MainTradingProvider>();
    api = Api(
        backendUrl: Environment().marketUrl,
        fullToken: mainProvider.accessToken ?? "",
        userId: mainProvider.userData?.id.toString() ?? "");
    api.onInit();
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
