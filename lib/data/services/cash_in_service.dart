import 'package:trading_module/configs/constants.dart';
import 'package:trading_module/cores/api_services.dart';
import 'package:trading_module/cores/networking/decoder.dart';
import 'package:trading_module/data/entities/cash_in_confirm_model_dto.dart';
import 'package:trading_module/data/entities/cash_in_create_model_dto.dart';

abstract class CashInService extends ApiServices {
  CashInService() : super();

  Future<BaseDecoder<CashInCreateModelDTO>> createCashIn(
      String amount);

  Future<BaseDecoder<CashInConfirmModelDTO>> confirmCashIn(
      String amount, String transactionId);
}

class CashInServiceImpl extends CashInService {
  CashInServiceImpl() : super();

  @override
  Future<BaseDecoder<CashInCreateModelDTO>> createCashIn(
      String amount) async {
    return BaseDecoder(
        await api.postData(
            endPoint: "/account/v1/cashin/create",
            params: {
              "amount": amount,
            },
            timeOut: AppConstants.TIME_OUT),
        decoder: CashInCreateModelDTO.fromJson);
  }

  @override
  Future<BaseDecoder<CashInConfirmModelDTO>> confirmCashIn(
      String amount, String transactionId) async {
    return BaseDecoder(
        await api.postData(
            endPoint: "/account/v1/cashin/confirm",
            params: {
              "amount": amount,
              "transactionId": transactionId
            },
            timeOut: AppConstants.TIME_OUT),
        decoder: CashInConfirmModelDTO.fromJson);
  }
}
