import 'package:json_annotation/json_annotation.dart';
import 'package:trading_module/domain/entities/model.dart';
import 'package:trading_module/domain/entities/user_data.dart';

part 'user_data.g.dart';

@JsonSerializable()
class UserDataDTO {
  final num id;
  final String? createTime;
  final String? modifyTime;
  final num? part;
  final String? name;
  final String phoneNumber;
  final String? password;
  final String? email;
  final String? fullName;
  final String? birthday;
  final String? address;
  final num? gender;

  UserDataDTO(this.id, this.createTime, this.modifyTime, this.part, this.name,
      this.phoneNumber, this.password, this.email, this.fullName, this.birthday,
      this.address, this.gender);

  factory UserDataDTO.fromJson(Map<String, dynamic> json) =>
      _$UserDataDTOFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataDTOToJson(this);
}

extension UseDataMapper on UserDataDTO{
  UserData toModel() {
    return UserData(id, name??"", phoneNumber, email??"", fullName??"", birthday??"", address??"", gender??0);
  }
}

