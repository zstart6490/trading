// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Notifications.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationData _$NotificationDataFromJson(Map<String, dynamic> json) =>
    NotificationData(
      (json['notifications'] as List<dynamic>)
          .map((e) => NotificationInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalNotRead: json['total_not_read'] as int? ?? 0,
      metaData: json['meta_data'] == null
          ? null
          : MetaData.fromJson(json['meta_data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NotificationDataToJson(NotificationData instance) =>
    <String, dynamic>{
      'notifications': instance.notifications,
      'total_not_read': instance.totalNotRead,
      'meta_data': instance.metaData,
    };

NotificationInfo _$NotificationInfoFromJson(Map<String, dynamic> json) =>
    NotificationInfo(
      idDynamic: json['id'],
      type: json['type'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      isReadDynamic: json['is_read'],
      createAt: json['created_at'] as String?,
      updateAt: json['updated_at'] as String?,
      data: json['data'] == null
          ? null
          : DataID.fromJson(json['data'] as Map<String, dynamic>),
      contentDynamic: json['content'],
    );

Map<String, dynamic> _$NotificationInfoToJson(NotificationInfo instance) =>
    <String, dynamic>{
      'id': instance.idDynamic,
      'type': instance.type,
      'title': instance.title,
      'description': instance.description,
      'is_read': instance.isReadDynamic,
      'created_at': instance.createAt,
      'updated_at': instance.updateAt,
      'data': instance.data,
      'content': instance.contentDynamic,
    };

MetaData _$MetaDataFromJson(Map<String, dynamic> json) => MetaData(
      json['current_page'] as int,
      json['last_page'] as int,
      json['per_page'] as String,
      json['total'] as int,
    );

Map<String, dynamic> _$MetaDataToJson(MetaData instance) => <String, dynamic>{
      'current_page': instance.currentPage,
      'last_page': instance.lastPage,
      'per_page': instance.perPage,
      'total': instance.total,
    };

DataID _$DataIDFromJson(Map<String, dynamic> json) => DataID(
      json['id'],
    );

Map<String, dynamic> _$DataIDToJson(DataID instance) => <String, dynamic>{
      'id': instance.idDynamic,
    };
