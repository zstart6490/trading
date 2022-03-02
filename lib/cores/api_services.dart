import 'package:intl/intl.dart';
import 'package:trading_project/configs/constants.dart';
import 'package:trading_project/cores/networking/result.dart';
import 'package:trading_project/data/entities/model.dart';

import 'package:trading_project/cores/networking/api.dart';

import '../configs/service_api_config.dart';
import 'networking/http_response.dart';

class ApiServices {
  String get backendUrl => "";

  ApiServices(String fullToken) {
    api = Api(backendUrl: Environment().backendUrl, fullToken: "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJleHAiOjE2NDYyMzg2MTksInVzZXJJZCI6MTUxLCJ1dWlkIjoiNDY4M2MzNzktMGQxMy00MGJlLTkxMDAtYjRiNWMxNDFmOTE3IiwidXNlcm5hbWUiOiIwOTczNTkxNzI4In0.ixf23yqE78aEXIMY3TIRbWezMAXEfHmmZU-VU7-DZ8CrIHcjgcw8WLljtYhR182rqESnkDSRxHXJ9p9AOzBLsXXUD6jNfIfbLPieBgBLBJyvU3N5rvnsmsk-ZgFkVafFsFfx4FHli-iEZW0LBE-9kZzLXJsQvixx-l_pvUR9cOLX8nu_jtqeKTSbnLilEX7QxGtee0RVcYuX4fvez5NB3RRmK-hP-tsATAT069_jN94WUR-71A-KezNeXOKjo9otHWU-MoAHpcn4QtxjuAhmh4cSKINpiISvx5UdBhJQPvTLX0tS8PNHuOhL-i5lKTQCuG-iHUMz6cvkY-6ZBZM3LqbQAPJAaNe6UsI8Zwqh-5FB7CRvn1BgYWvwdyAckuGX-zXcAKyeUo6VUbT0F-YIi8FQEiuLAeCT7hEBZRQaeHerXX9PCINCelKMhhdjS_CGF7cG8Nu6se5JyfNngfv-jfqOKTCRQqDc4hdhzcc2Ry4c0HhJomoViWV4SKfx9lMn6tpXB1TPfhhc5pidsJE_tbziru0-Tsh-XIukn8I73CCzo8_T6dWQPZVpRFnqYqooKAEoUyZfo-n56h3ppnQ7ufddI3adLnY3deHIZMAT7g1KjhvU608HtEEqs2KL6PCV_94Z7SJgfWsAGxHxtfXXKDAqV8YphYOUjZYvSdKA-EU");
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
