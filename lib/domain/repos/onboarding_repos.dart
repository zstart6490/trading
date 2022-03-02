import 'package:trading_project/cores/resources/data_state.dart';
import 'package:trading_project/domain/entities/data_login.dart';

abstract class OnBoardingRepos{

  Future<DataState<DataLogin>> getDataLoginUser({
    required String token,
    required String fbDeviceId,
    required String kyc,
  });
}