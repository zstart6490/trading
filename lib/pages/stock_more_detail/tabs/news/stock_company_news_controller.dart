import 'package:get/get.dart';
import 'package:trading_module/cores/states/base_controller.dart';
import 'package:trading_module/data/repos/stock_repo_impl.dart';
import 'package:trading_module/data/services/local/stock_storage_service.dart';
import 'package:trading_module/data/services/stock_service.dart';
import 'package:trading_module/domain/entities/company_news_model.dart';
import 'package:trading_module/domain/entities/stock_model.dart';
import 'package:trading_module/domain/use_cases/stock_usecase.dart';

class StockCompanyNewsController extends BaseController
    with StateMixin<List<CompanyNewsModel>> {
  List<CompanyNewsModel> listNews = <CompanyNewsModel>[];

  final StockUseCase _stockUseCase = StockUseCase(StockRepoImpl(StockServiceImpl(),StockStorageServiceImpl()));

  final StockModel stock;

  StockCompanyNewsController(this.stock);

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  Future getCompanyNewsList(String symbol, int page, int limit) async {
    if (listNews.isEmpty) {
      change(listNews, status: RxStatus.loading());
      final result =
          await _stockUseCase.getCompanyNewsList(symbol, page, limit);
      if (result.data != null) {
        if (result.data!.records.isEmpty) {
          change(listNews, status: RxStatus.empty());
        } else {
          listNews.addAll(result.data!.records);
          //print(listNews[0].fullImgUrl);
          change(listNews, status: RxStatus.success());
        }
      }
      if (result.error != null) {
        change(listNews, status: RxStatus.error(result.error!.message));
      }
    }
  }
}
