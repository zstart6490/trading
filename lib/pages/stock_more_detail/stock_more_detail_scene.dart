import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_module/pages/homePage/views/menu_option_view.dart';
import 'package:trading_module/pages/stock_detail/Views/chart_view.dart';
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
      actions: <Widget>[
        Obx(
          () => IconButton(
            icon: Image.asset(
                controller.isFollow.value
                    ? "assets/images/png/ic_follow.png"
                    : "assets/images/png/ic_unfollow.png",
                package: "trading_module"),
            tooltip: 'Thông tin',
            onPressed: () {
              controller.follow();
            },
          ),
        ),
      ],
      body: controller.obx(
        (stock) => Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.only(top: 30),
                children: <Widget>[
                  SIZED_BOX_H08,
                  StockMenuView(controller: controller),
                  SIZED_BOX_H06,
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
                  Container(
                    width: double.infinity,
                    height: 340,
                    margin: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                    child: const ChartView(),
                  ),
                  SIZED_BOX_H12,
                  const SpaceWithCustom(
                    height: 8,
                    bgColor: Color(0xFFF5F6FA),
                  ),
                  SIZED_BOX_H16,
                  Container(
                    padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                    margin: const EdgeInsets.fromLTRB(16, 12, 16, 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        Expanded(
                          child: Text(
                            "KL mua",
                            style: headerTitleStyle,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "Giá mua",
                            style: headerTitleStyle,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          width: 1,
                        ),
                        Expanded(
                          child: Text(
                            "Giá bán",
                            style: headerTitleStyle,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "KL bán",
                            style: headerTitleStyle,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 130,
                    padding: const EdgeInsets.fromLTRB(12, 18, 12, 18),
                    margin: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: const Color(0xFFF5F6FA)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                (stock?.askVol1 ?? 0).getPriceStock(),
                                style: TextStyle(
                                  color: (stock?.askPrice1 ?? 0)
                                      .getStockColorWith(
                                          stock?.refPrice ?? 0,
                                          stock?.floor ?? 0,
                                          stock?.ceiling ?? 0),
                                  fontSize: 12,
                                  fontFamily: 'iCielHelveticaNowText',
                                  fontWeight: FontWeight.w700,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                              Text(
                                (stock?.askVol2 ?? 0).getPriceStock(),
                                style: TextStyle(
                                  color: (stock?.askPrice2 ?? 0)
                                      .getStockColorWith(
                                          stock?.refPrice ?? 0,
                                          stock?.floor ?? 0,
                                          stock?.ceiling ?? 0),
                                  fontSize: 12,
                                  fontFamily: 'iCielHelveticaNowText',
                                  fontWeight: FontWeight.w700,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                              Text(
                                (stock?.askVol3 ?? 0).getPriceStock(),
                                style: TextStyle(
                                  color: (stock?.askPrice3 ?? 0)
                                      .getStockColorWith(
                                          stock?.refPrice ?? 0,
                                          stock?.floor ?? 0,
                                          stock?.ceiling ?? 0),
                                  fontSize: 12,
                                  fontFamily: 'iCielHelveticaNowText',
                                  fontWeight: FontWeight.w700,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                (stock?.askPrice1 ?? 0).getPriceStock(),
                                style: TextStyle(
                                  color: (stock?.askPrice1 ?? 0)
                                      .getStockColorWith(
                                          stock?.refPrice ?? 0,
                                          stock?.floor ?? 0,
                                          stock?.ceiling ?? 0),
                                  fontSize: 12,
                                  fontFamily: 'iCielHelveticaNowText',
                                  fontWeight: FontWeight.w700,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                              Text(
                                (stock?.askPrice2 ?? 0).getPriceStock(),
                                style: TextStyle(
                                  color: (stock?.askPrice2 ?? 0)
                                      .getStockColorWith(
                                          stock?.refPrice ?? 0,
                                          stock?.floor ?? 0,
                                          stock?.ceiling ?? 0),
                                  fontSize: 12,
                                  fontFamily: 'iCielHelveticaNowText',
                                  fontWeight: FontWeight.w700,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                              Text(
                                (stock?.askPrice3 ?? 0).getPriceStock(),
                                style: TextStyle(
                                  color: (stock?.askPrice3 ?? 0)
                                      .getStockColorWith(
                                          stock?.refPrice ?? 0,
                                          stock?.floor ?? 0,
                                          stock?.ceiling ?? 0),
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
                          width: 1,
                          color: const Color(0xFFDADADA),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                (stock?.bidPrice1 ?? 0).getPriceStock(),
                                style: TextStyle(
                                  color: (stock?.bidPrice1 ?? 0)
                                      .getStockColorWith(
                                          stock?.refPrice ?? 0,
                                          stock?.floor ?? 0,
                                          stock?.ceiling ?? 0),
                                  fontSize: 12,
                                  fontFamily: 'iCielHelveticaNowText',
                                  fontWeight: FontWeight.w700,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                              Text(
                                (stock?.bidPrice2 ?? 0).getPriceStock(),
                                style: TextStyle(
                                  color: (stock?.bidPrice2 ?? 0)
                                      .getStockColorWith(
                                          stock?.refPrice ?? 0,
                                          stock?.floor ?? 0,
                                          stock?.ceiling ?? 0),
                                  fontSize: 12,
                                  fontFamily: 'iCielHelveticaNowText',
                                  fontWeight: FontWeight.w700,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                              Text(
                                (stock?.bidPrice3 ?? 0).getPriceStock(),
                                style: TextStyle(
                                  color: (stock?.bidPrice3 ?? 0)
                                      .getStockColorWith(
                                          stock?.refPrice ?? 0,
                                          stock?.floor ?? 0,
                                          stock?.ceiling ?? 0),
                                  fontSize: 12,
                                  fontFamily: 'iCielHelveticaNowText',
                                  fontWeight: FontWeight.w700,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                (stock?.bidVol1 ?? 0).getPriceStock(),
                                style: TextStyle(
                                  color: (stock?.bidPrice1 ?? 0)
                                      .getStockColorWith(
                                          stock?.refPrice ?? 0,
                                          stock?.floor ?? 0,
                                          stock?.ceiling ?? 0),
                                  fontSize: 12,
                                  fontFamily: 'iCielHelveticaNowText',
                                  fontWeight: FontWeight.w700,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                              Text(
                                (stock?.bidVol2 ?? 0).getPriceStock(),
                                style: TextStyle(
                                  color: (stock?.bidPrice2 ?? 0)
                                      .getStockColorWith(
                                          stock?.refPrice ?? 0,
                                          stock?.floor ?? 0,
                                          stock?.ceiling ?? 0),
                                  fontSize: 12,
                                  fontFamily: 'iCielHelveticaNowText',
                                  fontWeight: FontWeight.w700,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                              Text(
                                (stock?.bidVol3 ?? 0).getPriceStock(),
                                style: TextStyle(
                                  color: (stock?.bidPrice3 ?? 0)
                                      .getStockColorWith(
                                          stock?.refPrice ?? 0,
                                          stock?.floor ?? 0,
                                          stock?.ceiling ?? 0),
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
                  SIZED_BOX_H08,
                  const SpaceWithCustom(
                    height: 8,
                    bgColor: Color(0xFFF5F6FA),
                  ),
                  SIZED_BOX_H16,
                  Container(
                    margin: const EdgeInsets.fromLTRB(16, 12, 16, 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Expanded(
                          child: Text(
                            "Sàn",
                            style: headerTitleStyle,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "Tham chiếu",
                            style: headerTitleStyle,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "Trần  ",
                            style: headerTitleStyle,
                            textAlign: TextAlign.center,
                          ),
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            (stock?.floor ?? 0).getPriceStock(),
                            style: const TextStyle(
                              color: floorColor,
                              fontSize: 12,
                              fontFamily: 'iCielHelveticaNowText',
                              fontWeight: FontWeight.w700,
                              decoration: TextDecoration.none,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            (stock?.refPrice ?? 0).getPriceStock(),
                            style: const TextStyle(
                              color: refColor,
                              fontSize: 12,
                              fontFamily: 'iCielHelveticaNowText',
                              fontWeight: FontWeight.w700,
                              decoration: TextDecoration.none,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            (stock?.ceiling ?? 0).getPriceStock(),
                            style: const TextStyle(
                              color: ceilColor,
                              fontSize: 12,
                              fontFamily: 'iCielHelveticaNowText',
                              fontWeight: FontWeight.w700,
                              decoration: TextDecoration.none,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Expanded(
                          child: Text(
                            "Thấp",
                            style: headerTitleStyle,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "Trung bình",
                            style: headerTitleStyle,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "Cao  ",
                            style: headerTitleStyle,
                            textAlign: TextAlign.center,
                          ),
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            (stock?.low ?? 0).getPriceStock(),
                            style: TextStyle(
                              color: (stock?.low ?? 0).getStockColorWith(
                                  stock?.refPrice ?? 0,
                                  stock?.floor ?? 0,
                                  stock?.ceiling ?? 0),
                              fontSize: 12,
                              fontFamily: 'iCielHelveticaNowText',
                              fontWeight: FontWeight.w700,
                              decoration: TextDecoration.none,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            (stock?.avg ?? 0).getPriceStock(),
                            style: TextStyle(
                              color: (stock?.avg ?? 0).getStockColorWith(
                                  stock?.refPrice ?? 0,
                                  stock?.floor ?? 0,
                                  stock?.ceiling ?? 0),
                              fontSize: 12,
                              fontFamily: 'iCielHelveticaNowText',
                              fontWeight: FontWeight.w700,
                              decoration: TextDecoration.none,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            (stock?.high ?? 0).getPriceStock(),
                            style: TextStyle(
                              color: (stock?.high ?? 0).getStockColorWith(
                                  stock?.refPrice ?? 0,
                                  stock?.floor ?? 0,
                                  stock?.ceiling ?? 0),
                              fontSize: 12,
                              fontFamily: 'iCielHelveticaNowText',
                              fontWeight: FontWeight.w700,
                              decoration: TextDecoration.none,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Expanded(
                          child: Text(
                            "Tổng KL",
                            style: headerTitleStyle,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "",
                            style: headerTitleStyle,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "Tổng giá trị",
                            style: headerTitleStyle,
                            textAlign: TextAlign.center,
                          ),
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            (stock?.totalVol ?? 0).getPriceStock(),
                            style: const TextStyle(
                              color: Color(0xFF333333),
                              fontSize: 12,
                              fontFamily: 'iCielHelveticaNowText',
                              fontWeight: FontWeight.w700,
                              decoration: TextDecoration.none,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const Expanded(
                          child: Text(
                            "",
                            style: headerTitleStyle,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            (stock?.totalVal ?? 0).getPriceStock(),
                            style: const TextStyle(
                              color: Color(0xFF333333),
                              fontSize: 12,
                              fontFamily: 'iCielHelveticaNowText',
                              fontWeight: FontWeight.w700,
                              decoration: TextDecoration.none,
                            ),
                            textAlign: TextAlign.center,
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
                        controller.buyTapped();
                      },
                    ),
                  ),
                  SIZED_BOX_W16,
                  Expanded(
                    child: CustomButton.trailingStyleBgColor(
                      title: "Bán",
                      bgColor: const Color(0xFFF46666),
                      textStyle: context.textSize18light,
                      trailing: const Icon(
                        null,
                      ),
                      onPressed: () {
                        controller.sellTapped();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
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
