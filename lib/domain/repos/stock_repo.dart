import 'package:trading_module/cores/resources/data_state.dart';
import 'package:trading_module/domain/entities/stock_model.dart';


abstract class StockRepo {

  Future<DataState<StockModel>> getList();

  Future<DataState<StockModel>> subscribe({
    required List<String> stocks,
  });


}