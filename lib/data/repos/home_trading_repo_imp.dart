import 'package:trading_module/cores/resources/data_state.dart';
import 'package:trading_module/data/entities/account_model_dto.dart';
import 'package:trading_module/data/services/home_trading_service.dart';
import 'package:trading_module/domain/entities/account_info_model.dart';
import 'package:trading_module/domain/repos/home_trading_repo.dart';


class HomeTradingRepoImpl extends HomeTradingRepo {
  final HomeTradingService _services;

  HomeTradingRepoImpl(this._services);


  @override
  Future<DataState<AccountInfoModel>> getAccountInfo() async{
    final result = await _services.getAccountInfo();
    if (result.success) {
      final model = result.modelDTO.toModel();
      return DataSuccess(model);
    }
    return DataFailed(result.error);
  }

}

