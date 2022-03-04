import 'package:json_annotation/json_annotation.dart';
import 'package:trading_module/domain/entities/user_data.dart';

part 'user_data_dto.g.dart';

@JsonSerializable()
class UserDataDto {
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

  UserDataDto(
      this.id,
      this.appId,
      this.appUserId,
      this.phone,
      this.phoneCountryCode,
      this.email,
      this.isLocked,
      this.isKyc,
      this.isDeleted,
      this.status,
      this.lockedReason,
      this.deletedDate,
      this.pinLockCount,
      this.pinLockDate,
      this.otpLockCount,
      this.otpLockDate);

  factory UserDataDto.fromJson(Map<String, dynamic> json) =>
      _$UserDataDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataDtoToJson(this);
}

extension UserDataMapper on UserDataDto {
  UserData toModel() {
    return UserData(
      id: id,
      status: status,
      email: email,
      appId: appId,
      appUserId: appUserId,
      isDeleted: isDeleted,
      isKyc: isKyc,
      isLocked: isLocked,
      phoneCountryCode: phoneCountryCode,
      pinLockCount: pinLockCount,
      phone: phone,
      otpLockCount: otpLockCount,
    );
  }
}
