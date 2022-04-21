import 'package:trading_module/cores/resources/data_state.dart';
import 'package:trading_module/data/entities/product_own_dto.dart';
import 'package:trading_module/data/services/user_service.dart';
import 'package:trading_module/domain/entities/product_own.dart';
import 'package:trading_module/domain/repos/user_repos.dart';


class UserRepoImpl extends UserRepo {
  final UserService _services;

  UserRepoImpl(this._services);


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

