import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:trading_module/utils/util.dart';


const HEIGHT_TITLE_BOTTOM_SHEET = 48.0;

class BaseBottomSheet extends StatelessWidget {
  const BaseBottomSheet(
      {Key? key,
      required this.height,
      required this.child,
      required this.title})
      : super(key: key);
  final double height;
  final Widget child;
  final String title;
  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(
        textScaleFactor: 1,
      ),
      child: Container(
        width: double.infinity,
        height: height,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8.0), topRight: Radius.circular(8.0)),
            color: Colors.white),
        child: Column(
          children: [
            SizedBox(
              height: HEIGHT_TITLE_BOTTOM_SHEET,
              child: Row(
                children: [
                  const SizedBox(
                    width: 48,
                  ),
                  Expanded(
                    child: AutoSizeText(
                      title,
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      style: context.textSize16,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                ],
              ),
            ),
            child
          ],
        ),
      ),
    );
  }
}
