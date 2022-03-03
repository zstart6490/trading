import 'package:trading_module/domain/entities/OtpModel.dart';
import 'package:trading_module/domain/entities/otp_generate_model.dart';
import '../../cores/resources/data_state.dart';
import '../repos/otp_repo.dart';

class OtpUseCase {
  final OtpRepo _otpRepo;
  OtpUseCase(this._otpRepo);

  Future<DataState<OtpModel>> enableSmartOTP(String? smsOTP) async {
    final otp = await _otpRepo.enableSmartOTP(smsOTP: smsOTP);
    return otp;
  }

  Future<DataState<OtpGenerateModel>> generateOTP(String pin) async{
    final otp = await _otpRepo.generateOTP(pin: pin);
    return otp;
  }

  Future<DataState<OtpGenerateModel>> checkPin(String pin) async{
    final otp = await _otpRepo.checkPin(pin: pin);
    return otp;
  }
}
