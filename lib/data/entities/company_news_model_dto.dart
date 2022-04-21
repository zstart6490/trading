import 'package:json_annotation/json_annotation.dart';
import 'package:trading_module/domain/entities/company_news_model.dart';

part 'company_news_model_dto.g.dart';

@JsonSerializable()
class CompanyNewsDataDto {
  final List<CompanyNewsModelDto>? records;

  CompanyNewsDataDto({this.records});

  factory CompanyNewsDataDto.fromJson(dynamic json) =>
      _$CompanyNewsDataDtoFromJson(json as Map<String, dynamic>);

  Map<String, dynamic> toJson() => _$CompanyNewsDataDtoToJson(this);
}

extension CompanyNewsDataMapper on CompanyNewsDataDto {
  CompanyNewsData toModel() {
    final List<CompanyNewsModel> listData = [];
    return CompanyNewsData(
        records: records?.map((e) => e.toModel()).toList() ?? listData);
  }
}

@JsonSerializable()
class CompanyNewsModelDto {
  final int? id;
  final String? symbol;
  final String? title;
  final String? url;
  final String? imgUrl;
  final NewsSourceModelDto? source;

  CompanyNewsModelDto(
      {this.id, this.symbol, this.title, this.url, this.imgUrl, this.source});

  factory CompanyNewsModelDto.fromJson(dynamic json) =>
      _$CompanyNewsModelDtoFromJson(json as Map<String, dynamic>);

  Map<String, dynamic> toJson() => _$CompanyNewsModelDtoToJson(this);
}

extension CompanyNewsModelMapper on CompanyNewsModelDto {
  CompanyNewsModel toModel() {
    return CompanyNewsModel(
        id: id ?? 0,
        symbol: symbol ?? "",
        title: title ?? "",
        url: url ?? "",
        imgUrl: imgUrl ?? "",
        source: source?.toModel() ??
            NewsSourceModel(id: 0, imageUrl: "", sourceName: "", url: ""));
  }
}

extension NewsSourceModelMapper on NewsSourceModelDto {
  NewsSourceModel toModel() {
    return NewsSourceModel(
        id: id ?? 0,
        sourceName: sourceName ?? "",
        url: url ?? "",
        imageUrl: imageUrl ?? "");
  }
}

@JsonSerializable()
class NewsSourceModelDto {
  final int? id;
  final String? sourceName;
  final String? url;
  final String? imageUrl;

  NewsSourceModelDto({this.id, this.sourceName, this.url, this.imageUrl});

  factory NewsSourceModelDto.fromJson(dynamic json) =>
      _$NewsSourceModelDtoFromJson(json as Map<String, dynamic>);
}
