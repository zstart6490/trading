import 'package:trading_module/cores/resources/data_state.dart';
import 'package:trading_module/data/entities/info_withdraw_dto.dart';
import 'package:trading_module/domain/entities/bank.dart';

abstract class WithdrawRepo {
  Future<DataState<List<UserBank>>> listBankUser({
    required String tokenApp,
  });

  Future<DataState<InfoWithdraw>> createCashOut(
      {required String linkId, required String amount});
}
