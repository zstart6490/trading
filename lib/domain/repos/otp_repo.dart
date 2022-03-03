import 'package:trading_project/domain/entities/OtpModel.dart';
import 'package:trading_project/domain/entities/otp_generate_model.dart';

import '../../cores/resources/data_state.dart';


abstract class OtpRepo {
  Future<DataState<OtpModel>> enableSmartOTP({
    required String? smsOTP
  });

  Future<DataState<OtpGenerateModel>> generateOTP({
    required String pin
  });

  Future<DataState<OtpGenerateModel>> checkPin({
    required String pin
  });
}