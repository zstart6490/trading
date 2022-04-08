import 'package:trading_module/cores/resources/data_state.dart';
import 'package:trading_module/domain/entities/product_own.dart';
import 'package:trading_module/domain/repos/user_repos.dart';

class UserStockUseCase{
  final UserRepo _userRepo;

  UserStockUseCase(this._userRepo);

  Future<DataState<List<ProductOwn>>> getListProductOwn() async {
    final result = await _userRepo.getListProductOwn();
    return result;
  }

}