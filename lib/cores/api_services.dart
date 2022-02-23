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
    api = Api(backendUrl: Environment().backendUrl, fullToken: fullToken);
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
