import 'package:trading_module/cores/resources/data_state.dart';
import 'package:trading_module/domain/entities/company_financial_info.dart';
import 'package:trading_module/domain/entities/company_news_model.dart';
import 'package:trading_module/domain/entities/stock_current_price_model.dart';
import 'package:trading_module/domain/entities/stock_model.dart';


abstract class StockRepo {

  Future<DataState<List<StockModel>>> getList();

  DataState<List<StockModel>> getCache();

  Future<DataState<StockCurrentPriceModel>> getCurrentStockPrice({
    required String symbol,
  });

  Future<DataState<List<CompanyFinancialInfo>>> getStockFinanceReport(String stock);

  Future<DataState<List<StockModel>>> getInfoListStock({
    required List<String> stocks,
  });

  Future<DataState<CompanyNewsData>> getCompanyNewsList( String symbol, int page, int limit);
}