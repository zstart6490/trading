import 'package:trading_module/cores/resources/data_state.dart';
import 'package:trading_module/data/entities/OTPData.dart';
import 'package:trading_module/data/entities/otp_generate_model_dto.dart';
import 'package:trading_module/data/services/otp_services.dart';
import 'package:trading_module/domain/entities/OtpModel.dart';
import 'package:trading_module/domain/entities/otp_generate_model.dart';
import 'package:trading_module/domain/repos/otp_repo.dart';

class OtpRepoImpl extends OtpRepo {
  final OtpService _services;

  OtpRepoImpl(this._services);

  @override
  Future<DataState<OtpModel>> enableSmartOTP(
      {required String? smsOTP}) async {
    final result = await _services.enableSmartOTP(smsOTP);
    if (result.response.success) {
      var model = result.data.toModel();
      return DataSuccess(model);
    }
    return DataFailed(result.response.error);
  }

  @override
  Future<DataState<OtpGenerateModel>> generateOTP({required String pin, required String token, required String otpMethod}) async {
    final result = await _services.generateOTP(pin, token, otpMethod);
    if (result.response.success) {
      var model = result.data.toModel();
      return DataSuccess(model);
    }
    return DataFailed(result.response.error);
  }


  @override
  Future<DataState<OtpGenerateModel>> checkPin({required String pin, required String token}) async {
    final result = await _services.checkPin(pin, token);
    if (result.response.success) {
      var model = result.data.toModel();
      return DataSuccess(model);
    }
    return DataFailed(result.response.error);
  }

  @override
  Future<DataState<OtpGenerateModel>> confirmOTP({required String otp, required String otpMethod, required String token}) async{
    final result = await _services.confirmOTP(otp, otpMethod, token);
    if (result.response.success) {
      var model = result.data.toModel();
      return DataSuccess(model);
    }
    return DataFailed(result.response.error);
  }

  @override
  Future<DataState<OtpGenerateModel>> registerTrading({required String email, required String kyc, required String phone, required String phoneCountryCode, required String token}) async{
    final result = await _services.registerTrading(email, kyc, phone, phoneCountryCode, token);
    if (result.response.success) {
      var model = result.data.toModel();
      return DataSuccess(model);
    }
    return DataFailed(result.response.error);
  }
}

