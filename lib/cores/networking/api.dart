import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:get/get_connect/connect.dart';
import 'package:trading_project/configs/constants.dart';
import 'result.dart';


enum Method { GET, POST, DELETE }

class Api extends GetConnect {
  final String backendUrl;
  final String fullToken;

  Api({required this.backendUrl, required this.fullToken});

  @override
  String get baseUrl => backendUrl;

  String get authorization => fullToken;

  @override
  void onInit() {
    httpClient.timeout = AppConstants.TIME_OUT;
    httpClient.addRequestModifier<void>((request) async {
      request.headers.remove('user-agent');
     // request.headers["OS-Version"] = "OS and version";
      //request.headers["Device-Name"] = "Device Model";
      //request.headers["App-ID"] = "1.0.0.111";
      //request.headers["App-Version"] = "1.0.0.111";
      //request.headers["Trading-Version"] = "1.0.0.222";
      request.headers['Device-Id'] = "device-id";
      request.headers['Authorization'] = authorization;
      if (kDebugMode) {
        log(request.headers.toString(), name: baseUrl);
      }
      return request;
    });

    super.onInit();
  }

  /// FOR NETWORKING WITH THE [Method.GET]
  /// RETURN DATA WITH [Result] MODEL
  Future<Result> getData({
    required String endPoint,
    Map<String, dynamic>? params,
    required Duration timeOut,
  }) async {
    onInit();
    Response? res;
    try {
      res = await get(endPoint, query: params).timeout(timeOut);

      if (res.isOk) {
        _requestOk(Method.GET, endPoint, params, res.bodyString);
      } else {
        _requestException(
          Method.GET,
          endPoint,
          "PARSING ERROR",
          params: params,
          bodyString: res.bodyString,
        );
      }
      return handlerResult(Result.fromJson(res.bodyString!),
          endPoint: endPoint);
    } on TimeoutException catch (e) {
      _requestException(
        Method.GET,
        endPoint,
        "TimeOut",
        params: params,
        bodyString: res?.bodyString,
        exception: e.message,
      );
      return onTimeOut(endPoint: endPoint, params: params);
    } catch (e) {
      _requestException(
        Method.GET,
        endPoint,
        "ERROR",
        params: params,
        bodyString: res?.bodyString,
        exception: e.toString(),
      );
      return onServerError(endPoint: endPoint, params: params);
    }
  }

  /// FOR NETWORKING WITH [Method.POST]
  /// RETURN DATA WITH [Result] MODEL
  Future<Result> postData({
    required String endPoint,
    dynamic params,
    required Duration timeOut,
  }) async {
    onInit();
    Response? res;
    try {
      if (params == null) {
        res = await httpClient.post(endPoint).timeout(timeOut);
      } else {
        res = await httpClient.post(endPoint, body: params).timeout(timeOut);
      }
      if (res.isOk) {
        _requestOk(Method.POST, endPoint, params, res.bodyString);
      } else {
        _requestException(
          Method.POST,
          endPoint,
          "PARSING ERROR",
          params: params,
          bodyString: res.bodyString,
        );
      }
      return handlerResult(Result.fromJson(res.bodyString ?? ""),
          endPoint: endPoint);
    } on TimeoutException catch (e) {
      _requestException(
        Method.POST,
        endPoint,
        "TimeOut",
        params: params,
        bodyString: res?.bodyString,
        exception: e.message,
      );
      return onTimeOut(endPoint: endPoint, params: params);
    } catch (e) {
      _requestException(
        Method.POST,
        endPoint,
        "ERROR",
        params: params,
        bodyString: res?.bodyString,
        exception: e.toString(),
      );
      return onServerError(endPoint: endPoint, params: params);
    }
  }

  /// FOR NETWORKING WITH [Method.DELETE]
  /// RETURN DATA WITH [Result] MODEL
  Future<Result> deleteData({
    required String endPoint,
    required Duration timeOut,
    Map<String, dynamic>? params,
  }) async {
    onInit();

    Response? res;
    try {
      res = await delete(endPoint, query: params).timeout(timeOut);
      if (res.isOk) {
        _requestOk(Method.DELETE, endPoint, params, res.bodyString);
      } else {
        _requestException(
          Method.POST,
          endPoint,
          "PARSING ERROR",
          params: params,
          bodyString: res.bodyString,
        );
      }
      return handlerResult(Result.fromJson(res.bodyString!),
          endPoint: endPoint);
    } on TimeoutException catch (e) {
      _requestException(
        Method.DELETE,
        endPoint,
        "TimeOut",
        params: params,
        bodyString: res?.bodyString,
        exception: e.message,
      );
      return onTimeOut(endPoint: endPoint, params: params);
    } catch (e) {
      _requestException(
        Method.DELETE,
        endPoint,
        "ERROR",
        params: params,
        bodyString: res?.bodyString,
        exception: e.toString(),
      );
      return onServerError(endPoint: endPoint, params: params);
    }
  }

  _requestException(
    Method method,
    String endPoint,
    String status, {
    String? exception,
    String? bodyString,
    dynamic params,
  }) {
    if (kDebugMode) {
      final fullUrl = baseUrl + endPoint;
      log("$method: $fullUrl Params: $params", name: "API");
      log("$status => $exception", name: "API");
    }


  }

  _requestOk(Method method, String endpoint, dynamic params, dynamic response) {
    if (kDebugMode) {
      final fullUrl = baseUrl + endpoint;
      log("$method: $fullUrl Params: $params", name: "API");
      try {
        const JsonDecoder decoder = JsonDecoder();
        const JsonEncoder encoder = JsonEncoder.withIndent('  ');
        final object = decoder.convert(response as String);
        log("Response => ${encoder.convert(object)}", name: "API");
      } catch (e) {
        log(response.toString(), name: "API");
      }
    }

  }

  Result handlerResult(Result result, {String? endPoint}) {
    if (!result.success) {
      if (result.error != null) {

      }
    }
    return result;
  }


  Future<Result> onTimeOut(
      {Method method = Method.GET,
      required String endPoint,
      dynamic params}) async {

    return Result();
  }

  Future<Result> onServerError(
      {Method method = Method.GET,
      required String endPoint,
      dynamic params}) async {

    return Result();
  }


}
