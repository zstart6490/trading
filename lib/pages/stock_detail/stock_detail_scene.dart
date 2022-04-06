import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_module/domain/entities/model.dart';
import 'package:trading_module/pages/homePage/views/menu_option_view.dart';
import 'package:trading_module/pages/stock_detail/Views/chart_demo_view.dart';
import 'package:trading_module/pages/stock_detail/Views/chart_view.dart';
import 'package:trading_module/pages/stock_detail/Views/invest_info_view.dart';
import 'package:trading_module/pages/stock_detail/stock_detail_controller.dart';
import 'package:trading_module/shared_widgets/BaseScaffold.dart';
import 'package:trading_module/shared_widgets/CustomButton.dart';
import 'package:trading_module/shared_widgets/ListNoDataBackground.dart';
import 'package:trading_module/utils/util.dart';

class StockDetailScene extends GetView<StockDetailController> {
  const StockDetailScene({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScaffoldAppBar<StockDetailController>(
      backgroundColor: Colors.white,
      title: "Chi tiết cổ phiếu".tr,
      body: Column(
        children: [
          Expanded(
            child: _buildChild(),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: CustomButton.trailingStyle(
                    title: "Mua",
                    textStyle: context.textSize18light,
                    trailing: const Icon(
                      null,
                    ),
                    onPressed: () {
                      controller.onTapped();
                    },
                  ),
                ),
                SIZED_BOX_W16,
                const Expanded(
                  child: CustomButton(bgColor: Colors.black, title: "Bán"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChild() {
    return ListView.builder(
        itemCount: controller.countItem,
        itemBuilder: (context, index) {
          if (index == 0) {
            return HeaderStockDetailView(
              controller: controller,
            );
          }
          if (controller.countItem > 2) {
            return BoardItemCell(
              item: Model(gstId: "SSI", startTime: DateTime.now()),
              onPressed: () {},
            );
          } else {
            return ListNoDataBackground(
                pngPath: "assets/images/png/banner_empty_data.png",
                desc: "Chưa có mã nào trong mục này".tr,
                padding: PAD_SYM_H40,
                btnTitle: "Thêm mã",
                onPressed: () {
                  //controller.buyStock();
                });
          }
        });
  }
}

class HeaderStockDetailView<T extends StockDetailController>
    extends StatelessWidget {
  const HeaderStockDetailView({Key? key, required this.controller})
      : super(key: key);
  final T controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SIZED_BOX_H08,
        Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  controller.stock.fullLink,
                  width: 43,
                  height: 43,
                  fit: BoxFit.contain,
                ),
              ),
              SIZED_BOX_W10,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      controller.stock.symbol,
                      style: const TextStyle(
                        color: Color(0xFF333333),
                        fontSize: 20,
                        fontFamily: 'iCielHelveticaNowText',
                        fontWeight: FontWeight.w700,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    Text(
                      controller.stock.stockName,
                      style: const TextStyle(
                        color: Color(0xFF333333),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'iCielHelveticaNowText',
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        SIZED_BOX_H16,

        ChartDemoView(),

        const SpaceWithCustom(
          height: 8,
          bgColor: Color(0xFFF5F6FA),
        ),

        const InvestInfoView(),
        SIZED_BOX_H16,

        Container(
            padding: const EdgeInsets.fromLTRB(12, 18, 12, 18),
            margin: const EdgeInsets.fromLTRB(16, 0, 16, 8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: const Color(0xFFF5F6FA)),
            child: Column(
              children: [
                Column(
                  children: const [
                    Center(
                        child: Text(
                      "Tổng khối lượng",
                      style: TextStyle(
                        color: Color(0xFF333333),
                        fontSize: 16,
                        fontFamily: 'iCielHelveticaNowText',
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.none,
                      ),
                      textAlign: TextAlign.center,
                    )),
                    SIZED_BOX_H02,
                    Center(
                      child: Text(
                        "110 CP",
                        style: TextStyle(
                          color: Color(0xFF33CC7F),
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'iCielHelveticaNowText',
                          decoration: TextDecoration.none,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                SIZED_BOX_H24,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: const [
                        Text(
                          "Có thể bán",
                          style: TextStyle(
                            color: Color(0xFF9AA0A5),
                            fontSize: 12,
                            fontFamily: 'iCielHelveticaNowText',
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.none,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SIZED_BOX_H04,
                        Text(
                          "40",
                          style: TextStyle(
                            color: Color(0xFF333333),
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'iCielHelveticaNowText',
                            decoration: TextDecoration.none,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    Container(
                      width: 1,
                      height: 40,
                      color: Color(0xFFC9C9C9),
                    ),
                    Column(
                      children: const [
                        Text(
                          "CP chờ về",
                          style: TextStyle(
                            color: Color(0xFF9AA0A5),
                            fontSize: 12,
                            fontFamily: 'iCielHelveticaNowText',
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.none,
                          ),
                        ),
                        SIZED_BOX_H04,
                        Text(
                          "70",
                          style: TextStyle(
                            color: Color(0xFF333333),
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'iCielHelveticaNowText',
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: 1,
                      height: 40,
                      color: Color(0xFFC9C9C9),
                    ),
                    Column(
                      children: const [
                        Text(
                          "Cổ tức chờ về",
                          style: TextStyle(
                            color: Color(0xFF9AA0A5),
                            fontSize: 12,
                            fontFamily: 'iCielHelveticaNowText',
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.none,
                          ),
                        ),
                        SIZED_BOX_H04,
                        Text(
                          "02",
                          style: TextStyle(
                            color: Color(0xFF333333),
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'iCielHelveticaNowText',
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            )),

        Container(
          padding: const EdgeInsets.fromLTRB(12, 18, 12, 18),
          margin: const EdgeInsets.fromLTRB(16, 0, 16, 8),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Mã CP",
                  style: TextStyle(
                    color: Color(0xFF9AA0A5),
                    fontSize: 12,
                    fontFamily: 'iCielHelveticaNowText',
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.none,
                  ),
                ),
                Text(
                  "Khối lượng",
                  style: TextStyle(
                    color: Color(0xFF9AA0A5),
                    fontSize: 12,
                    fontFamily: 'iCielHelveticaNowText',
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.none,
                  ),
                ),
                Text(
                  "Giá mua",
                  style: TextStyle(
                    color: Color(0xFF9AA0A5),
                    fontSize: 12,
                    fontFamily: 'iCielHelveticaNowText',
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.none,
                  ),
                ),
                Text(
                  "+/-",
                  style: TextStyle(
                    color: Color(0xFF9AA0A5),
                    fontSize: 12,
                    fontFamily: 'iCielHelveticaNowText',
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.none,
                  ),
                ),
              ]),
        ),
      ],
    );
  }
}
