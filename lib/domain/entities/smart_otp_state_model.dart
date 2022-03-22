class SmartOtpStateModel {
  final bool isBlock = false;
  final int? lockCount;
  final String? lockDate;

  SmartOtpStateModel({
    required this.lockCount,
    required this.lockDate,
  });
}