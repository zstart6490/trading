import 'package:trading_module/cores/resources/data_state.dart';
import 'package:trading_module/data/entities/bank_dto.dart';
import 'package:trading_module/data/entities/info_withdraw_dto.dart';
import 'package:trading_module/data/entities/reason.dart';
import 'package:trading_module/data/entities/transaction_detail_dto.dart';
import 'package:trading_module/data/services/withdraw_service.dart';
import 'package:trading_module/domain/entities/bank.dart';
import 'package:trading_module/domain/entities/info_withdraw.dart';
import 'package:trading_module/domain/entities/reason.dart';
import 'package:trading_module/domain/entities/transaction_detail.dart';
import 'package:trading_module/domain/repos/withdraw_repo.dart';

class WithdrawRepoImpl extends WithdrawRepo{

  final WithdrawService _services;

  WithdrawRepoImpl(this._services);

  @override
  Future<DataState<InfoWithdraw>> initCashOut({required String content}) async{
    final result = await _services.initCashOut(content);
    if (result.success) {
      final model = result.modelDTO;
      return DataSuccess(model.toModel());
    }
    return DataFailed(result.error);
  }

  @override
  Future<DataState<InfoWithdraw>> createCashOut({required String linkId, required String amount, required String transactionId}) async {
    final result = await _services.createCashOut(linkId,amount,transactionId);
    if (result.success) {
      final model = result.modelDTO;
      return DataSuccess(model.toModel());
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

  @override
  Future<DataState<TransactionDetail>> confirmCashOut({required String otp,required String otpMethod,required String tokenParent,required String transactionId}) async{
    final result = await _services.confirmCashOut(otp,otpMethod,tokenParent,transactionId);
    if (result.success) {
      final model = result.modelDTO;
      return DataSuccess(model.toModel());
    }
    return DataFailed(result.error);
  }

  @override
  Future<DataState<List<Reason>>> listReasonCashOut() async{
    final result = await _services.reasonCashOut();
    if (result.success) {
      final model = result.modelDTO;
      final List<Reason> list =[];
      for (final value in model) {
        list.add(value.toModel());
      }
      return DataSuccess<List<Reason>>(list);
    }
    return DataFailed(result.error);
  }



}