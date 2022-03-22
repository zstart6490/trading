import 'package:trading_module/cores/resources/data_state.dart';
import 'package:trading_module/domain/entities/bank.dart';
import 'package:trading_module/domain/entities/info_withdraw.dart';
import 'package:trading_module/domain/entities/reason.dart';
import 'package:trading_module/domain/entities/transaction_detail.dart';
import 'package:trading_module/domain/repos/withdraw_repo.dart';

class WithdrawUseCase {
  final WithdrawRepo _withdrawRepo;

  WithdrawUseCase(this._withdrawRepo);

  Future<DataState<InfoWithdraw>> initCashOut({required String content}) async {
    final result = await _withdrawRepo.initCashOut(content: content);
    return result;
  }

  Future<DataState<List<Reason>>> listReason() async {
    final result = await _withdrawRepo.listReasonCashOut();

    return result;
  }

  Future<DataState<InfoWithdraw>> createCashOut(
      {required String linkId,
      required String amount,
      required String transactionId}) async {
    final result = await _withdrawRepo.createCashOut(
        linkId: linkId, amount: amount, transactionId: transactionId);
    return result;
  }

  Future<DataState<TransactionDetail>> confirmCashOut(
      {required String otp,
      required String otpMethod,
      required String tokenParent,
      required String transactionId}) async {
    final result = await _withdrawRepo.confirmCashOut(
        otp: otp,
        otpMethod: otpMethod,
        tokenParent: tokenParent,
        transactionId: transactionId);
    return result;
  }

  Future<DataState<List<UserBank>>> listBankUser(
      {required String tokenApp}) async {
    final result = await _withdrawRepo.listBankUser(tokenApp: tokenApp);

    return result;
  }
}
