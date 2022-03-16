import 'package:trading_module/configs/constants.dart';
import 'package:trading_module/cores/api_services.dart';
import 'package:trading_module/cores/networking/decoder.dart';
import 'package:trading_module/data/entities/cash_in_model_dto.dart';
import 'package:trading_module/data/entities/otp_generate_model_dto.dart';

abstract class CashInService extends ApiServices {
  CashInService() : super();

  Future<BaseDecoder<CashInModelDTO>> createCashIn(
      String amount);
}

class CashInServiceImpl extends CashInService {
  CashInServiceImpl() : super();

  @override
  Future<BaseDecoder<CashInModelDTO>> createCashIn(
      String amount) async {
    return BaseDecoder(
        await api.postData(
            endPoint: "/account/v1/cashin",
            params: {
              "amount": amount,
            },
            timeOut: AppConstants.TIME_OUT),
        decoder: CashInModelDTO.fromJson);
  }
}
