import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_module/pages/homePage/views/menu_option_view.dart';
import 'package:trading_module/pages/stock_detail/Views/chart_view.dart';
import 'package:trading_module/pages/stock_more_detail/tabs/overview/stock_overview_controller.dart';
import 'package:trading_module/shared_widgets/ListNoDataBackground.dart';
import 'package:trading_module/utils/util.dart';

class StockOverviewScene extends StatelessWidget {
  const StockOverviewScene({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final StockOverviewController controller = Get.find();
    const headerTitleStyle = TextStyle(
        fontFamily: 'iCielHelveticaNowText',
        color: Color(0xFF858585),
        fontSize: 12,
        fontWeight: FontWeight.w400);
    return controller.obx((stock) {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: stock?.fullLink.loadCacheImg(mWidth: 43, mHeight: 43),
                ),
                SIZED_BOX_W10,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        stock?.stockName ?? "",
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
                            (stock?.lastPrice ?? 0).toCurrency(symbol: ""),
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
                        (stock?.bidVol1 ?? 0).getVolumeStock(),
                        style: TextStyle(
                          color: (stock?.bidPrice1 ?? 0).getStockColorWith(
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
                        (stock?.bidVol2 ?? 0).getVolumeStock(),
                        style: TextStyle(
                          color: (stock?.bidPrice2 ?? 0).getStockColorWith(
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
                        (stock?.bidVol3 ?? 0).getVolumeStock(),
                        style: TextStyle(
                          color: (stock?.bidPrice3 ?? 0).getStockColorWith(
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
                        (stock?.bidPrice1 ?? 0).getPriceStock(),
                        style: TextStyle(
                          color: (stock?.bidPrice1 ?? 0).getStockColorWith(
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
                          color: (stock?.bidPrice2 ?? 0).getStockColorWith(
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
                          color: (stock?.bidPrice3 ?? 0).getStockColorWith(
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
                        (stock?.askPrice1 ?? 0).getPriceStock(),
                        style: TextStyle(
                          color: (stock?.askPrice1 ?? 0).getStockColorWith(
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
                          color: (stock?.askPrice2 ?? 0).getStockColorWith(
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
                          color: (stock?.askPrice3 ?? 0).getStockColorWith(
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
                        (stock?.askVol1 ?? 0).getVolumeStock(),
                        style: TextStyle(
                          color: (stock?.askPrice1 ?? 0).getStockColorWith(
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
                        (stock?.askVol2 ?? 0).getVolumeStock(),
                        style: TextStyle(
                          color: (stock?.askPrice2 ?? 0).getStockColorWith(
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
                        (stock?.askVol3 ?? 0).getVolumeStock(),
                        style: TextStyle(
                          color: (stock?.askPrice3 ?? 0).getStockColorWith(
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
              color: const Color(0xFFF5F6FA),
            ),
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
                      color:(stock?.avg ?? 0).getStockColorWith(
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
                    (stock?.totalVol ?? 0).getVolumeStock(),
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
            ));
  }
}
