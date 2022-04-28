import 'package:get/get.dart';
import 'package:trading_module/domain/entities/company_financial_info.dart';
import 'package:trading_module/domain/entities/stock_model.dart';
import 'package:trading_module/domain/use_cases/stock_usecase.dart';

class StockCompanyInfoController extends GetxController
    with StateMixin<List<CompanyFinancialInfo>> {
  final StockModel stock;

  StockCompanyInfoController(this.stock);

  final StockUseCase _stockUseCase = Get.find<StockUseCase>();
  List<CompanyFinancialInfo> listCompanyInfo = <CompanyFinancialInfo>[];

  Future getStockFinanceReport(String symbol) async {
    if (listCompanyInfo.isEmpty) {
      change(listCompanyInfo, status: RxStatus.loading());
      final result = await _stockUseCase.getStockFinanceReport(symbol);
      if (result.data != null) {
        if (result.data!.isEmpty) {
          change(listCompanyInfo, status: RxStatus.empty());
        } else {
          if (result.data!.length <= 1) {
            listCompanyInfo.add(CompanyFinancialInfo(
                symbol: symbol,
                revenue: 0,
                cost: 0,
                taxIncome: 0,
                profit: 0,
                totalAssets: 0,
                operationCost: 0,
                depositCredit: 0,
                depositClient: 0,
                debt: 0,
                debtCredit: 0,
                debtClient: 0,
                capital: 0,
                capitalCredit: 0,
                undistProfit: 0,
                valuation: 0,
                eps: 0,
                pe: 0,
                pb: 0,
                profitability: 0,
                roe: 0,
                roa: 0,
                poic: 0,
                grossProfitMargin: 0,
                netProfitVariable: 0,
                financialStrength: 0,
                debtEquity: 0,
                debtAssets: 0,
                fastPayment: 0));
          }
          listCompanyInfo.addAll(result.data!);
          change(listCompanyInfo, status: RxStatus.success());
        }
      }
      if (result.error != null) {
        change(listCompanyInfo, status: RxStatus.error(result.error?.message));
      }
    }
  }
}
