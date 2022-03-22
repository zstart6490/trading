import 'package:trading_module/cores/resources/data_state.dart';
import 'package:trading_module/domain/entities/bank.dart';
import 'package:trading_module/domain/entities/info_withdraw.dart';
import 'package:trading_module/domain/entities/reason.dart';
import 'package:trading_module/domain/entities/transaction_detail.dart';

abstract class WithdrawRepo {
  Future<DataState<List<UserBank>>> listBankUser({
    required String tokenApp,
  });

  Future<DataState<List<Reason>>> listReasonCashOut();

  Future<DataState<InfoWithdraw>> initCashOut({required String content});

  Future<DataState<InfoWithdraw>> createCashOut({required String linkId,required String amount,required String transactionId});

  Future<DataState<TransactionDetail>> confirmCashOut(
      {required String otp,required String otpMethod,required String tokenParent,required String transactionId});
}
