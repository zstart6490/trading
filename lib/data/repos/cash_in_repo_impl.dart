import 'package:trading_module/cores/resources/data_state.dart';
import 'package:trading_module/data/entities/cash_in_confirm_model_dto.dart';
import 'package:trading_module/data/entities/cash_in_create_model_dto.dart';
import 'package:trading_module/data/services/cash_in_service.dart';
import 'package:trading_module/domain/entities/cash_in_confirm_model.dart';
import 'package:trading_module/domain/entities/cash_in_create_model.dart';
import 'package:trading_module/domain/repos/cash_in_repo.dart';


class CashInRepoImpl extends CashInRepo {
  final CashInService _services;

  CashInRepoImpl(this._services);



  @override
  Future<DataState<CashInCreateModel>> createCashIn({required String amount}) async{
    final result = await _services.createCashIn(amount);
    if (result.success) {
      final model = result.modelDTO.toModel();
      return DataSuccess(model);
    }
    return DataFailed(result.error);
  }

  @override
  Future<DataState<CashInConfirmModel>> confirmCashIn({required String amount, required String transactionId}) async{
    final result = await _services.confirmCashIn(amount, transactionId);
    if (result.success) {
      final model = result.modelDTO.toModel();
      return DataSuccess(model);
    }
    return DataFailed(result.error);
  }

}

