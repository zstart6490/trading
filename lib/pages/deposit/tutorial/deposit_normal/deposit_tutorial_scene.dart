import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tikop/shared_widgets/CustomButton.dart';
import 'package:tikop/utils/util.dart';

import 'deposit_tutorial_controller.dart';

class DepositeTutorialScene extends GetView<DepositeTutorialController> {
  const DepositeTutorialScene({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(
        textScaleFactor: 1,
      ),
      child: Scaffold(
        body: Stack(children: [
          Column(
            children: [
              Container(
                height: context.screenSize.height * 5 / 8 +
                    context.viewPadding.top -
                    context.viewPadding.bottom,
                decoration: const BoxDecoration(
                    color: Color(0xFFC2F0D9),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(16.0),
                        bottomRight: Radius.circular(16.0))),
                child: PageView(
                  controller: controller.pageController,
                  onPageChanged: (page) => controller.onPageChanged(page),
                  children: List.generate(
                      controller.imgList.length,
                      (index) => _StepPage(
                            imgPath: controller.imgList[index],
                          )),
                ),
              ),
              SIZED_BOX_H16,
              SmoothPageIndicator(
                count: controller.imgList.length,
                controller: controller.pageController,
                effect: WormEffect(
                  activeDotColor: context.primaryColor,
                  dotColor: const Color(0xFF66D095),
                  dotWidth: 8,
                  dotHeight: 8,
                ),
              ),
              Expanded(
                child: Obx(
                  () => Padding(
                      padding: EdgeInsets.fromLTRB(
                          16.0, 0.0, 16.0, 16.0 + context.viewPadding.bottom),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Bước ${controller.currentPage.value + 1}",
                            style: context.textSize16
                                .copyWith(fontWeight: FontWeight.w500),
                          ),
                          Text(
                            controller.descs[controller.currentPage.value],
                            textAlign: TextAlign.center,
                            style: context.textSize14
                                .copyWith(color: context.disabledColor),
                          ),
                          if (controller.currentPage.value == 2)
                            SizedBox(
                              width: 160,
                              height: 44,
                              child: CustomButton(
                                  title: "Đã hiểu",
                                  textStyle: context.textSize16.copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                  onPressed: () => controller.onNext()),
                            )
                          else
                            TextButton(
                                onPressed: () => controller.onNext(),
                                child: Text(
                                  "Tiếp tục",
                                  style: context.textSize16.copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: context.primaryColor),
                                )),
                        ],
                      )),
                ),
              ),
            ],
          ),
          Positioned(
              top: 16.0 + context.viewPadding.top,
              left: 16.0,
              child: InkWell(
                onTap: () => controller.skip(),
                child: SvgPicture.asset(
                  "assets/images/svg/ic_close.svg",
                  width: 24,
                  height: 24,
                ),
              ))
        ]),
      ),
    );
  }
}

class _StepPage extends StatelessWidget {
  final String imgPath;
  const _StepPage({Key? key, required this.imgPath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Padding(
        padding: EdgeInsets.only(
            top: context.viewPadding.top,
            left: constraints.maxHeight < 440.0 ? 16.0 : 0.0,
            right: constraints.maxHeight < 440.0 ? 16.0 : 0.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.asset(imgPath, fit: BoxFit.contain),
          ],
        ),
      ),
    );
  }
}
