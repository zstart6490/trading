import 'package:trading_module/cores/resources/data_state.dart';
import 'package:trading_module/data/entities/stock_model_dto.dart';
import 'package:trading_module/data/services/stock_service.dart';
import 'package:trading_module/domain/entities/stock_model.dart';
import 'package:trading_module/domain/repos/stock_repo.dart';



class StockRepoImpl extends StockRepo {
  final StockService _services;

  StockRepoImpl(this._services);


  @override
  Future<DataState<List<StockModel>>> getList() async{
    final result = await _services.getList();
    if (result.success) {
      final model = result.modelDTO;
      final List<StockModel> list =[];
      for (final value in model) {
        list.add(value.toModel());
      }
      return DataSuccess<List<StockModel>>(list);
    }
    return DataFailed(result.error);
  }

  @override
  Future<DataState<StockModel>> subscribe({required List<String> stocks}) async{
    final result = await _services.subscribe(stocks);
    if (result.success) {
      final model = StockModelDTO.fromJson(result as Map<String, dynamic>).toModel();
      return DataSuccess(model);
    }
    return DataFailed(result.error);
  }

}
