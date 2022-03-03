import 'package:trading_module/configs/constants.dart';
import 'package:trading_module/cores/api_services.dart';
import 'package:trading_module/cores/networking/http_response.dart';
import 'package:trading_module/data/entities/OTPData.dart';
import 'package:trading_module/data/entities/otp_generate_model_dto.dart';

abstract class OtpService extends ApiServices {
  OtpService() : super();

  Future<HttpResponseCustom<OtpData>> enableSmartOTP(String? smsOTP);

  Future<HttpResponseCustom<OtpGenerateModelDTO>> generateOTP(String pin, String token, String otpMethod);

  Future<HttpResponseCustom<OtpGenerateModelDTO>> checkPin(String pin, String token);

  Future<HttpResponseCustom<OtpGenerateModelDTO>> confirmOTP(
      String otp, String method, String token);

  Future<HttpResponseCustom<OtpGenerateModelDTO>> registerTrading(String email,
      String kyc, String phone, String phoneCountryCode, String token);
}

class OtpServiceImpl extends OtpService {
  OtpServiceImpl() : super();

  @override
  Future<HttpResponseCustom<OtpData>> enableSmartOTP(String? smsOTP) async {
    final response = await api.getData(
        endPoint: "/smart-otp/enable",
        params: {
          "otp": smsOTP,
        },
        timeOut: AppConstants.TIME_OUT);
    final data = OtpData.fromJson(response.data as Map<String, dynamic>);
    return HttpResponseCustom(data, response);
  }

  @override
  Future<HttpResponseCustom<OtpGenerateModelDTO>> generateOTP(
      String pin, String token, String otpMethod) async {
    final response = await api.postData(
        endPoint: "/v1/on-boarding/get-otp",
        params: {
          "pin": pin,
          "token": token,
          "otpMethod": otpMethod
        },
        timeOut: AppConstants.TIME_OUT);
    final data =
        OtpGenerateModelDTO.fromJson(response.data as Map<String, dynamic>);
    return HttpResponseCustom(data, response);
  }

  @override
  Future<HttpResponseCustom<OtpGenerateModelDTO>> checkPin(
      String pin, String token) async {
    final response = await api.postData(
        endPoint: "/v1/on-boarding/check-pin",
        params: {"pin": pin, "token": token},
        timeOut: AppConstants.TIME_OUT);
    final data =
        OtpGenerateModelDTO.fromJson(response.data as Map<String, dynamic>);
    return HttpResponseCustom(data, response);
  }

  @override
  Future<HttpResponseCustom<OtpGenerateModelDTO>> confirmOTP(
      String otp, String otpMethod, String token) async {
    final response = await api.postData(
        endPoint: "/v1/on-boarding/confirm-register",
        params: {"otp": otp, "otpMethod": otpMethod, "token": token},
        timeOut: AppConstants.TIME_OUT);
    final data =
        OtpGenerateModelDTO.fromJson(response.data as Map<String, dynamic>);
    return HttpResponseCustom(data, response);
  }

  @override
  Future<HttpResponseCustom<OtpGenerateModelDTO>> registerTrading(String email,
      String kyc, String phone, String phoneCountryCode, String token) async {
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
        OtpGenerateModelDTO.fromJson(response.data as Map<String, dynamic>);
    return HttpResponseCustom(data, response);
  }
}
