import 'package:trading_module/cores/resources/data_state.dart';
import 'package:trading_module/data/entities/user_contract.dart';
import 'package:trading_module/data/services/user_service.dart';
import 'package:trading_module/domain/entities/user_contract.dart';
import 'package:trading_module/domain/repos/user_repos.dart';



class UserRepoImpl extends UserRepo {
  final UserService _services;

  UserRepoImpl(this._services);

  @override
  Future<DataState<UserContractModel>> getContractUser({required String? url}) async{
    final result = await _services.getUserContract();
    if (result.success) {
      final model = UserContractDTO.fromJson(result as Map<String, dynamic>).toModel();
      return DataSuccess(model);
    }
    return DataFailed(result.error);
  }

  // @override
  // Future<DataState<OtpModel>> enableSmartOTP(
  //     {required String? smsOTP}) async {
  //   final result = await _services.enableSmartOTP(smsOTP);
  //   if (result.success && result.data != null) {
  //     final model = OtpData.fromJson(result.data as Map<String, dynamic>).toModel();
  //     return DataSuccess(model);
  //   }
  //   return DataFailed(result.error);
  // }
}

