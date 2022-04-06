import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_module/pages/homePage/views/menu_option_view.dart';
import 'package:trading_module/pages/stock_more_detail/stock_more_detail_controller.dart';
import 'package:trading_module/shared_widgets/BaseScaffold.dart';
import 'package:trading_module/shared_widgets/CustomButton.dart';
import 'package:trading_module/utils/util.dart';

class StockMoreDetailScene extends GetView<StockMoreDetailController> {
  const StockMoreDetailScene({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const headerTitleStyle = TextStyle(
        fontFamily: 'iCielHelveticaNowText',
        color: Color(0xFF858585),
        fontSize: 12,
        fontWeight: FontWeight.w400);

    return BaseScaffoldAppBar<StockMoreDetailController>(
      backgroundColor: Colors.white,
      title: controller.stock.symbol,
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.only(top: 30),
              children: <Widget>[
                SIZED_BOX_H08,
                StockMenuView(controller: controller),
                SIZED_BOX_H06,
                Padding(
                  padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
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
                              controller.stock.stockName,
                              style: const TextStyle(
                                color: Color(0xFF333333),
                                fontSize: 14,
                                fontFamily: 'iCielHelveticaNowText',
                                fontWeight: FontWeight.w400,
                                decoration: TextDecoration.none,
                              ),
                            ),
                            SIZED_BOX_H02,
                            Row(
                              children: [
                                Text(
                                  controller.stock.lastPrice
                                      .toCurrency(symbol: ""),
                                  style: const TextStyle(
                                    color: Color(0xFF333333),
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'iCielHelveticaNowText',
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                                const Text(
                                  "/CP",
                                  style: TextStyle(
                                    color: Color(0xFF858585),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'iCielHelveticaNowText',
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SIZED_BOX_H16,
                //const ChartView(),
                const SpaceWithCustom(
                  height: 8,
                  bgColor: Color(0xFFF5F6FA),
                ),
                SIZED_BOX_H16,
                Container(
                  padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                  margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Text(
                        "KL mua",
                        style: headerTitleStyle,
                      ),
                      Text(
                        "Giá mua",
                        style: headerTitleStyle,
                      ),
                      SizedBox(
                        width: 1,
                        height: 1,
                      ),
                      Text(
                        "Giá bán",
                        style: headerTitleStyle,
                      ),
                      Text(
                        "KL bán",
                        style: headerTitleStyle,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(12, 18, 12, 18),
                  margin: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: const Color(0xFFF5F6FA)),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Text(
                            "34,70",
                            style: TextStyle(
                              color: Color(0xFF333333),
                              fontSize: 12,
                              fontFamily: 'iCielHelveticaNowText',
                              fontWeight: FontWeight.w700,
                              decoration: TextDecoration.none,
                            ),
                          ),
                          const Text(
                            "34,70",
                            style: TextStyle(
                              color: Color(0xFF333333),
                              fontSize: 12,
                              fontFamily: 'iCielHelveticaNowText',
                              fontWeight: FontWeight.w700,
                              decoration: TextDecoration.none,
                            ),
                          ),
                          Container(
                            width: 1,
                            height: 40,
                            color: Color(0xFFDADADA),
                          ),
                          const Text(
                            "34,70",
                            style: TextStyle(
                              color: Color(0xFF00B14F),
                              fontSize: 12,
                              fontFamily: 'iCielHelveticaNowText',
                              fontWeight: FontWeight.w700,
                              decoration: TextDecoration.none,
                            ),
                          ),
                          const Text(
                            "34,70",
                            style: TextStyle(
                              color: Color(0xFF00B14F),
                              fontSize: 12,
                              fontFamily: 'iCielHelveticaNowText',
                              fontWeight: FontWeight.w700,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Text(
                            "34,70",
                            style: TextStyle(
                              color: Color(0xFF333333),
                              fontSize: 12,
                              fontFamily: 'iCielHelveticaNowText',
                              fontWeight: FontWeight.w700,
                              decoration: TextDecoration.none,
                            ),
                          ),
                          const Text(
                            "34,70",
                            style: TextStyle(
                              color: Color(0xFF333333),
                              fontSize: 12,
                              fontFamily: 'iCielHelveticaNowText',
                              fontWeight: FontWeight.w700,
                              decoration: TextDecoration.none,
                            ),
                          ),
                          Container(
                            width: 1,
                            height: 40,
                            color: Color(0xFFDADADA),
                          ),
                          const Text(
                            "34,70",
                            style: TextStyle(
                              color: Color(0xFF00B14F),
                              fontSize: 12,
                              fontFamily: 'iCielHelveticaNowText',
                              fontWeight: FontWeight.w700,
                              decoration: TextDecoration.none,
                            ),
                          ),
                          const Text(
                            "34,70",
                            style: TextStyle(
                              color: Color(0xFF00B14F),
                              fontSize: 12,
                              fontFamily: 'iCielHelveticaNowText',
                              fontWeight: FontWeight.w700,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Text(
                            "34,70",
                            style: TextStyle(
                              color: Color(0xFF333333),
                              fontSize: 12,
                              fontFamily: 'iCielHelveticaNowText',
                              fontWeight: FontWeight.w700,
                              decoration: TextDecoration.none,
                            ),
                          ),
                          const Text(
                            "34,70",
                            style: TextStyle(
                              color: Color(0xFF333333),
                              fontSize: 12,
                              fontFamily: 'iCielHelveticaNowText',
                              fontWeight: FontWeight.w700,
                              decoration: TextDecoration.none,
                            ),
                          ),
                          Container(
                            width: 1,
                            height: 40,
                            color: Color(0xFFDADADA),
                          ),
                          const Text(
                            "34,70",
                            style: TextStyle(
                              color: Color(0xFF00B14F),
                              fontSize: 12,
                              fontFamily: 'iCielHelveticaNowText',
                              fontWeight: FontWeight.w700,
                              decoration: TextDecoration.none,
                            ),
                          ),
                          const Text(
                            "34,70",
                            style: TextStyle(
                              color: Color(0xFF00B14F),
                              fontSize: 12,
                              fontFamily: 'iCielHelveticaNowText',
                              fontWeight: FontWeight.w700,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SIZED_BOX_H08,
                const SpaceWithCustom(
                  height: 8,
                  bgColor: Color(0xFFF5F6FA),
                ),

                Container(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Sàn",
                          style: headerTitleStyle,
                          textAlign: TextAlign.right,
                        ),
                      ),
                      Text(
                        "Tham chiếu",
                        style: headerTitleStyle,
                      ),
                      Text(
                        "Trần  ",
                        style: headerTitleStyle,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(0, 18, 0, 18),
                  margin: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: const Color(0xFFF5F6FA)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Text(
                        "34,70",
                        style: TextStyle(
                          color: Color(0xFF333333),
                          fontSize: 12,
                          fontFamily: 'iCielHelveticaNowText',
                          fontWeight: FontWeight.w700,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      Text(
                        "34,70",
                        style: TextStyle(
                          color: Color(0xFF00B14F),
                          fontSize: 12,
                          fontFamily: 'iCielHelveticaNowText',
                          fontWeight: FontWeight.w700,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      Text(
                        "34,70",
                        style: TextStyle(
                          color: Color(0xFF00B14F),
                          fontSize: 12,
                          fontFamily: 'iCielHelveticaNowText',
                          fontWeight: FontWeight.w700,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Thấp",
                          style: headerTitleStyle,
                          textAlign: TextAlign.right,
                        ),
                      ),
                      Text(
                        "Trung bình",
                        style: headerTitleStyle,
                      ),
                      Text(
                        "Cao  ",
                        style: headerTitleStyle,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(0, 18, 0, 18),
                  margin: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: const Color(0xFFF5F6FA)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Text(
                        "34,70",
                        style: TextStyle(
                          color: Color(0xFF333333),
                          fontSize: 12,
                          fontFamily: 'iCielHelveticaNowText',
                          fontWeight: FontWeight.w700,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      Text(
                        "34,70",
                        style: TextStyle(
                          color: Color(0xFF00B14F),
                          fontSize: 12,
                          fontFamily: 'iCielHelveticaNowText',
                          fontWeight: FontWeight.w700,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      Text(
                        "34,70",
                        style: TextStyle(
                          color: Color(0xFF00B14F),
                          fontSize: 12,
                          fontFamily: 'iCielHelveticaNowText',
                          fontWeight: FontWeight.w700,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
                  margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Tổng KL",
                          style: headerTitleStyle,
                          textAlign: TextAlign.right,
                        ),
                      ),
                      Text(
                        "Tổng giá trị",
                        style: headerTitleStyle,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(32, 18, 32, 18),
                  margin: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: const Color(0xFFF5F6FA)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "34,70",
                        style: TextStyle(
                          color: Color(0xFF333333),
                          fontSize: 12,
                          fontFamily: 'iCielHelveticaNowText',
                          fontWeight: FontWeight.w700,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      Text(
                        "10.480.630",
                        style: TextStyle(
                          color: Color(0xFF333333),
                          fontSize: 12,
                          fontFamily: 'iCielHelveticaNowText',
                          fontWeight: FontWeight.w700,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
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
                      //controller.onTapped();
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
}

class StockMenuView<T extends StockMoreDetailController>
    extends StatelessWidget {
  const StockMenuView({Key? key, required this.controller}) : super(key: key);
  final T controller;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Container(
          height: 40.0,
          padding: const EdgeInsets.all(2.0),
          margin: PAD_SYM_H12,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100.0),
              color: const Color(0xFFF5F6FA)),
          child: TabBar(
              controller: controller.tabController,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  100.0,
                ),
                color: Colors.white,
              ),
              labelPadding: const EdgeInsets.all(2.0),
              labelStyle: context.textSize12.copyWith(
                fontWeight: FontWeight.w600,
              ),
              labelColor: const Color(0xFF333333),
              unselectedLabelColor: context.disabledColor,
              unselectedLabelStyle:
                  context.textSize12.copyWith(color: context.disabledColor),
              tabs: List.generate(controller.timeRange.length, (index) {
                return Tab(
                  text: controller.timeRange[index],
                );
              })),
        ));
  }
}
