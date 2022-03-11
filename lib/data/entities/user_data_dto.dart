import 'package:json_annotation/json_annotation.dart';
import 'package:trading_module/domain/entities/user_data.dart';

part 'user_data_dto.g.dart';

@JsonSerializable()
class UserDataDto {
  final num id;
  final String appId;
  final num? appUserId;
  final String? phone;
  final String? phoneCountryCode;
  final String? email;
  final String? status;


  UserDataDto(
      this.id,
      this.appId,
      this.appUserId,
      this.phone,
      this.phoneCountryCode,
      this.email,
      this.status,
  );

  factory UserDataDto.fromJson(Map<String, dynamic> json) =>
      _$UserDataDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataDtoToJson(this);
}

extension UserDataMapper on UserDataDto {
  UserData toModel() {
    return UserData(
      id: id,
      status: status??"",
      email: email??"",
      appId: appId,
      appUserId: appUserId??0,
      phoneCountryCode: phoneCountryCode??"",
      phone: phone??"",
    );
  }
}
