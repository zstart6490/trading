import 'package:get/get.dart';
import 'package:trading_module/configs/constants.dart';
import 'package:trading_module/configs/service_api_config.dart';
import 'package:trading_module/cores/networking/api.dart';
import 'package:trading_module/cores/networking/result.dart';
import 'package:trading_module/pages/main_provider.dart';

class ApiServices {
  String get backendUrl => "";


  final String tokenTest ="eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJleHAiOjE2NDY3MzE0MzQsInVzZXJJZCI6MTUxLCJ1dWlkIjoiMWRkYTU1Y2QtMzY5NC00ZGYzLTk5NGYtMTNiMWQ3ZTUyZjc2IiwidXNlcm5hbWUiOiIwOTczNTkxNzI4In0.aMytrAkBvHmV1D_-nDF5DdXd_zQ6KC3Y7xuKLAjL-6Cr7ZSc9-zaDeWvFJ6753gURE0vQUaY2QT7mkchl1inOxsSRv6i_l3544j4btyxpzx39JSPXYZhSr2g02IBICS_KqAL5hHAKCfjSuDdtzCqq-3yTiy_TXA8hfI-Noke1zifxB3brvUTdFeh1ZwB-7LuAUu8gFnLb5V9GRM2lBEHQXNWLYSQuqQ8mcl-RMNxqLRCy00DQHLf0sQFCF3MN9KDRkfUpZUl_ytuZIrCQc8aw0p0D2nJDdS0AG7Ki-rCRXfuzhwNTKVqdiBaNtawVLZAlJs_FVXaPD1HLksLkWf5fXazwbdeESOpjSF85PrFh5i01arSx-vElv203MsVmIlQBJKStGjyMrr5ZjiJKO5EC8s1jHUPUO3ab9z2FhjoqON--BxZXPYY_un_wIYal2e2_J0355fJJ4GrJ9a7BNRmsTuceXK7LKMZG9Vv_cqa2nbRM12YCBy2NtQ-v0S3kjQge-IMdLmhJ_992htaz13xK66c2uYAjwOof4sbt1mlVuojPRiXv8UZlGP0uo0kdJJ3ECTMvSdr7hsjRhMbXg5vSNkm1g-QvYzP5SPir7pQONDlcBftlUPxz-3L7cEFmGADYElC1OD3yHueXh_41II0xK8NCuPvZnKTvcd_E9u2p2E";

  ApiServices() {
    MainTradingProvider mainProvider = Get.find<MainTradingProvider>();
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
