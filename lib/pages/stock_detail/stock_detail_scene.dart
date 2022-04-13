import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_module/domain/entities/my_stock_model.dart';
import 'package:trading_module/pages/homePage/views/menu_option_view.dart';
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
      actions: <Widget>[
        IconButton(
          icon: Image.asset("assets/images/png/ic_info.png",
              package: "trading_module"),
          tooltip: 'Thông tin',
          onPressed: () {
            controller.infoTapped();
          },
        ),
      ],
      body: controller.obx(
        (stock) => Column(
          children: [
            Expanded(
              child: _buildChild(stock),
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
                      bgColor:const Color(0xFFF46666),
                      textStyle: context.textSize18light,
                      trailing:const Icon(
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

  Widget _buildChild(MyStockModel? stock) {
    return ListView.builder(
      itemCount: stock?.portfolioHistoryList?.length,
      itemBuilder: (context, index) {
        if (index == 0) {
          return HeaderStockDetailView(
            controller: controller,
            stock: stock,
          );
        }
        if (index > 0) {
          return MyStockItemCell(
            item: stock?.portfolioHistoryList?[index],
            controller: controller,
            onPressed: () {},
          );
        } else {
          return ListNoDataBackground(
              pngPath: "assets/images/png/banner_empty_data.png",
              desc: "Chưa có mã nào trong mục này".tr,
              padding: PAD_SYM_H40,
              btnTitle: "Thêm mã",
              onPressed: () {});
        }
      },
    );
  }
}

class HeaderStockDetailView<T extends StockDetailController>
    extends StatelessWidget {
  const HeaderStockDetailView(
      {Key? key, required this.controller, required this.stock})
      : super(key: key);
  final T controller;
  final MyStockModel? stock;

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
        Container(
          width: double.infinity,
          height: 340,
          margin: const EdgeInsets.fromLTRB(16, 0, 16, 8),
          child: ChartView(),
        ),
        SIZED_BOX_H12,
        const SpaceWithCustom(
          height: 8,
          bgColor: Color(0xFFF5F6FA),
        ),
        InvestInfoView(stock),
        SIZED_BOX_H08,
        Container(
            padding: const EdgeInsets.fromLTRB(12, 18, 12, 18),
            margin: const EdgeInsets.fromLTRB(16, 0, 16, 8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: const Color(0xFFF5F6FA)),
            child: Column(
              children: [
                Column(
                  children: [
                    const Center(
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
                        (stock?.quantity ?? 0).toCurrency(symbol: " CP"),
                        style: const TextStyle(
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
                      children: [
                        const Text(
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
                          (stock?.quantity ?? 0).toCurrency(symbol: ""),
                          style: const TextStyle(
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
                      children: [
                        const Text(
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
                          (stock?.quantityWaitingReturn ?? 0)
                              .toCurrency(symbol: ""),
                          style: const TextStyle(
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
                      children: [
                        const Text(
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
                          (stock?.dividendsWaitingReturn ?? 0)
                              .toCurrency(symbol: ""),
                          style: const TextStyle(
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
          padding: const EdgeInsets.fromLTRB(0, 18, 0, 18),
          margin: const EdgeInsets.fromLTRB(16, 0, 16, 8),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Expanded(
                  child: Text(
                    "Mã CP",
                    style: TextStyle(
                      color: Color(0xFF9AA0A5),
                      fontSize: 12,
                      fontFamily: 'iCielHelveticaNowText',
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.none,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  child: Text(
                    "Khối lượng",
                    style: TextStyle(
                      color: Color(0xFF9AA0A5),
                      fontSize: 12,
                      fontFamily: 'iCielHelveticaNowText',
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.none,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  child: Text(
                    "Giá mua",
                    style: TextStyle(
                      color: Color(0xFF9AA0A5),
                      fontSize: 12,
                      fontFamily: 'iCielHelveticaNowText',
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.none,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  child: Text(
                    "+/-",
                    style: TextStyle(
                      color: Color(0xFF9AA0A5),
                      fontSize: 12,
                      fontFamily: 'iCielHelveticaNowText',
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.none,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ]),
        ),
      ],
    );
  }
}

class MyStockItemCell<T extends StockDetailController> extends StatelessWidget {
  final PortfolioModel? item;
  final VoidCallback onPressed;
  final T controller;

  const MyStockItemCell(
      {Key? key,
      required this.item,
      required this.onPressed,
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Container(
        padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
        margin: const EdgeInsets.fromLTRB(16, 0, 16, 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: const Color(0xFFF5F6FA)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                item?.productKey ?? "",
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
            Expanded(
              child: Text(
                (item?.quantity ?? 0).toCurrency(symbol: ""),
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
            Expanded(
              child: Text(
                (item?.price ?? 0).toCurrency(symbol: ""),
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
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    item?.getPriceDifference(controller.priceStock.value) ?? "",
                    style: TextStyle(
                      color: item?.price.getStockColorWithCurrentPrice(
                          controller.priceStock.value),
                      fontSize: 12,
                      fontFamily: 'iCielHelveticaNowText',
                      fontWeight: FontWeight.w700,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  SIZED_BOX_H04,
                  Text(
                    item?.getPercentPrice(controller.priceStock.value) ?? "",
                    style: TextStyle(
                      color: item?.price.getStockColorWithCurrentPrice(
                          controller.priceStock.value),
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
    );
  }
}
