import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_module/cores/states/base_view_model.dart';
import 'package:trading_module/pages/stock_detail/Views/cell_finance_info.dart';
import 'package:trading_module/pages/stock_detail/Views/cell_header_finance_info.dart';
import 'package:trading_module/pages/stock_detail/Views/cp_news_item_view.dart';
import 'package:trading_module/pages/stock_more_detail/tabs/financial/stock_company_info_controller.dart';
import 'package:trading_module/pages/stock_more_detail/tabs/news/stock_company_news_controller.dart';
import 'package:trading_module/shared_widgets/ListNoDataBackground.dart';
import 'package:trading_module/utils/extensions.dart';

class StockCompanyNewsView extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final StockCompanyNewsController controller = Get.find();
    return controller.obx(
      (newsList) {
        return ListView.builder(
          itemBuilder: (context, index) =>
              CompanyNewsItemView(news: newsList![index]),
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          itemCount: newsList?.length,
        );
      },
      onLoading: const Padding(
        padding: EdgeInsets.only(top: 120),
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
      onError: (error) => const ListNoDataBackground(
        padding: EdgeInsets.only(top: 100),
        pngPath: "assets/images/png/trans_empty.png",
        title: "Chưa có dữ liệu ",
        desc: "",
      ),
    );
  }
}
