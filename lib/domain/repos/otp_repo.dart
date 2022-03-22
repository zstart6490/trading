
import 'package:trading_module/domain/entities/otp_confirm_model.dart';
import 'package:trading_module/domain/entities/otp_generate_model.dart';
import 'package:trading_module/domain/entities/pin_confirm_model.dart';
import 'package:trading_module/domain/entities/smart_otp_state_model.dart';

import '../../cores/resources/data_state.dart';


abstract class OtpRepo {

  Future<DataState<OtpGenerateModel>> generateOTP({
    required String pin,
    required String token,
    required String otpMethod,
  });

  Future<DataState<PinConfirmModel>> checkPin({
    required String pin,
    required String token,
  });

  Future<DataState<OtpConfirmModel>> confirmOTP({
    required String otp,
    required String otpMethod,
    required String token,
  });

  Future<DataState<SmartOtpStateModel>> smartOTPIsBlock({
    required String token,
  });

}