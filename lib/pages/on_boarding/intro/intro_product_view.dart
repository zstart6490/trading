import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_project/pages/on_boarding/intro/intro_controller.dart';
import 'package:trading_project/routes/app_pages.dart';
import 'package:trading_project/shared_widgets/BaseScaffold.dart';
import 'package:trading_project/shared_widgets/CustomButton.dart';
import 'package:trading_project/theme/app_color.dart';
import 'package:trading_project/utils/extensions.dart';

class IntroProductView extends GetView<IntroController> {
  const IntroProductView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScaffoldAppBar<IntroController>(
        showBackBtn: true,
        backgroundColor: Colors.white,
        title: "verify_account".tr,
        body: Column(
          children: [
            Expanded(
                child: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: Column(
                children: [
                  "img_intro_1".pngImage(),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 20),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "title_intro_1".tr,
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                              fontSize: 16,
                              color: COLOR_333333,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'iCielHelveticaNowText',
                            ),
                          ),
                          Text("text_intro_1".tr,
                              style: const TextStyle(
                                fontSize: 14,
                                color: COLOR_858585,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'iCielHelveticaNowText',
                              )),
                          const SizedBox(
                            height: 16,
                          ),
                          Text("title_intro_2".tr,
                              style: const TextStyle(
                                fontSize: 16,
                                color: COLOR_333333,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'iCielHelveticaNowText',
                              )),
                          const SizedBox(
                            height: 8,
                          ),
                          Text("text_intro_2".tr,
                              style: const TextStyle(
                                fontSize: 14,
                                color: COLOR_858585,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'iCielHelveticaNowText',
                              )),
                        ]),
                  )
                ],
              ),
            )),
            Container(
              margin: const EdgeInsets.only(
                  left: 16, right: 16, top: 16, bottom: 16),
              child: CustomButton.defaultStyle(
                title: "register_now".tr,
                onPressed: () {
                  Get.toNamed(Routes.BOARDING_VERIFY_POLICY);
                },
              ),
            )
          ],
        ));
  }
}
