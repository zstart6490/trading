import 'package:trading_module/data/entities/kyc_status.dart';
import 'package:trading_module/data/entities/otp_status.dart';

class DataInputApp {
  KycStatus? userIsRegisteredKyc;
  OtpStatus? userIsRegisteredOTP;
  String token;
  String? email;
  String? phone;
  String? phoneCountryCode;
  String? fbDeviceId;
  bool? configSmartOTPEnable;

  bool get smartOTPEnable => configSmartOTPEnable ?? true;

  DataInputApp(
      {this.userIsRegisteredKyc,
      this.userIsRegisteredOTP,
      required this.token,
      this.email,
      this.phone,
      this.phoneCountryCode,
      this.fbDeviceId,
      this.configSmartOTPEnable});
}
