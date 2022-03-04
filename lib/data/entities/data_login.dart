import 'package:json_annotation/json_annotation.dart';
import 'package:trading_module/data/entities/user_data_dto.dart';
import 'package:trading_module/domain/entities/data_login.dart';

part 'data_login.g.dart';

@JsonSerializable()
class DataLoginDTO {
  final String? nextScreen;
  final String? token;
  @JsonKey(name: "user")
  final UserDataDto? userData;
  @JsonKey(name: "configMap")
  final ConfigMapDTO? configMap;
  @JsonKey(name: "msgMap")
  final MsgMapDTO? msgMap;
  @JsonKey(name: "themeMap")
  final ThemeMapDTO? themeMap;

  DataLoginDTO(this.nextScreen, this.token, this.userData, this.configMap,
      this.msgMap, this.themeMap);

  factory DataLoginDTO.fromJson(Map<String, dynamic> json) =>
      _$DataLoginDTOFromJson(json);

  Map<String, dynamic> toJson() => _$DataLoginDTOToJson(this);
}

@JsonSerializable()
class MsgMapDTO {
  @JsonKey(name: "OB_INTRO_MSG")
  final String obIntroMsg;
  @JsonKey(name: "OB_KYC_REQUEST_MSG")
  final String obKycRequestMsg;
  @JsonKey(name: "OB_TERM_MSG")
  final String obTermMsg;
  @JsonKey(name: "OB_TERM_USAGE_MSG")
  final String obTermUsageMsg;
  @JsonKey(name: "OB_TERM_ACCOUNT_MSG")
  final String obTermAccountMsg;
  @JsonKey(name: "OB_TERM_STOCK_MSG")
  final String obTermStockMsg;
  @JsonKey(name: "OB_KYC_INCOMPLETE_MSG")
  final String obKycIncompleteMsg;
  @JsonKey(name: "OB_OTP_REQUEST_MSG")
  final String obOtpRequestMsg;

  factory MsgMapDTO.fromJson(Map<String, dynamic> json) =>
      _$MsgMapDTOFromJson(json);

  Map<String, dynamic> toJson() => _$MsgMapDTOToJson(this);

  MsgMapDTO(
      this.obIntroMsg,
      this.obKycRequestMsg,
      this.obTermMsg,
      this.obTermUsageMsg,
      this.obTermAccountMsg,
      this.obTermStockMsg,
      this.obKycIncompleteMsg,
      this.obOtpRequestMsg);
}

@JsonSerializable()
class ConfigMapDTO {
  @JsonKey(name: "OB_TERM_STOCK_LINK")
  final String obTermStockLink;
  @JsonKey(name: "OB_TERM_ACCOUNT_LINK")
  final String obTermAccountLink;
  @JsonKey(name: "OB_TERM_USAGE_LINK")
  final String obTermUsageLink;

  ConfigMapDTO(
      this.obTermStockLink, this.obTermAccountLink, this.obTermUsageLink);

  factory ConfigMapDTO.fromJson(Map<String, dynamic> json) =>
      _$ConfigMapDTOFromJson(json);

  Map<String, dynamic> toJson() => _$ConfigMapDTOToJson(this);
}

@JsonSerializable()
class ThemeMapDTO {
  ThemeMapDTO();

  factory ThemeMapDTO.fromJson(Map<String, dynamic> json) =>
      _$ThemeMapDTOFromJson(json);

  Map<String, dynamic> toJson() => _$ThemeMapDTOToJson(this);
}

extension ConfigMapMapper on ConfigMapDTO {
  ConfigMap toModel() {
    return ConfigMap(obTermStockLink, obTermAccountLink, obTermUsageLink);
  }
}

extension MsgMapMapper on MsgMapDTO {
  MsgMap toModel() {
    return MsgMap(
        obIntroMsg: obIntroMsg,
        obKycRequestMsg: obKycRequestMsg,
        obTermMsg: obTermMsg,
        obTermUsageMsg: obTermUsageMsg,
        obTermAccountMsg: obTermAccountMsg,
        obTermStockMsg: obTermStockMsg,
        obKycIncompleteMsg: obKycIncompleteMsg,
        obOtpRequestMsg: obOtpRequestMsg);
  }
}

extension UserLoginMapper on DataLoginDTO {
  DataLogin toModel() {
    return DataLogin(
        nextScreen: nextScreen,
        token: token,
        userData: userData?.toModel(),
        configMap: configMap?.toModel(),
        msgMap: msgMap?.toModel());
  }
}
