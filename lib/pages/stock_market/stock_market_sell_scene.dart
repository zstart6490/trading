import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_module/pages/stock_market/stock_market_cell.dart';
import 'package:trading_module/pages/stock_market/stock_market_sell_controller.dart';
import 'package:trading_module/shared_widgets/BaseScaffold.dart';

class StockMarketSellPage extends GetView<StockMarketSellController> {
  const StockMarketSellPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScaffoldAppBar<StockMarketSellController>(
        backgroundColor: Colors.white,
        title: "stock_market_sell_title".tr,
        body: Container(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: const Color(0xFFF5F6FA),
                  ),
                  child: const TextField(
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                      isCollapsed: true,
                      border: InputBorder.none,
                      hintText: "Tìm kiếm mã cổ phiếu",
                      hintStyle: TextStyle(fontSize: 12 , fontFamily: 'iCielHelveticaNowText', color: Color(0xFF858585)),
                      prefixIcon: Icon(Icons.search
                      , color: Color(0xFFADADAD),),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: CustomScrollView(slivers: <Widget>[
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return StockMarketCell();
                      },
                      childCount: 6,
                    ),
                  ),
                ]),
              ),
            ],
          ),
        )
    );
  }
}
