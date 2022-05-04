import 'package:trading_module/cores/resources/data_state.dart';
import 'package:trading_module/domain/entities/company_financial_info.dart';
import 'package:trading_module/domain/entities/company_news_model.dart';
import 'package:trading_module/domain/entities/stock_current_price_model.dart';
import 'package:trading_module/domain/entities/stock_model.dart';
import 'package:trading_module/domain/repos/stock_repo.dart';

class StockUseCase {
  final StockRepo _stockRepo;

  StockUseCase(this._stockRepo);

  Future<DataState<List<StockModel>>> getList() async {
    final otp = await _stockRepo.getList();
    return otp;
  }

  Future<DataState<StockCurrentPriceModel>> getCurrentStockPrice(
      {required String symbol}) async {
    final result = await _stockRepo.getCurrentStockPrice(symbol: symbol);
    return result;
  }

  Future<DataState<List<StockModel>>> getInfoListStock(
      List<String> stocks) async {
    final otp = await _stockRepo.getInfoListStock(stocks: stocks);
    return otp;
  }

  Future<DataState<CompanyNewsData>> getCompanyNewsList(
      String symbol, int page, int limit) async {
    final result = await _stockRepo.getCompanyNewsList(symbol, page, limit);
    return result;
  }

  Future<DataState<List<CompanyFinancialInfo>>> getStockFinanceReport(
      String stock) async {
    final result = await _stockRepo.getStockFinanceReport(stock);
    return result;
  }

  DataState<List<StockModel>> getCache() {
    final result = _stockRepo.getCache();
    return result;
  }
}
