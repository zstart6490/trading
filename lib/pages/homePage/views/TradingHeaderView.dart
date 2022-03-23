import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_module/configs/constants.dart';
import 'package:trading_module/pages/homePage/controller/home_page_controller.dart';

class TradingHeaderView <T extends HomePageController> extends StatelessWidget {
  const TradingHeaderView({
    Key? key, required this.controller
  }) : super(key: key);
  final T controller;


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
          padding: const EdgeInsets.fromLTRB(15, 24, 15, 24),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              children: [
                const Image(
                  width: 40,
                  height: 40,
                  image: AssetImage("assets/images/png/ic_property.png",
                      package: "trading_module"),
                ),
                SIZED_BOX_W06,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Tổng tài sản",
                      style: TextStyle(
                        color: Color(0xFF333333),
                        fontSize: 14,
                        fontFamily: 'iCielHelveticaNowText',
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    SIZED_BOX_H02,
                    Text(
                      "888.888.888đ",
                      style: TextStyle(
                        color: Color(0xFF333333),
                        fontSize: 20,
                        fontFamily: 'iCielHelveticaNowText',
                        fontWeight: FontWeight.w700,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SIZED_BOX_H16,
            Row(
              children: const [
                Expanded(
                    child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Giá trị cổ  ',
                        style: TextStyle(
                          color: Color(0xFF333333),
                          fontSize: 14,
                          fontFamily: 'iCielHelveticaNowText',
                          fontWeight: FontWeight.w700,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      WidgetSpan(
                        child: Image(
                          width: 16,
                          height: 16,
                          image: AssetImage(
                              "assets/images/png/ic_property_up.png",
                              package: "trading_module"),
                        ),
                      ),
                    ],
                  ),
                )),
                Text(
                  "1.000.000.000đ",
                  style: TextStyle(
                    color: Color(0xFF333333),
                    fontSize: 14,
                    fontFamily: 'iCielHelveticaNowText',
                    fontWeight: FontWeight.w700,
                    decoration: TextDecoration.none,
                  ),
                ),
              ],
            ),
            SIZED_BOX_H08,
            Row(
              children: const [
                Expanded(
                  child: Text(
                    "   Tăng trưởng ",
                    style: TextStyle(
                      color: Color(0xFF858585),
                      fontSize: 12,
                      fontFamily: 'iCielHelveticaNowText',
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),
                Text(
                  "200.000.000đ (+20%)",
                  style: TextStyle(
                    color: Color(0xFF00B14F),
                    fontSize: 12,
                    fontFamily: 'iCielHelveticaNowText',
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.none,
                  ),
                ),
              ],
            ),
            SIZED_BOX_H16,
            Row(
              children: const [
                Expanded(
                  child: Text(
                    "Tiền mặt",
                    style: TextStyle(
                      color: Color(0xFF333333),
                      fontSize: 14,
                      fontFamily: 'iCielHelveticaNowText',
                      fontWeight: FontWeight.w700,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),
                Text(
                  "100.000.000đ",
                  style: TextStyle(
                    color: Color(0xFF333333),
                    fontSize: 14,
                    fontFamily: 'iCielHelveticaNowText',
                    fontWeight: FontWeight.w700,
                    decoration: TextDecoration.none,
                  ),
                ),
              ],
            ),
            SIZED_BOX_H08,
            Row(
              children: const [
                Expanded(
                  child: Text(
                    "  Chờ về",
                    style: TextStyle(
                      color: Color(0xFF858585),
                      fontSize: 12,
                      fontFamily: 'iCielHelveticaNowText',
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),
                Text(
                  "50.000.000đ",
                  style: TextStyle(
                    color: Color(0xFFFF9500),
                    fontSize: 12,
                    fontFamily: 'iCielHelveticaNowText',
                    fontWeight: FontWeight.w400,
                    decoration: TextDecoration.none,
                  ),
                ),
              ],
            ),
            SIZED_BOX_H08,
            Row(
              children: const [
                Expanded(
                  child: Text(
                    "  Phải trả",
                    style: TextStyle(
                      color: Color(0xFF858585),
                      fontSize: 12,
                      fontFamily: 'iCielHelveticaNowText',
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),
                Text(
                  "50.000đ",
                  style: TextStyle(
                    color: Color(0xFFF46666),
                    fontSize: 12,
                    fontFamily: 'iCielHelveticaNowText',
                    fontWeight: FontWeight.w400,
                    decoration: TextDecoration.none,
                  ),
                ),
              ],
            ),
          ]),
        ),
        const Positioned(
          right: 0,
          bottom: 10,
          child: Image(
            image: AssetImage("assets/images/png/bg_trading_home_property.png",
                package: "trading_module"),
          ),
        ),
      ],
    );
  }
}
