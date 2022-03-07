import 'package:trading_module/configs/constants.dart';
import 'package:trading_module/cores/api_services.dart';
import 'package:trading_module/cores/networking/decoder.dart';
import 'package:trading_module/cores/networking/result.dart';
import 'package:trading_module/data/entities/otp_confirm_model_dto.dart';
import 'package:trading_module/data/entities/otp_generate_model_dto.dart';
import 'package:trading_module/data/entities/pin_confirm_model_dto.dart';
import 'package:trading_module/data/entities/smart_otp_model_dto.dart';
import 'package:trading_module/domain/entities/smart_otp_state_model.dart';

abstract class OtpService extends ApiServices {
  OtpService() : super();

  Future<Result> enableSmartOTP(String? smsOTP);

  Future<BaseDecoder<OtpGenerateModelDTO>> generateOTP(String pin, String token, String otpMethod);

  Future<BaseDecoder<PinConfirmModelDTO>>checkPin(String pin, String token);

  Future<BaseDecoder<OtpConfirmModelDTO>> confirmOTP(
      String otp, String method, String token);

  Future<BaseDecoder<SmartOtpStateModelDTO>> smartOTPIsBlock(
      String token);
}

class OtpServiceImpl extends OtpService {
  OtpServiceImpl() : super();

  @override
  Future<Result> enableSmartOTP(String? smsOTP) async {
    return await api.getData(
        endPoint: "/smart-otp/enable",
        params: {
          "otp": smsOTP,
        },
        timeOut: AppConstants.TIME_OUT);
  }

  @override
  Future<BaseDecoder<OtpGenerateModelDTO>> generateOTP(
      String pin, String token, String otpMethod) async {
    return BaseDecoder(await api.postData(
        endPoint: "/v1/on-boarding/get-otp",
        params: {
          "pin": pin,
          "token": token,
          "otpMethod": otpMethod
        },
        timeOut: AppConstants.TIME_OUT),
        decoder: OtpGenerateModelDTO.fromJson);
  }

  @override
  Future<BaseDecoder<PinConfirmModelDTO>> checkPin(
      String pin, String token) async {
    return BaseDecoder(await api.postData(
        endPoint: "/v1/on-boarding/check-pin",
        params: {"pin": pin, "token": token},
        timeOut: AppConstants.TIME_OUT),
        decoder: PinConfirmModelDTO.fromJson);
  }

  @override
  Future<BaseDecoder<OtpConfirmModelDTO>> confirmOTP(
      String otp, String otpMethod, String token) async {
    return BaseDecoder(await api.postData(
        endPoint: "/v1/on-boarding/confirm-register",
        params: {"otp": otp, "otpMethod": otpMethod, "token": token},
        timeOut: AppConstants.TIME_OUT),
    decoder: OtpConfirmModelDTO.fromJson);
  }

  @override
  Future<BaseDecoder<SmartOtpStateModelDTO>> smartOTPIsBlock(String token) async {
    return BaseDecoder(await api.postData(
        endPoint: "/v1/on-boarding/check-pin-block",
        params: {"token": token},
        timeOut: AppConstants.TIME_OUT),
        decoder: SmartOtpStateModelDTO.fromJson);
  }

}
