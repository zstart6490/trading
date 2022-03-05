import 'package:trading_module/cores/resources/data_state.dart';
import 'package:trading_module/domain/entities/OtpModel.dart';
import 'package:trading_module/domain/entities/otp_generate_model.dart';
import 'package:trading_module/domain/entities/pin_confirm_model.dart';
import 'package:trading_module/domain/repos/otp_repo.dart';

import '../entities/otp_confirm_model.dart';


class OtpUseCase {
  final OtpRepo _otpRepo;

  OtpUseCase(this._otpRepo);

  Future<DataState<OtpModel>> enableSmartOTP(String? smsOTP) async {
    final otp = await _otpRepo.enableSmartOTP(smsOTP: smsOTP);
    return otp;
  }

  Future<DataState<OtpGenerateModel>> generateOTP(String pin, String token, String otpMethod) async {
    final otp = await _otpRepo.generateOTP(pin: pin, token: token, otpMethod: otpMethod);
    return otp;
  }

  Future<DataState<PinConfirmModel>> checkPin(String pin, String token) async {
    final otp = await _otpRepo.checkPin(pin: pin, token: token);
    return otp;
  }

  Future<DataState<OtpConfirmModel>> confirmOTP(
      String otp, String otpMethod, String token) async {
    final result =
        await _otpRepo.confirmOTP(otp: otp, otpMethod: otpMethod, token: token);
    return result;
  }

  // Future<DataState<OtpGenerateModel>> registerTrading(String email, String kyc,
  //     String phone, String phoneCountryCode, String token) async {
  //   final otp = await _otpRepo.registerTrading(
  //       email: email,
  //       kyc: kyc,
  //       phone: phone,
  //       phoneCountryCode: phoneCountryCode,
  //       token: token);
  //   return otp;
  // }
}
