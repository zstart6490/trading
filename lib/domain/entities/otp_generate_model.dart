class OtpGenerateModel {
  final String? otpMethod;
  final String? otp;
  final String? warningMsg;
  final String? userLocked;
  final int? lockCount;
  final int? timeOut;

  OtpGenerateModel({
    required this.otpMethod,
    required this.otp,
    required this.warningMsg,
    required this.userLocked,
    required this.lockCount,
    required this.timeOut,
  });
}