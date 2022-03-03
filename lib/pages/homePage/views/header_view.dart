import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_module/configs/constants.dart';
import 'package:trading_module/pages/homePage/controller/home_page_controller.dart';
import 'package:trading_module/utils/extensions.dart';



class HeaderView extends GetView<HomePageController> {
  const HeaderView({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Container(
      margin:  const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
      padding: const EdgeInsets.fromLTRB(15, 24, 15, 24),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        image: DecorationImage(
          image: AssetImage("assets/images/png/bg_home_header.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _MoneyView(title: 'total_property'.tr, value: 888688888, titleStype: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontFamily: 'iCielHelveticaNowText',
            fontWeight: FontWeight.w700,
            decoration: TextDecoration.none,
          ), valueStyle: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontFamily: 'iCielHelveticaNowText',
            fontWeight: FontWeight.w500,
            decoration: TextDecoration.none,
          )),
          SIZED_BOX_H16,
          Row(
            children: [
              _MoneyView(title: 'total_benefit'.tr, value: 100155000000, titleStype: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontFamily: 'iCielHelveticaNowText',
                fontWeight: FontWeight.w500,
                decoration: TextDecoration.none,
              ), valueStyle: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontFamily: 'iCielHelveticaNowText',
                fontWeight: FontWeight.w500,
                decoration: TextDecoration.none,
              )),
              SIZED_BOX_W40,
              _MoneyView(title:'stock_value'.tr, value: 1000000000, titleStype: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontFamily: 'iCielHelveticaNowText',
                fontWeight: FontWeight.w500,
                decoration: TextDecoration.none,
              ), valueStyle: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontFamily: 'iCielHelveticaNowText',
                fontWeight: FontWeight.w500,
                decoration: TextDecoration.none,
              )),
            ],
          ),
        ],
      ),
    );
  }
}



class _MoneyView extends StatelessWidget {
  const _MoneyView({
    Key? key,
    required this.title,
    required this.value,
    required this.titleStype,
    required this.valueStyle,
    this.visble = true,
  }) : super(key: key);
  final String title;
  final int value;
  final TextStyle titleStype;
  final TextStyle valueStyle;
  final bool visble;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: titleStype,
        ),
        SIZED_BOX_H02,
        Text(
          visble ? value.toCurrency() : "********đ",
          style: valueStyle,
        ),
      ],
    );
  }
}
