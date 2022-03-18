import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:trading_module/pages/deposit/transfer_type/component/bank_type.dart';
import 'package:trading_module/pages/deposit/transfer_type/component/nine_pay_type.dart';
import 'package:trading_module/pages/deposit/transfer_type/component/saving_product_type.dart';
import 'package:trading_module/pages/support_fab/support_fab.dart';
import 'package:trading_module/shared_widgets/BaseScaffold.dart';

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
                title:  "",
                info:  "",
                cost:  "",
                onTapped: () => controller.onTapped9Pay(),
              ),
          ],
        ));
  }
}
