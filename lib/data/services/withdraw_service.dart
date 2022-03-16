import 'package:trading_module/configs/constants.dart';
import 'package:trading_module/cores/api_services.dart';
import 'package:trading_module/cores/networking/decoder.dart';
import 'package:trading_module/data/entities/bank_dto.dart';
import 'package:trading_module/data/entities/info_withdraw_dto.dart';

abstract class WithdrawService extends ApiServices {
  WithdrawService() : super();

  Future<BaseDecoder<List<UserBankDto>>> listBankUser(String tokenApp);
  Future<BaseDecoder<InfoWithdraw>> createCashOut(String linkId,String amount);
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
  Future<BaseDecoder<InfoWithdraw>> createCashOut(String linkId, String amount) async{
    return  BaseDecoder(await api.postData(
        endPoint: "/account/v1/cashout/create",
        params: {
          'amount': amount,
          'linkId': linkId,
          'requestClientId':"1323123213"
        },
        timeOut: AppConstants.TIME_OUT),
    decoder: InfoWithdraw.fromJson);
  }
}
