import 'package:trading_module/domain/entities/user_contract.dart';

import '../../cores/resources/data_state.dart';


abstract class UserRepo {
  Future<DataState<UserContractModel>> getContractUser({
    required String? url
  });

}