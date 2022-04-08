import 'package:trading_module/cores/resources/data_state.dart';
import 'package:trading_module/data/entities/product_own_dto.dart';
import 'package:trading_module/data/entities/user_contract.dart';
import 'package:trading_module/data/services/user_service.dart';
import 'package:trading_module/domain/entities/product_own.dart';
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

  @override
  Future<DataState<List<ProductOwn>>> getListProductOwn() async{
    final result = await _services.getListProductOwn();
    if (result.success) {
      if (result.success) {
        final model = result.modelDTO;
        final List<ProductOwn> list =[];
        for (final value in model) {
          list.add(value.toModel());
        }
        return DataSuccess<List<ProductOwn>>(list);
      }
    }
    return DataFailed(result.error);
  }


}

