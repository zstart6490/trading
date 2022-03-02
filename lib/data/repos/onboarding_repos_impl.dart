import 'package:trading_project/cores/resources/data_state.dart';
import 'package:trading_project/data/entities/data_login.dart';
import 'package:trading_project/data/services/onboarding_service.dart';
import 'package:trading_project/domain/entities/data_login.dart';
import 'package:trading_project/domain/repos/onboarding_repos.dart';

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
}
