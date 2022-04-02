import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_module/pages/market/market_cell.dart';
import 'package:trading_module/pages/market/market_controller.dart';
import 'package:trading_module/shared_widgets/BaseScaffold.dart';
import 'package:trading_module/shared_widgets/ListNoDataBackground.dart';

class MarketScene extends GetView<MarketController> {
  const MarketScene({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScaffoldAppBar<MarketController>(
      backgroundColor: Colors.white,
      title: "Thị trường".tr,
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: const Color(0xFFF5F6FA),
              ),
              child: Obx(
                () => TextField(
                  textAlignVertical: TextAlignVertical.center,
                  controller: controller.nameHolder,
                  decoration: InputDecoration(
                    isCollapsed: true,
                    border: InputBorder.none,
                    hintText: "Tìm kiếm mã cổ phiếu",
                    hintStyle: const TextStyle(
                        fontSize: 12,
                        fontFamily: 'iCielHelveticaNowText',
                        color: Color(0xFF858585)),
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Color(0xFFADADAD),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                          controller.hiddenRemoveSearch.value
                              ? null
                              : Icons.clear,
                          color: Color(0xFFADADAD)),
                      onPressed: () {
                        controller.cleanSearch();
                      },
                    ),
                  ),
                  onChanged: (val) => controller.onChangeSearchStock(val),
                ),
              ),
            ),
          ),
          controller.obx(
            (stocks) => Expanded(
              child: CustomScrollView(slivers: <Widget>[
                SliverList(
                  delegate: SliverChildListDelegate(
                      List.generate(stocks!.length, (index) {
                    final stock = stocks[index];
                    return MarketCell(
                      stock: stock,
                      onPressed: () => controller.onTapped(stock),
                    );
                  })),
                ),
              ]),
            ),
            onLoading: const SizedBox(),
            onError: (error) => Text(error ?? "Load Content Error!"),
            onEmpty: ListNoDataBackground(
              pngPath: "assets/images/png/banner_search_not_found.png",
              title: "Không tìm thấy kết quả".tr,
              desc: "Kiểm tra từ khóa và thử lại".tr,
              padding: const EdgeInsets.only(top: 180),
              btnTitle: null,
            ),
          ),
        ],
      ),
    );
  }
}
