import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WidgetUtils {
  static Offset getOffsetWidget(GlobalKey globalKey) {
    final RenderBox? renderBox =
        globalKey.currentContext?.findRenderObject() as RenderBox?;
    return renderBox?.localToGlobal(Offset.zero) ?? Offset.zero;
  }

  static double getHeightWidget(GlobalKey globalKey) {
    final RenderBox? renderBox =
        globalKey.currentContext?.findRenderObject() as RenderBox?;
    return renderBox?.size.height ?? 0;
  }

  static double getSpacingWidgetToBottom(GlobalKey globalKey) {
    final renderBox =
        globalKey.currentContext!.findRenderObject()! as RenderBox;
    final double heightWidget = renderBox.size.height;
    final double heightScreen = Get.height;
    final Offset offset = renderBox.localToGlobal(Offset.zero);
    return heightScreen - (offset.dy + heightWidget);
  }
}
