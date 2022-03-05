import 'package:trading_module/domain/entities/OtpModel.dart';
import 'package:trading_module/domain/entities/otp_confirm_model.dart';
import 'package:trading_module/domain/entities/otp_generate_model.dart';
import 'package:trading_module/domain/entities/pin_confirm_model.dart';

import '../../cores/resources/data_state.dart';


abstract class OtpRepo {
  Future<DataState<OtpModel>> enableSmartOTP({
    required String? smsOTP
  });

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

  // Future<DataState<OtpGenerateModel>> registerTrading({
  //   required String email,
  //   required String kyc,
  //   required String phone,
  //   required String phoneCountryCode,
  //   required String token,
  // });
}