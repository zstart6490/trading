import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:trading_module/pages/deposit/transfer_type/component/nine_pay_type.dart';
import 'package:trading_module/pages/support_fab/support_fab.dart';
import 'package:trading_module/shared_widgets/BaseScaffold.dart';
import 'package:trading_module/utils/extensions.dart';

import 'transfer_type_controller.dart';

class TDTransferTypeScene extends GetView<TDTransferTypeController> {
  const TDTransferTypeScene({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScaffoldAppBar<TDTransferTypeController>(
        title: "Hình thức nạp tiền",
        fab: const TDSupportFAB(shouldShowFull: false),
        body: ListView(
          children: [
            if (true)
              NinePayType(
                title: controller.data.paymentMethod?.first.title ?? "",
                info: controller.data.paymentMethod?.first.note ?? "",
                cost: controller.data.feeAmount.toCurrency(symbol:"VNĐ"),
                onTapped: () => controller.onTapped9Pay(),
              ),
          ],
        ));
  }
}
