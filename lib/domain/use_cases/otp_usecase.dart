import 'package:trading_module/cores/resources/data_state.dart';
import 'package:trading_module/domain/entities/otp_generate_model.dart';
import 'package:trading_module/domain/entities/pin_confirm_model.dart';
import 'package:trading_module/domain/entities/smart_otp_state_model.dart';
import 'package:trading_module/domain/repos/otp_repo.dart';

import '../entities/otp_confirm_model.dart';


class OtpUseCase {
  final OtpRepo _otpRepo;

  OtpUseCase(this._otpRepo);


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

  Future<DataState<SmartOtpStateModel>> smartOTPIsBlock(String token) async {
    final result = await _otpRepo.smartOTPIsBlock(token: token);
    return result;
  }
}
