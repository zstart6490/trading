import 'package:trading_module/configs/constants.dart';
import 'package:trading_module/cores/api_services.dart';
import 'package:trading_module/cores/networking/decoder.dart';
import 'package:trading_module/data/entities/account_model_dto.dart';



abstract class HomeTradingService extends ApiServices {
  HomeTradingService() : super();

  Future<BaseDecoder<AccountInfoModelDTO>> getAccountInfo();

}

class HomeTradingServiceImpl extends HomeTradingService {
  HomeTradingServiceImpl() : super();


  @override
  Future<BaseDecoder<AccountInfoModelDTO>> getAccountInfo()  async {
    return BaseDecoder(
        await api.getData(
            endPoint: "/account/v1/info",
            timeOut: AppConstants.TIME_OUT),
        decoder: AccountInfoModelDTO.fromJson);
  }
}
