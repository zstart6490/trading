import 'package:get/get.dart';
import 'package:trading_module/domain/entities/stock_model.dart';
import 'package:trading_module/routes/app_routes.dart';
import 'package:trading_module/utils/enums.dart';

void navToSelectStock(StockType stockType) {
  Get.toNamed(AppRoutes.selectStock, arguments: stockType);
}

void navToBuyStock(StockModel stock){
  Get.toNamed(AppRoutes.buyStock,arguments: stock);
}

void navToSellStock(StockModel stock){
  Get.toNamed(AppRoutes.sellStock,arguments:stock);
}
