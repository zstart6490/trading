import 'package:trading_module/cores/resources/data_state.dart';
import 'package:trading_module/domain/entities/product_own.dart';



abstract class UserRepo {

  Future<DataState<List<ProductOwn>>> getListProductOwn();
}