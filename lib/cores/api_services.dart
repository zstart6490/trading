import 'package:get/get.dart';
import 'package:trading_project/configs/constants.dart';
import 'package:trading_project/cores/networking/result.dart';
import 'package:trading_project/cores/networking/api.dart';
import 'package:trading_project/pages/main_provider.dart';
import '../configs/service_api_config.dart';

class ApiServices {
  String get backendUrl => "";
  final String tokenTest ="eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJiaXJ0aGRheSI6IjIwMjIvMDIvMjMiLCJwaG9uZU51bWJlciI6IjA5NzI0NDYwMjMiLCJhZGRyZXNzIjoiVGF5IEhhIFRvd2VyLCAxOCBUbyBIdXUsIE5hbSBUdSBMaWVtLCBIYSBOb2ksIFZpZXQgTmFtZSIsImdlbmRlciI6IjAiLCJuYW1lIjoiMDk3MjQ0NjAyMyIsImlkIjozNCwiZXhwIjoxNjQ2MTE5MjcwLCJ1dWlkIjoiN2ExNDE1MzctOWMxOS00OTdkLWJmNTctODg4MGUxY2ZlYjU4IiwiZW1haWwiOiJ0cmFkaW5nQHRlY2hsYWIuYWkifQ.HzFc_nRUV5vyLwlk736Yyva47RBM9jT161n2UOVArGPAZJGdXssZqC2yg8od6RzKBBiaKpD5-GMIfjfqf2zclLDsKrNU8_Mz93SEN81rWWp8Fm6F3qcYrn9MdZQq_9D9-MYEuL28FgdRAf53_YUM8LmRELGeZouUuJs_BPG00UwdqhUTe4007LOY5juqVOZI8yz-fgi0sc67sUCJyBs_uqxgedX1fx8z9TjWh02fOeSHAyVB6dbEPdSAhNGFWWQgpRYm3HFwVzDCYP7dMMK6MJDBPYUY4LZmF4tn_6HRm3Mb9eghOBt8kajjaQwNbQXMFzFxVWBcDJKkAm2lmcjIn4oFbqKGiwpW6L8ANA-6VvzPNgxaHUybqpfL5M7BTkpYd7jBisz7yd6VS1HLCjKAc9BO34pO9EIW4ravFFk4xSSfP1x7wRy8jIkUX4Ymwe95q4nW3IhxnrgcTqiIRqFaK7VAfkjinUbklqoDoVqntfnwiNKRr3bYF9SJv8Vv_anKLjqIZWRBa8qNHmtIPE8KVsl8fdebJpFE4K5w8B6XwlYYkuoshZTSpfF31xWOHjzPlXUIfucYdDsb32lyNAjes1RPHVuWwykc52kaesL_myf5NtKlts1Q9eVBDTjADtjtVngplRNf4qptUS5Ka_fFisPyBdY6ZDoT6pZ_XwKb3Y0";
  ApiServices() {
    MainTradingProvider mainProvider = Get.find<MainTradingProvider>();
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
