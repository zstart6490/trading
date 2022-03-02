
class UserData {
  final num id;
  final String name;
  final String phoneNumber;
  final  String email;
  final  String fullName;
  final  String birthday;
  final String address;
  final num gender;

  UserData(this.id, this.name, this.phoneNumber, this.email, this.fullName,
      this.birthday, this.address, this.gender);
}

class AccessToken {
  final String token;
  final String type;

  String get fullToken => "$type $token";

  AccessToken({required this.token, required this.type});

}