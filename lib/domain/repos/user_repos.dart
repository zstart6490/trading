import 'package:trading_module/cores/resources/data_state.dart';
import 'package:trading_module/domain/entities/product_own.dart';
import 'package:trading_module/domain/entities/user_contract.dart';


abstract class UserRepo {
  Future<DataState<UserContractModel>> getContractUser({
    required String? url
  });

  Future<DataState<List<ProductOwn>>> getListProductOwn();
}