import 'package:trading_module/domain/entities/stock_transaction_detail.dart';
import 'package:trading_module/utils/enums.dart';

class NavigateStockTranDetail {
  StockTransactionDetail transaction;
  StockOrderType stockTransactionType;

  NavigateStockTranDetail(this.transaction, this.stockTransactionType);
}
