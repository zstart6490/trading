// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_news_model_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyNewsDataDto _$CompanyNewsDataDtoFromJson(Map<String, dynamic> json) =>
    CompanyNewsDataDto(
      records: (json['records'] as List<dynamic>?)
          ?.map((e) => CompanyNewsModelDto.fromJson(e))
          .toList(),
    );

Map<String, dynamic> _$CompanyNewsDataDtoToJson(CompanyNewsDataDto instance) =>
    <String, dynamic>{
      'records': instance.records,
    };

CompanyNewsModelDto _$CompanyNewsModelDtoFromJson(Map<String, dynamic> json) =>
    CompanyNewsModelDto(
      id: json['id'] as int?,
      symbol: json['symbol'] as String?,
      title: json['title'] as String?,
      url: json['url'] as String?,
      imgUrl: json['imgUrl'] as String?,
      source: json['source'] == null
          ? null
          : NewsSourceModelDto.fromJson(json['source']),
    );

Map<String, dynamic> _$CompanyNewsModelDtoToJson(
        CompanyNewsModelDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'symbol': instance.symbol,
      'title': instance.title,
      'url': instance.url,
      'imgUrl': instance.imgUrl,
      'source': instance.source,
    };

NewsSourceModelDto _$NewsSourceModelDtoFromJson(Map<String, dynamic> json) =>
    NewsSourceModelDto(
      id: json['id'] as int?,
      sourceName: json['sourceName'] as String?,
      url: json['url'] as String?,
      imageUrl: json['imageUrl'] as String?,
    );

Map<String, dynamic> _$NewsSourceModelDtoToJson(NewsSourceModelDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sourceName': instance.sourceName,
      'url': instance.url,
      'imageUrl': instance.imageUrl,
    };
