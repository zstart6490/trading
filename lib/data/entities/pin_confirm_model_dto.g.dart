// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pin_confirm_model_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PinConfirmModelDTO _$PinConfirmModelDTOFromJson(Map<String, dynamic> json) =>
    PinConfirmModelDTO(
      json['state'] as String?,
      json['lockCount'] as int?,
      json['lockDate'] as String?,
      json['userLocked'] as String?,
      json['warningMsg'] as String?,
    );

Map<String, dynamic> _$PinConfirmModelDTOToJson(PinConfirmModelDTO instance) =>
    <String, dynamic>{
      'state': instance.state,
      'lockCount': instance.lockCount,
      'lockDate': instance.lockDate,
      'userLocked': instance.userLocked,
      'warningMsg': instance.warningMsg,
    };
