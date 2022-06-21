import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:trading_module/configs/constants.dart';
import 'package:trading_module/pages/market/market_cell.dart';
import 'package:trading_module/pages/market/market_controller.dart';
import 'package:trading_module/shared_widgets/BaseScaffold.dart';
import 'package:trading_module/shared_widgets/CustomRefresher.dart';
import 'package:trading_module/shared_widgets/ListNoDataBackground.dart';

class MarketScene extends GetView<MarketController> {
  const MarketScene({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final focusNode = FocusNode();
    return BaseScaffoldAppBar<MarketController>(
      backgroundColor: Colors.white,
      leading: IconButton(
        icon: Image.asset("assets/images/png/ic_back_white.png",
            color: Colors.black, package: "trading_module"),
        onPressed: () => controller.backToTabHome(),
      ),
      showBackBtn: true,
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
                  focusNode: focusNode,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(10),

                    /// here char limit is 10
                  ],
                  decoration: InputDecoration(
                    isCollapsed: true,
                    border: InputBorder.none,
                    hintText: "Tìm kiếm mã cổ phiếu",
                    hintStyle: const TextStyle(
                      fontSize: 12,
                      fontFamily: 'iCielHelveticaNowText',
                      color: Color(0xFF858585),
                    ),
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Color(0xFFADADAD),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        controller.hiddenRemoveSearch.value
                            ? null
                            : Icons.clear,
                        color: const Color(0xFFADADAD),
                      ),
                      onPressed: () => controller.cleanSearch(),
                    ),
                  ),
                  onChanged: (val) => controller.onChangeSearchStock(val),
                ),
              ),
            ),
          ),
          Expanded(
              child: controller.obx(
                  (stocks) => CustomRefresher(
                      controller: controller.refreshController,
                      onRefresh: controller.onRefresh,
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          final stock = stocks![index];
                          return MarketCell(
                            stock: stock,
                            onPressed: () {
                              focusNode.unfocus();
                              controller.onTapped(stock);
                            },
                          );
                        },
                        itemCount: stocks!.length,
                      )),
                  onLoading: const SizedBox(),

                  onError: (error) => SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: ListNoDataBackground(
                      pngPath: "assets/images/png/banner_error.png",
                      title: "Có lỗi xảy ra, vui lòng thử lại!",
                      padding: PAD_SYM_H40,
                      showIconButton: false,
                      btnTitle: "Thử lại",
                      onPressed: () => controller.getListStock(),
                    ),
                  ),

                  onEmpty: const ListNoDataBackground(
                    pngPath: "assets/images/png/banner_search_not_found.png",
                    title: "Không tìm thấy kết quả",
                    desc: "Kiểm tra từ khóa và thử lại",
                  ))),
        ],
      ),
    );
  }
}
