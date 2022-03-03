import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_module/configs/constants.dart';
import 'package:trading_module/domain/entities/model.dart';
import 'package:trading_module/pages/homePage/controller/home_page_controller.dart';
import 'package:trading_module/pages/homePage/views/header_view.dart';
import 'package:trading_module/utils/extensions.dart';


class HeaderHomeView<T extends HomePageController> extends StatelessWidget {
  const HeaderHomeView({Key? key, required this.controller}) : super(key: key);
  final T controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        SIZED_BOX_H72,
        const HeaderView(),
        SIZED_BOX_H16,
        const MenuOptionView(),
        SIZED_BOX_H16,
        const SpaceWithCustom(
          height: 8,
          bgColor: Color(0xFFF5F6FA),
        ),
        SIZED_BOX_H06,
        InvestMenuView(controller: controller),
        SIZED_BOX_H06,
        HeaderBoardView(
          controller: controller,
        ),
        //SIZED_BOX_H06,
      ],
    );
  }
}

class BoardItemCell extends StatelessWidget {
  final Model item;
  final VoidCallback onPressed;

  const BoardItemCell({
    required this.item,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 18, 12, 18),
      margin: const EdgeInsets.fromLTRB(16, 0, 16, 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: const Color(0xFFF5F6FA)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            item.gstId,
            style: const TextStyle(
              color: Color(0xFF333333),
              fontSize: 12,
              fontFamily: 'iCielHelveticaNowText',
              fontWeight: FontWeight.w700,
              decoration: TextDecoration.none,
            ),
          ),
          Text(
            item.gstId,
            style: const TextStyle(
              color: Color(0xFF333333),
              fontSize: 12,
              fontFamily: 'iCielHelveticaNowText',
              fontWeight: FontWeight.w700,
              decoration: TextDecoration.none,
            ),
          ),
          Text(
            item.gstId,
            style: const TextStyle(
              color: Color(0xFF00B14F),
              fontSize: 12,
              fontFamily: 'iCielHelveticaNowText',
              fontWeight: FontWeight.w700,
              decoration: TextDecoration.none,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                item.gstId,
                style: const TextStyle(
                  color: Color(0xFFF46666),
                  fontSize: 12,
                  fontFamily: 'iCielHelveticaNowText',
                  fontWeight: FontWeight.w700,
                  decoration: TextDecoration.none,
                ),
              ),
              SIZED_BOX_H04,
              Text(
                item.gstId,
                style: const TextStyle(
                  color: Color(0xFFF46666),
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
    );
  }
}

class HeaderBoardView<T extends HomePageController> extends StatelessWidget {
  const HeaderBoardView({Key? key, required this.controller}) : super(key: key);
  final T controller;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50.0,
        padding: const EdgeInsets.all(5.0),
        margin: MAR_SIDE_16,
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            HeaderBoardItem(
                title: "Mã CP".tr,
                imgUp: Image.asset("assets/images/png/ic_arrow_up.png"),
                imgDown: Image.asset(
                    "assets/images/png/ic_arrow_down_selected.png")),
            HeaderBoardItem(
                title: "Khối lượng".tr,
                imgUp: Image.asset("assets/images/png/ic_arrow_up.png"),
                imgDown: Image.asset(
                    "assets/images/png/ic_arrow_down_selected.png")),
            HeaderBoardItem(
                title: "Giá khớp".tr,
                imgUp: Image.asset("assets/images/png/ic_arrow_up.png"),
                imgDown: Image.asset(
                    "assets/images/png/ic_arrow_down_selected.png")),
            HeaderBoardItem(
                title: "+/-".tr,
                imgUp: Image.asset("assets/images/png/ic_arrow_up.png"),
                imgDown:
                    Image.asset("assets/images/png/ic_arrow_down_selected.png"))
          ],
        ));
  }
}

class HeaderBoardItem extends StatelessWidget {
  const HeaderBoardItem({
    required this.title,
    required this.imgUp,
    required this.imgDown,
    Key? key,
  }) : super(key: key);
  final String title;
  final Image imgUp;
  final Image imgDown;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 12,
              fontFamily: 'iCielHelveticaNowText',
              fontWeight: FontWeight.w400,
              decoration: TextDecoration.none,
            )),
        SIZED_BOX_W06,
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [imgUp, imgDown],
        ),
      ],
    );
  }
}

class InvestMenuView<T extends HomePageController> extends StatelessWidget {
  const InvestMenuView({Key? key, required this.controller}) : super(key: key);
  final T controller;

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}

class MenuOptionView extends StatelessWidget {
  const MenuOptionView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          ButtonWithIconAndText(
              title: 'top_up'.tr,
              icon: Image.asset("assets/images/png/ic_top_up.png"),
              onPressed: () {}),
          ButtonWithIconAndText(
              title: 'cash_drawing'.tr,
              icon: Image.asset("assets/images/png/ic_cash_drawing.png"),
              onPressed: () {}),
          ButtonWithIconAndText(
              title: 'buy'.tr,
              icon: Image.asset("assets/images/png/ic_buy.png"),
              onPressed: () {}),
          ButtonWithIconAndText(
              title: 'sell'.tr,
              icon: Image.asset("assets/images/png/ic_sell.png"),
              onPressed: () {}),
        ],
      ),
    );
  }
}

class SpaceWithCustom extends StatelessWidget {
  const SpaceWithCustom({
    required this.height,
    required this.bgColor,
    Key? key,
  }) : super(key: key);
  final double height;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return Container(height: height, color: bgColor);
  }
}

class ButtonWithIconAndText extends StatelessWidget {
  const ButtonWithIconAndText({
    required this.title,
    required this.icon,
    this.toolTip,
    required this.onPressed,
    Key? key,
  }) : super(key: key);
  final VoidCallback onPressed;
  final String title;
  final Image icon;
  final String? toolTip;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        IconButton(
          icon: icon,
          iconSize: 48,
          color: Colors.brown,
          tooltip: toolTip,
          onPressed: () => onPressed(),
        ),
        Text(
          title,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 12,
            fontFamily: 'iCielHelveticaNowText',
            fontWeight: FontWeight.w400,
            decoration: TextDecoration.none,
          ),
        )
      ],
    );
  }
}