import 'package:trading_module/cores/resources/data_state.dart';
import 'package:trading_module/data/entities/company_financial_info_dto.dart';
import 'package:trading_module/data/entities/company_news_model_dto.dart';
import 'package:trading_module/data/entities/stock_current_price_model_dto.dart';
import 'package:trading_module/data/entities/stock_model_dto.dart';
import 'package:trading_module/data/services/stock_service.dart';
import 'package:trading_module/domain/entities/company_financial_info.dart';
import 'package:trading_module/domain/entities/company_news_model.dart';
import 'package:trading_module/domain/entities/stock_current_price_model.dart';
import 'package:trading_module/domain/entities/stock_model.dart';
import 'package:trading_module/domain/repos/stock_repo.dart';

class StockRepoImpl extends StockRepo {
  final StockService _services;

  StockRepoImpl(this._services);

  @override
  Future<DataState<List<StockModel>>> getList() async {
    final result = await _services.getList();
    if (result.success) {
      final model = result.modelDTO;
      final List<StockModel> list = [];
      for (final value in model) {
        list.add(value.toModel());
      }
      return DataSuccess<List<StockModel>>(list);
    }
    return DataFailed(result.error);
  }

  @override
  Future<DataState<StockCurrentPriceModel>> getCurrentStockPrice(
      {required String symbol}) async {
    final result = await _services.getCurrentStockPrice(symbol);
    if (result.success) {
      final model = result.modelDTO.toModel();
      return DataSuccess(model);
    }
    return DataFailed(result.error);
  }

  @override
  Future<DataState<List<StockModel>>> getInfoListStock(
      {required List<String> stocks}) async {
    final result = await _services.getInfoListStock(stocks);
    if (result.success) {
      final model = result.modelDTO;
      final List<StockModel> list = [];
      for (final value in model) {
        list.add(value.toModel());
      }
      return DataSuccess<List<StockModel>>(list);
    }
    return DataFailed(result.error);
  }

  @override
  Future<DataState<CompanyNewsData>> getCompanyNewsList(
      String symbol, int page, int limit) async {
    final result = await _services.getCompanyNewsList(symbol, page, limit);
    if (result.success) {
      final model = result.modelDTO.toModel();
      return DataSuccess(model);
    }
    return DataFailed(result.error);
  }

  @override
  Future<DataState<List<CompanyFinancialInfo>>> getStockFinanceReport(String stock) async{
    final result = await _services.getStockFinanceReport(stock);
    if (result.success) {
      final model = result.modelDTO;
      final List<CompanyFinancialInfo> list = [];
      for (final value in model) {
        list.add(value.toModel());
      }
      return DataSuccess<List<CompanyFinancialInfo>>(list);
    }
    return DataFailed(result.error);
  }
}
