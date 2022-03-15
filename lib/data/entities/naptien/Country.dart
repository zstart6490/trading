import 'package:json_annotation/json_annotation.dart';

part 'Country.g.dart';

@JsonSerializable()
class Country {
  final String id;
  final String code;
  final String name;
  @JsonKey(name: "dial_code")
  final String dialCode;

  Country(this.id, this.code, this.name, this.dialCode);

  factory Country.vnInit() {
    return Country("1", "VN", "Việt Nam", "+84");
  }
  factory Country.fromJson(Map<String, dynamic> json) =>
      _$CountryFromJson(json);

  bool get isVn => code == "VN";
  Map<String, dynamic> toJson() => _$CountryToJson(this);
}

@JsonSerializable()
class CountryData {
  @JsonKey(name: "current_country_code")
  final String? currentCode;
  @JsonKey(name: "current_country")
  final Country? currentCountry;
  @JsonKey(name: "countries")
  final List<Country>? countries;
  CountryData({this.currentCode, this.currentCountry, this.countries});

  factory CountryData.init() {
    return CountryData(
        currentCode: "", currentCountry: Country.vnInit(), countries: []);
  }
  static CountryData fromResult(dynamic data) =>
      CountryData.fromJson(data as Map<String, dynamic>);

  factory CountryData.fromJson(Map<String, dynamic> json) =>
      _$CountryDataFromJson(json);
  Map<String, dynamic> toJson() => _$CountryDataToJson(this);
}
