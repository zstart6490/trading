import 'package:get/get.dart';
import 'package:trading_module/configs/constants.dart';
import 'package:trading_module/configs/service_api_config.dart';
import 'package:trading_module/cores/networking/api.dart';
import 'package:trading_module/cores/networking/result.dart';
import 'package:trading_module/pages/main_provider.dart';

class ApiServices {
  String get backendUrl => "";


  // final String tokenTest ="eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJleHAiOjE2NDY3NjM2MzMsInVzZXJJZCI6NDAwLCJ1dWlkIjoiYjgzYWI4MzItZDc2NS00MTM4LWEyOWEtZmM5N2MwMTMwZmYyIiwidXNlcm5hbWUiOiIwMzI2NjI2NTA3In0.YL5m2Om7ite13Vuz4vOqtXtjbhdirUfitMnncPhY3yBHb1qAXPMcAccvf2H_sbPJHLiCGosOyr3c8A5ZANXnqk1Xt9BmjlPbAR94cI-qKfs52O9aWQV_Dnnn7PgRehledRq2dYeYA7JQy_4FjiDKa_WMBde0mL-SHQNA9g2kR32MYwcGBKpX74to9TMLtGmGlKU1MdnEDNh1fudszthC5Fj7H0lgxSwK-hiYkHAux3hmDGGes07sXIC5ecWagzK0455nJGjVdRUN2GNOYa_uD5lBA_Lk6L6U0tbd0Bmb6ifdWnXGo_TotbKQ8tbaGKvZKRMDYvekQN4aVhh94YKPmJbzruVeJRYIw1wfGIUKgBRiXCUfCvpVqOVoBNiPOU69G649p_EJFa2bhKKOt7PwU3z3omcyb02k6i0eT6zO6cTMbqh5rcFg-MUsIVPnTm0b11d2wx-F20nO4unuvWB4H4hrmOrZeHuBbUkPjUyyfBxu4PY2BW_YmTkxLAyK0OOZg4T5HTluFD_fEgE03Rv_I0Qxnsw1mmbvnkOzjm1aeppQYelQYjVxIst2lLhbszto4rWDSLH2yguVEy2M-5AiLBPkDPuLfjyPMM8Yvacmi4jZOiNq0uO6F8os2WsVKh1BBfSz8x3539vL1TV5j0ZFi-RwQwC-hD1SDGrTXk9SXe8";

  ApiServices() {
    MainTradingProvider mainProvider = Get.find<MainTradingProvider>();
    api = Api(backendUrl: Environment().backendUrl, fullToken: mainProvider.accessToken?.token??"");
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
