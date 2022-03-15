import 'package:trading_module/cores/resources/data_state.dart';
import 'package:trading_module/data/entities/bank_dto.dart';
import 'package:trading_module/data/entities/info_withdraw_dto.dart';
import 'package:trading_module/data/services/withdraw_service.dart';
import 'package:trading_module/domain/entities/bank.dart';
import 'package:trading_module/domain/repos/withdraw_repo.dart';

class WithdrawRepoImpl extends WithdrawRepo{

  final WithdrawService _services;

  WithdrawRepoImpl(this._services);

  @override
  Future<DataState<InfoWithdraw>> createCashOut({required String linkId, required String amount}) async {
    final result = await _services.createCashOut(linkId,amount);
    if (result.success) {
      final model = result.modelDTO;
      return DataSuccess(model);
    }
    return DataFailed(result.error);
  }

  @override
  Future<DataState<List<UserBank>>> listBankUser({required String tokenApp}) async{
    final result = await _services.listBankUser(tokenApp);
    if (result.success) {
      final model = result.modelDTO;
      final List<UserBank> list =[];
      for (final value in model) {
        list.add(value.toModel());
      }
      return DataSuccess<List<UserBank>>(list);
    }
    return DataFailed(result.error);
  }

}