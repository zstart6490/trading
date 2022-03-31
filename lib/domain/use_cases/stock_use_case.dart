import 'package:trading_module/cores/resources/data_state.dart';
import 'package:trading_module/domain/entities/stock_model.dart';
import 'package:trading_module/domain/repos/stock_repo.dart';

class StockUseCase {
  final StockRepo _stockRepo;

  StockUseCase(this._stockRepo);


  Future<DataState<List<StockModel>>> getList() async {
    final otp = await _stockRepo.getList();
    return otp;
  }

  Future<DataState<StockModel>> subscribe(List<String> stocks) async {
    final otp = await _stockRepo.subscribe(stocks: stocks);
    return otp;
  }


}