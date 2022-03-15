// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_login.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataLoginDTO _$DataLoginDTOFromJson(Map<String, dynamic> json) => DataLoginDTO(
      json['nextScreen'] as String?,
      json['token'] as String?,
      json['user'] == null
          ? null
          : UserDataDto.fromJson(json['user'] as Map<String, dynamic>),
      json['configMap'] == null
          ? null
          : ConfigMapDTO.fromJson(json['configMap'] as Map<String, dynamic>),
      json['msgMap'] == null
          ? null
          : MsgMapDTO.fromJson(json['msgMap'] as Map<String, dynamic>),
      json['themeMap'] == null
          ? null
          : ThemeMapDTO.fromJson(json['themeMap'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataLoginDTOToJson(DataLoginDTO instance) =>
    <String, dynamic>{
      'nextScreen': instance.nextScreen,
      'token': instance.token,
      'user': instance.userData,
      'configMap': instance.configMap,
      'msgMap': instance.msgMap,
      'themeMap': instance.themeMap,
    };

MsgMapDTO _$MsgMapDTOFromJson(Map<String, dynamic> json) => MsgMapDTO(
      json['OB_INTRO_MSG'] as String?,
      json['OB_KYC_REQUEST_MSG'] as String?,
      json['OB_TERM_MSG'] as String?,
      json['OB_TERM_USAGE_MSG'] as String?,
      json['OB_TERM_ACCOUNT_MSG'] as String?,
      json['OB_TERM_STOCK_MSG'] as String?,
      json['OB_KYC_INCOMPLETE_MSG'] as String?,
      json['OB_OTP_REQUEST_MSG'] as String?,
    );

Map<String, dynamic> _$MsgMapDTOToJson(MsgMapDTO instance) => <String, dynamic>{
      'OB_INTRO_MSG': instance.obIntroMsg,
      'OB_KYC_REQUEST_MSG': instance.obKycRequestMsg,
      'OB_TERM_MSG': instance.obTermMsg,
      'OB_TERM_USAGE_MSG': instance.obTermUsageMsg,
      'OB_TERM_ACCOUNT_MSG': instance.obTermAccountMsg,
      'OB_TERM_STOCK_MSG': instance.obTermStockMsg,
      'OB_KYC_INCOMPLETE_MSG': instance.obKycIncompleteMsg,
      'OB_OTP_REQUEST_MSG': instance.obOtpRequestMsg,
    };

ConfigMapDTO _$ConfigMapDTOFromJson(Map<String, dynamic> json) => ConfigMapDTO(
      json['OB_TERM_STOCK_LINK'] as String?,
      json['OB_TERM_ACCOUNT_LINK'] as String?,
      json['OB_TERM_USAGE_LINK'] as String?,
      json['MIN_MONEY_USER'] as String?,
      json['VAT_PERCENT'] as String?,
      json['MAX_MONEY_USER'] as String?,
    );

Map<String, dynamic> _$ConfigMapDTOToJson(ConfigMapDTO instance) =>
    <String, dynamic>{
      'OB_TERM_STOCK_LINK': instance.obTermStockLink,
      'OB_TERM_ACCOUNT_LINK': instance.obTermAccountLink,
      'OB_TERM_USAGE_LINK': instance.obTermUsageLink,
      'MIN_MONEY_USER': instance.minMoneyUser,
      'VAT_PERCENT': instance.vatPercent,
      'MAX_MONEY_USER': instance.maxMoneyUser,
    };

ThemeMapDTO _$ThemeMapDTOFromJson(Map<String, dynamic> json) => ThemeMapDTO();

Map<String, dynamic> _$ThemeMapDTOToJson(ThemeMapDTO instance) =>
    <String, dynamic>{};
