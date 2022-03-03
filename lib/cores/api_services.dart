import 'package:get/get.dart';
import 'package:trading_module/configs/constants.dart';
import 'package:trading_module/cores/networking/result.dart';
import 'package:trading_module/cores/networking/api.dart';
import 'package:trading_module/pages/main_provider.dart';
import '../configs/service_api_config.dart';

class ApiServices {
  String get backendUrl => "";
  final String tokenTest ="eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJiaXJ0aGRheSI6IjIwMjIvMDIvMjMiLCJwaG9uZU51bWJlciI6IjA5NzI0NDYwMjMiLCJhZGRyZXNzIjoiVGF5IEhhIFRvd2VyLCAxOCBUbyBIdXUsIE5hbSBUdSBMaWVtLCBIYSBOb2ksIFZpZXQgTmFtZSIsImdlbmRlciI6IjAiLCJuYW1lIjoiMDk3MjQ0NjAyMyIsImlkIjozNCwiZXhwIjoxNjQ2MTE5MjcwLCJ1dWlkIjoiN2ExNDE1MzctOWMxOS00OTdkLWJmNTctODg4MGUxY2ZlYjU4IiwiZW1haWwiOiJ0cmFkaW5nQHRlY2hsYWIuYWkifQ.HzFc_nRUV5vyLwlk736Yyva47RBM9jT161n2UOVArGPAZJGdXssZqC2yg8od6RzKBBiaKpD5-GMIfjfqf2zclLDsKrNU8_Mz93SEN81rWWp8Fm6F3qcYrn9MdZQq_9D9-MYEuL28FgdRAf53_YUM8LmRELGeZouUuJs_BPG00UwdqhUTe4007LOY5juqVOZI8yz-fgi0sc67sUCJyBs_uqxgedX1fx8z9TjWh02fOeSHAyVB6dbEPdSAhNGFWWQgpRYm3HFwVzDCYP7dMMK6MJDBPYUY4LZmF4tn_6HRm3Mb9eghOBt8kajjaQwNbQXMFzFxVWBcDJKkAm2lmcjIn4oFbqKGiwpW6L8ANA-6VvzPNgxaHUybqpfL5M7BTkpYd7jBisz7yd6VS1HLCjKAc9BO34pO9EIW4ravFFk4xSSfP1x7wRy8jIkUX4Ymwe95q4nW3IhxnrgcTqiIRqFaK7VAfkjinUbklqoDoVqntfnwiNKRr3bYF9SJv8Vv_anKLjqIZWRBa8qNHmtIPE8KVsl8fdebJpFE4K5w8B6XwlYYkuoshZTSpfF31xWOHjzPlXUIfucYdDsb32lyNAjes1RPHVuWwykc52kaesL_myf5NtKlts1Q9eVBDTjADtjtVngplRNf4qptUS5Ka_fFisPyBdY6ZDoT6pZ_XwKb3Y0";
  ApiServices() {
    MainTradingProvider mainProvider = Get.find<MainTradingProvider>();
    api = Api(backendUrl: Environment().backendUrl, fullToken: mainProvider.accessToken?.fullToken ?? tokenTest);
  }

  // ApiServices(String fullToken) {
  //   api = Api(backendUrl: Environment().backendUrl, fullToken: "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJleHAiOjE2NDYyMzg2MTksInVzZXJJZCI6MTUxLCJ1dWlkIjoiNDY4M2MzNzktMGQxMy00MGJlLTkxMDAtYjRiNWMxNDFmOTE3IiwidXNlcm5hbWUiOiIwOTczNTkxNzI4In0.ixf23yqE78aEXIMY3TIRbWezMAXEfHmmZU-VU7-DZ8CrIHcjgcw8WLljtYhR182rqESnkDSRxHXJ9p9AOzBLsXXUD6jNfIfbLPieBgBLBJyvU3N5rvnsmsk-ZgFkVafFsFfx4FHli-iEZW0LBE-9kZzLXJsQvixx-l_pvUR9cOLX8nu_jtqeKTSbnLilEX7QxGtee0RVcYuX4fvez5NB3RRmK-hP-tsATAT069_jN94WUR-71A-KezNeXOKjo9otHWU-MoAHpcn4QtxjuAhmh4cSKINpiISvx5UdBhJQPvTLX0tS8PNHuOhL-i5lKTQCuG-iHUMz6cvkY-6ZBZM3LqbQAPJAaNe6UsI8Zwqh-5FB7CRvn1BgYWvwdyAckuGX-zXcAKyeUo6VUbT0F-YIi8FQEiuLAeCT7hEBZRQaeHerXX9PCINCelKMhhdjS_CGF7cG8Nu6se5JyfNngfv-jfqOKTCRQqDc4hdhzcc2Ry4c0HhJomoViWV4SKfx9lMn6tpXB1TPfhhc5pidsJE_tbziru0-Tsh-XIukn8I73CCzo8_T6dWQPZVpRFnqYqooKAEoUyZfo-n56h3ppnQ7ufddI3adLnY3deHIZMAT7g1KjhvU608HtEEqs2KL6PCV_94Z7SJgfWsAGxHxtfXXKDAqV8YphYOUjZYvSdKA-EU");
  // }
  //
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
