import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_module/configs/constants.dart';
import 'package:trading_module/domain/entities/list_order_transaction.dart';
import 'package:trading_module/domain/entities/stock_transaction_history.dart';
import 'package:trading_module/pages/transaction_history/trans_st_history_item_controller.dart';
import 'package:trading_module/theme/app_color.dart';
import 'package:trading_module/utils/enums.dart';
import 'package:trading_module/utils/extensions.dart';

class StockTransHistoryItemView extends StatelessWidget {
  OrderRecord orderRecord;

  StockTransHistoryItemView(this.orderRecord);

  @override
  Widget build(BuildContext context) {
    final TransStockHistoryController transStockHistoryController =Get.find();
    return Column(
      children: [
        Row(children: [
          Expanded(
              child: Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            decoration: const BoxDecoration(
                color: SCAFFOLD_COLOR,
                borderRadius: BorderRadius.all(Radius.circular(8.0))),
            child: Text(
              orderRecord.key,
              style: context.textSize14
                  .copyWith(color: COLOR_333333, fontWeight: FontWeight.w500),
            ),
          ))
        ]),
        Container(
          padding:
              const EdgeInsets.only(left: 25, right: 25, top: 16, bottom: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Mã CP",
                style: context.textSize12.copyWith(
                    color: COLOR_NEUTRAL_300, fontWeight: FontWeight.w400),
              ),
              Text(
                "Khối lượng",
                style: context.textSize12.copyWith(
                    color: COLOR_NEUTRAL_300, fontWeight: FontWeight.w400),
              ),
              Text(
                "Giá khớp",
                style: context.textSize12.copyWith(
                    color: COLOR_NEUTRAL_300, fontWeight: FontWeight.w400),
              ),
              Text(
                "Trạng thái",
                style: context.textSize12.copyWith(
                    color: COLOR_NEUTRAL_300, fontWeight: FontWeight.w400),
              )
            ],
          ),
        ),
        ListView.separated(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          padding: PAD_ALL16,
          itemCount: orderRecord.data.length,
          itemBuilder: (_, index) {
            final StockTransactionHistory stHistory = orderRecord.data[index];
            return InkWell(
              onTap: () => transStockHistoryController.onClickStock(orderRecord.data[index]),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 22),
                decoration: const BoxDecoration(
                    color: SCAFFOLD_COLOR,
                    borderRadius: BorderRadius.all(Radius.circular(8.0))),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        stHistory.symbol,
                        textAlign: TextAlign.center,
                        style: context.textSize12.copyWith(
                            color: COLOR_333333, fontWeight: FontWeight.w700),
                      ),
                      Text(
                        stHistory.quantity.toString(),
                        textAlign: TextAlign.center,
                        style: context.textSize12.copyWith(
                            color: COLOR_333333, fontWeight: FontWeight.w700),
                      ),
                      Text(
                        (stHistory.priceMatch > 0)
                            ? stHistory.priceMatch.toString()
                            : "----",
                        textAlign: TextAlign.center,
                        style: context.textSize12.copyWith(
                            color: getStateColor(stHistory.status),
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        stHistory.getStateContent(),
                        style: context.textSize12.copyWith(
                            color: getStateColor(stHistory.status),
                            fontWeight: FontWeight.w700),
                      )
                    ]),
              ),
            );
          },
          separatorBuilder: (_, index) => SIZED_BOX_H08,
        )
      ],
    );
  }

  Color getStateColor(StockTransactionState status) {
    if (status == StockTransactionState.pending) {
      return Colors.orange;
    }
    if (status == StockTransactionState.processed) {
      return Colors.green;
    }
    if (status == StockTransactionState.failed) {
      return Colors.redAccent;
    }
    return Colors.orange;
  }
}
