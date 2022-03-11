class UserData {
  final num id;
  final String appId;
  final num appUserId;
  final String phone;
  final String phoneCountryCode;
  final String email;
  final String status;


  UserData(
      {required this.id,
      required this.appId,
      required this.appUserId,
      required this.phone,
      required this.phoneCountryCode,
      required this.email,
      required this.status,
   });
}

class AccessToken {
  final String token;
  // final String type;

  // String get fullToken => "$type $token";

  // AccessToken({required this.token, required this.type});
  AccessToken({required this.token});
}
