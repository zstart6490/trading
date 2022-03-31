import 'package:trading_module/cores/resources/data_state.dart';
import 'package:trading_module/domain/entities/cash_in_confirm_model.dart';
import 'package:trading_module/domain/entities/cash_in_create_model.dart';
import 'package:trading_module/domain/repos/cash_in_repo.dart';




class CashInUseCase {
  final CashInRepo _cashInRepo;
  CashInUseCase(this._cashInRepo);

  Future<DataState<CashInCreateModel>> createCashIn(String amount) async {
    final result = await _cashInRepo.createCashIn(amount: amount);
    return result;
  }

  Future<DataState<CashInConfirmModel>> confirmCashIn(String transactionId) async {
    final result = await _cashInRepo.confirmCashIn(transactionId: transactionId);
    return result;
  }
}