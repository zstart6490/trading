class UserData {
  final num id;
  final String appId;
  final num appUserId;
  final String phone;
  final String phoneCountryCode;
  final String email;
  final num isLocked;
  final num isKyc;
  final num isDeleted;
  final String status;
  final dynamic lockedReason;
  final dynamic deletedDate;
  final num pinLockCount;
  final dynamic pinLockDate;
  final num otpLockCount;
  final dynamic otpLockDate;

  UserData(
      {required this.id,
      required this.appId,
      required this.appUserId,
      required this.phone,
      required this.phoneCountryCode,
      required this.email,
      required this.isLocked,
      required this.isKyc,
      required this.isDeleted,
      required this.status,
      this.lockedReason,
      this.deletedDate,
      required this.pinLockCount,
      this.pinLockDate,
      required this.otpLockCount,
      this.otpLockDate});
}

class AccessToken {
  final String token;
  // final String type;

  // String get fullToken => "$type $token";

  // AccessToken({required this.token, required this.type});
  AccessToken({required this.token});
}
