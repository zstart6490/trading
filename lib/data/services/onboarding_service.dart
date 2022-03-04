import 'package:trading_module/configs/constants.dart';
import 'package:trading_module/cores/api_services.dart';
import 'package:trading_module/cores/networking/http_response.dart';
import 'package:trading_module/data/entities/data_login.dart';

abstract class OnBoardingService extends ApiServices{
  OnBoardingService() : super();

  Future<HttpResponseCustom<DataLoginDTO>> getDataLoginUser(String token,String kyc);

  Future<HttpResponseCustom<DataLoginDTO>> registerTrading(String email,
      String kyc, String phone, String phoneCountryCode, String token);
}

class OnBoardingServiceImpl extends OnBoardingService{
  
  @override
  Future<HttpResponseCustom<DataLoginDTO>> getDataLoginUser(String token,String kyc) async{
    final response = await api.postData(endPoint: "/v1/on-boarding/login",params: {
      "token":token,
      "kyc":kyc,
    }, timeOut: AppConstants.TIME_OUT);
    final data = DataLoginDTO.fromJson(response.data as Map<String, dynamic>);
    return HttpResponseCustom<DataLoginDTO>(data, response);
  }

  @override
  Future<HttpResponseCustom<DataLoginDTO>> registerTrading(String email, String kyc, String phone, String phoneCountryCode, String token) async{
    final response = await api.postData(
        endPoint: "/v1/on-boarding/register",
        params: {
          "email": email,
          "kyc": kyc,
          "phone": phone,
          "phoneCountryCode": phoneCountryCode,
          "token": token
        },
        timeOut: AppConstants.TIME_OUT);
    final data =
    DataLoginDTO.fromJson(response.data as Map<String, dynamic>);
    return HttpResponseCustom(data, response);
  }
  
}