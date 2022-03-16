import 'package:trading_module/cores/resources/data_state.dart';
import 'package:trading_module/domain/entities/cash_in_model.dart';
import 'package:trading_module/domain/entities/otp_generate_model.dart';
import 'package:trading_module/domain/repos/cash_in_repo.dart';




class CashInUseCase {
  final CashInRepo _cashInRepo;
  CashInUseCase(this._cashInRepo);


  Future<DataState<CashInModel>> createCashIn(String amount) async {
    final result = await _cashInRepo.createCashIn(amount: amount);
    return result;
  }
}