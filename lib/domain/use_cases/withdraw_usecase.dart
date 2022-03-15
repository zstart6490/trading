import 'package:trading_module/cores/resources/data_state.dart';
import 'package:trading_module/data/entities/info_withdraw_dto.dart';
import 'package:trading_module/domain/entities/bank.dart';
import 'package:trading_module/domain/repos/withdraw_repo.dart';

class WithdrawUseCase {
  final WithdrawRepo _withdrawRepo;

  WithdrawUseCase(this._withdrawRepo);

  Future<DataState<InfoWithdraw>> createCashOut({required String linkId, required String amount}) async {
    final result = await _withdrawRepo.createCashOut(linkId: linkId,amount: amount);
    return result;
  }

  Future<DataState<List<UserBank>>> listBankUser({required String tokenApp}) async{
    final result = await _withdrawRepo.listBankUser(tokenApp: tokenApp);

    return result;
  }
}
