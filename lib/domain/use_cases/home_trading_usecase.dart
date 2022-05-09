import 'package:trading_module/cores/resources/data_state.dart';
import 'package:trading_module/domain/entities/account_info_model.dart';
import 'package:trading_module/domain/repos/home_trading_repo.dart';

class HomeTradingUseCase {
  final HomeTradingRepo _cashInRepo;
  HomeTradingUseCase(this._cashInRepo);

  Future<DataState<AccountInfoModel>> getAccountInfo() async {
    final result = await _cashInRepo.getAccountInfo();
    return result;
  }

  DataState<AccountInfoModel> getCache() {
    final result = _cashInRepo.getCache();
    return result;
  }

}