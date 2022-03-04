import 'package:trading_module/cores/resources/data_state.dart';
import 'package:trading_module/data/entities/data_login.dart';
import 'package:trading_module/data/services/onboarding_service.dart';
import 'package:trading_module/domain/entities/data_login.dart';
import 'package:trading_module/domain/repos/onboarding_repos.dart';

class OnBoardingReposImpl extends OnBoardingRepos {
  final OnBoardingService _services;

  OnBoardingReposImpl(this._services);

  @override
  Future<DataState<DataLogin>> getDataLoginUser(
      {required String token,
      required String fbDeviceId,
      required String kyc}) async {
    var result = await _services.getDataLoginUser(token,kyc);
    if (result.response.success) {
      var data = result.data.toModel();
      return DataSuccess(data);
    }
    return DataFailed(result.response.error);
  }

  @override
  Future<DataState<DataLogin>> registerTrading({required String email, required String kyc, required String phone, required String phoneCountryCode, required String token}) async{
    final result = await _services.registerTrading(email, kyc, phone, phoneCountryCode, token);
    if (result.response.success) {
      var model = result.data.toModel();
      return DataSuccess(model);
    }
    return DataFailed(result.response.error);
  }
}
