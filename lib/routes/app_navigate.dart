import 'package:get/get.dart';
import 'package:trading_module/data/entities/navigate_stock_trans_detail.dart';
import 'package:trading_module/domain/entities/stock_model.dart';
import 'package:trading_module/routes/app_routes.dart';

void navToSelectStock() {
  Get.toNamed(AppRoutes.selectStock);
}

void navToProductOwner() {
  Get.toNamed(AppRoutes.productOwner);
}

void navToBuyStock(StockModel stock){
  Get.toNamed(AppRoutes.buyStock,arguments: stock);
}

void navToSellStock(StockModel stock){
  Get.toNamed(AppRoutes.sellStock,arguments:stock);
}

void navToHistoryStock(){
  Get.toNamed(AppRoutes.historyStock);
}

void navToStockTransactionDetail(NavigateStockTranDetail navigateStockTranDetail){
  Get.toNamed(AppRoutes.stTransactionDetail,
      arguments: navigateStockTranDetail);
}