import 'package:trading_module/configs/constants.dart';
import 'package:trading_module/cores/api_services.dart';
import 'package:trading_module/cores/networking/decoder.dart';
import 'package:trading_module/data/entities/data_login.dart';

abstract class OnBoardingService extends ApiServices {
  OnBoardingService() : super();

  Future<BaseDecoder<DataLoginDTO>> getDataLoginUser(String token, String kyc);

  Future<BaseDecoder<DataLoginDTO>> registerTrading(String email, String kyc,
      String phone, String phoneCountryCode, String token);
}

class OnBoardingServiceImpl extends OnBoardingService {
  @override
  Future<BaseDecoder<DataLoginDTO>> getDataLoginUser(
      String token, String kyc) async {
    return BaseDecoder(
        await api.postData(
            endPoint: "/v1/on-boarding/login",
            params: {
              "token": token,
              "kyc": kyc,
            },
            timeOut: AppConstants.TIME_OUT),
        decoder: DataLoginDTO.fromJson);
  }

  @override
  Future<BaseDecoder<DataLoginDTO>> registerTrading(String email, String kyc,
      String phone, String phoneCountryCode, String token) async {
    return BaseDecoder(
        await api.postData(
            endPoint: "/v1/on-boarding/register",
            params: {
              "email": email,
              "kyc": kyc,
              "phone": phone,
              "phoneCountryCode": phoneCountryCode,
              "token": token
            },
            timeOut: AppConstants.TIME_OUT),
        decoder: DataLoginDTO.fromJson);
  }
}
