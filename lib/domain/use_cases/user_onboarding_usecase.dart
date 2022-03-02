import 'package:trading_project/cores/resources/data_state.dart';
import 'package:trading_project/domain/entities/data_login.dart';
import 'package:trading_project/domain/repos/onboarding_repos.dart';

class UserOnBoardingUseCase {
  final OnBoardingRepos _onBoardingRepos;

  UserOnBoardingUseCase(this._onBoardingRepos);

  Future<DataState<DataLogin>> getDataLoginUser(
      {required String token,
        required String fbDeviceId,
        required String kyc}) async {
    var result = await _onBoardingRepos.getDataLoginUser(token: token, fbDeviceId: fbDeviceId, kyc: kyc);
    // xử lý thêm nếu muốn
    return result;
  }
}