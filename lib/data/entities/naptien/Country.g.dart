// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Country.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Country _$CountryFromJson(Map<String, dynamic> json) => Country(
      json['id'] as String,
      json['code'] as String,
      json['name'] as String,
      json['dial_code'] as String,
    );

Map<String, dynamic> _$CountryToJson(Country instance) => <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'dial_code': instance.dialCode,
    };

CountryData _$CountryDataFromJson(Map<String, dynamic> json) => CountryData(
      currentCode: json['current_country_code'] as String?,
      currentCountry: json['current_country'] == null
          ? null
          : Country.fromJson(json['current_country'] as Map<String, dynamic>),
      countries: (json['countries'] as List<dynamic>?)
          ?.map((e) => Country.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CountryDataToJson(CountryData instance) =>
    <String, dynamic>{
      'current_country_code': instance.currentCode,
      'current_country': instance.currentCountry,
      'countries': instance.countries,
    };
