import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_module/pages/history_share_transaction/history_share_transaction_controller.dart';
import 'package:trading_module/pages/history_share_transaction/trantraction_share_section.dart';
import 'package:trading_module/shared_widgets/BaseScaffold.dart';

class HistoryShareTransactionPage
    extends GetView<HistoryShareTransactionController> {
  const HistoryShareTransactionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: BaseScaffoldAppBar<HistoryShareTransactionController>(
          showBackBtn: true,
          backgroundColor: Colors.white,
          title: "transaction_history_title".tr,
          body: Column(
            children: [
              Container(
                height: 40,
                margin: const EdgeInsets.fromLTRB(20, 16, 12, 0),
                padding: const EdgeInsets.fromLTRB(2, 2, 2, 2),
                decoration: new BoxDecoration(
                    color: Color(0xFFF5F6FA),
                    borderRadius: BorderRadius.circular(20.0)),
                child: TabBar(
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      20.0,
                    ),
                    color: Colors.white,
                  ),
                  labelColor: Colors.black,
                  unselectedLabelColor: Color(0xFF858585),
                  tabs: [
                    Tab(
                      child: Text(
                        'Mua',
                        style: TextStyle(
                            fontFamily: 'iCielHelveticaNowText',
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF333333)),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Bán',
                        style: TextStyle(
                            fontFamily: 'iCielHelveticaNowText',
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF333333)),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: CustomScrollView(
                  slivers: List.generate(4, (index) {
                    //final key = state.keys.elementAt(index);
                    return TransactionShareSection(
                      headerTime: DateTime.now(),
                      sectionData: controller.list_share,
                      //onPressed: (),
                    );
                  }),
                ),
              ),
              // onEmpty: ListNoDataBackground.png(
              //   "assets/images/png/empty_bg.png",
              //   desc: "Bạn chưa thực hiện giao dịch nào",
              //   padding: PAD_SYM_H40,
              // ),
            ],
          )),
    );
  }
}
