import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:crypto/crypto.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:trading_module/configs/constants.dart';
import 'package:trading_module/cores/networking/result.dart';
import 'package:trading_module/pages/main_controller.dart';
import 'package:trading_module/pages/main_provider.dart';
import 'package:trading_module/utils/extensions.dart';

enum Method { GET, POST, DELETE }

class Api extends GetConnect {
  final String backendUrl;
  String fullToken;
  final String userId;

  Api(
      {required this.backendUrl,
      required this.fullToken,
      required this.userId});

  @override
  String get baseUrl => backendUrl;

  String get authorization => fullToken;

  String generateMd5(String input) {
    return md5.convert(utf8.encode(input)).toString();
  }

  @override
  void onInit() {
    httpClient.timeout = AppConstants.TIME_OUT;
    final mainProvider = GetInstance().find<MainTradingProvider>();
    httpClient.addRequestModifier<void>((request) async {
      // request.headers.remove('user-agent');
      request.headers["Parent-App"] = "TIKOP";
      request.headers["Lang"] = "vi";
      request.headers["App-Ver"] = mainProvider.appVersion;
      request.headers["Trading-Ver"] = mainProvider.appTradingVersion;
      request.headers["Device-ID"] = mainProvider.deviceId;
      request.headers['Authorization'] = authorization;
      request.headers['X-Request-ID'] = generateMd5(
          "$userId${DateTime.now().millisecond.toString()}${4.genRandom()}");
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
        print("body:");
        print(res.body);
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
      log("Response => ${bodyString}", name: "API");
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
      if (result.code == 100) {
        //token khong hop le
        print(result.msg);
        return result;
      } else if (result.code == 401) {
        //UNAUTHORIZED
        Get.find<MainController>().refreshToken(() => refreshTokenSuccess());
        print(result.msg);
        // Get.find<MainController>().refreshToken(() => refreshTokenSuccess());
        return result;
      } else if (result.code == SESSION_TIMEOUT_CODE) {
        //UNAUTHORIZED
        print(result.msg);
        Get.find<MainController>().refreshToken(() => refreshTokenSuccess());
        return result;
      }
    }
    return result;
  }

  void refreshTokenSuccess() {
    //
    final MainTradingProvider mainProvider = Get.find<MainTradingProvider>();
    fullToken = mainProvider.accessToken ?? "";
  }

  Future<Result> onTimeOut(
      {Method method = Method.GET,
      required String endPoint,
      dynamic params}) async {
    return Result(msg: "onTimeOut=$endPoint", success: false, code: -1);
  }

  Future<Result> onServerError(
      {Method method = Method.GET,
      required String endPoint,
      dynamic params}) async {
    return Result(msg: "onServerError=$endPoint", success: false, code: -1);
  }
}
