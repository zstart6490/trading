import 'package:trading_module/configs/constants.dart';
import 'package:trading_module/cores/api_services.dart';
import 'package:trading_module/cores/networking/decoder.dart';
import 'package:trading_module/data/entities/bank_dto.dart';
import 'package:trading_module/data/entities/info_withdraw_dto.dart';
import 'package:trading_module/data/entities/reason.dart';
import 'package:trading_module/data/entities/transaction_detail_dto.dart';


abstract class WithdrawService extends ApiServices {
  WithdrawService() : super();

  Future<BaseDecoder<List<UserBankDto>>> listBankUser(String tokenApp);
  Future<BaseDecoder<InfoWithdrawDto>> createCashOut(String linkId,String amount,String transactionId);
  Future<BaseDecoder<InfoWithdrawDto>> initCashOut(String contentReason);
  Future<BaseDecoder<TransactionDetailDto>> confirmCashOut(String otp,String otpMethod,String tokenParent,String transactionId);
  Future<BaseDecoder<List<ReasonDto>>> reasonCashOut();
}

class WithdrawServiceImpl extends WithdrawService {
  WithdrawServiceImpl() : super();

  @override
  Future<BaseDecoder<List<UserBankDto>>> listBankUser(String tokenApp) async {
    return  BaseDecoder(await api.postData(
        endPoint: "/account/v1/bank/list",
        params: {
          'token':tokenApp
        },
        timeOut: AppConstants.TIME_OUT),
    decoder: UserBankDto.getList);
  }

  @override
  Future<BaseDecoder<InfoWithdrawDto>> createCashOut(String linkId, String amount, String transactionId) async{
    return  BaseDecoder(await api.postData(
        endPoint: "/account/v1/cashout/create",
        params: {
          'amount': amount,
          'linkId': linkId,
          'transactionId': transactionId,
          'requestId': transactionId,
        },
        timeOut: AppConstants.TIME_OUT),
    decoder: InfoWithdrawDto.fromJson);
  }

  @override
  Future<BaseDecoder<TransactionDetailDto>> confirmCashOut(String otp, String otpMethod, String tokenParent, String transactionId) async{
    return  BaseDecoder(await api.postData(
        endPoint: "/account/v1/cashout/confirm",
        params: {
          'otp': otp,
          'otpMethod': otpMethod,
          'token': tokenParent,
          'transactionId': transactionId,
        },
        timeOut: AppConstants.TIME_OUT),
    decoder: TransactionDetailDto.fromJson);
  }

  @override
  Future<BaseDecoder<InfoWithdrawDto>> initCashOut(String contentReason) async{
    return  BaseDecoder(await api.postData(
        endPoint: "/account/v1/cashout/create",
        params: {
          'content': contentReason,
        },
        timeOut: AppConstants.TIME_OUT),
    decoder: InfoWithdrawDto.fromJson);
  }

  @override
  Future<BaseDecoder<List<ReasonDto>>> reasonCashOut() async{
    return  BaseDecoder(await api.getData(
        endPoint: "/account/v1/cashout/reason",
        timeOut: AppConstants.TIME_OUT),
    decoder: ReasonDto.getList);
  }
}
