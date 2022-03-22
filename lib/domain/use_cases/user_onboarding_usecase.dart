import 'package:trading_module/cores/resources/data_state.dart';
import 'package:trading_module/domain/entities/data_login.dart';
import 'package:trading_module/domain/repos/onboarding_repos.dart';

class UserOnBoardingUseCase {
  final OnBoardingRepos _onBoardingRepos;

  UserOnBoardingUseCase(this._onBoardingRepos);

  Future<DataState<DataLogin>> getDataLoginUser(
      {required String token,
        required String fbDeviceId,
        required String kyc}) async {
    final result = await _onBoardingRepos.getDataLoginUser(token: token, fbDeviceId: fbDeviceId, kyc: kyc);
    // xử lý thêm nếu muốn
    return result;
  }

  Future<DataState<DataLogin>> registerTrading(String email, String kyc,
      String phone, String phoneCountryCode, String token) async {
    final otp = await _onBoardingRepos.registerTrading(
        email: email,
        kyc: kyc,
        phone: phone,
        phoneCountryCode: phoneCountryCode,
        token: token);
    return otp;
  }
}