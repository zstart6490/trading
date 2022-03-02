import 'package:trading_module/cores/resources/data_state.dart';
import 'package:trading_module/domain/entities/data_login.dart';

abstract class OnBoardingRepos{

  Future<DataState<DataLogin>> getDataLoginUser({
    required String token,
    required String fbDeviceId,
    required String kyc,
  });
}