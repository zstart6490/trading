
import 'package:trading_module/configs/service_api_config.dart';

class CompanyNewsData {
  final List<CompanyNewsModel> records;

  CompanyNewsData({required this.records});


}

class CompanyNewsModel {
  final int id;
  final String symbol;
  final String title;
  final String url;
  final String imgUrl;
  final String createTime;
  final NewsSourceModel source;

  String get fullImgUrl => "${Environment().backendUrl}/resource/v1/news-image/$imgUrl";


  CompanyNewsModel(
      {required this.id,
      required this.symbol,
      required this.title,
      required this.url,
      required this.createTime,
      required this.imgUrl,
      required this.source});
}

class NewsSourceModel {
  final int id;
  final String sourceName;
  final String url;
  final String imageUrl;

  NewsSourceModel(
      {required this.id,
      required this.sourceName,
      required this.url,
      required this.imageUrl});
}
