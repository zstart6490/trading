import 'package:trading_module/cores/resources/data_state.dart';
import 'package:trading_module/domain/entities/bank.dart';
import 'package:trading_module/domain/entities/reason.dart';
import 'package:trading_module/domain/repos/withdraw_repo.dart';

class OpenWithdrawUseCase {
  final WithdrawRepo _withdrawRepo;

  OpenWithdrawUseCase(this._withdrawRepo);

  Future<DataState<List<UserBank>>> listBankUser({required String tokenApp}) async{
    final result = await _withdrawRepo.listBankUser(tokenApp: tokenApp);

    return result;
  }

  Future<DataState<List<Reason>>> listReason() async{
    final result = await _withdrawRepo.listReasonCashOut();

    return result;
  }
}
