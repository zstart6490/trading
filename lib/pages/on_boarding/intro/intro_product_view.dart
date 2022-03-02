import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:trading_module/pages/on_boarding/intro/intro_controller.dart';
import 'package:trading_module/routes/app_pages.dart';
import 'package:trading_module/shared_widgets/BaseScaffold.dart';
import 'package:trading_module/shared_widgets/CustomButton.dart';
import 'package:trading_module/theme/app_color.dart';
import 'package:trading_module/utils/extensions.dart';

class IntroProductView extends GetView<IntroController> {
  const IntroProductView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScaffoldAppBar<IntroController>(
        backgroundColor: Colors.white,
        title: "intro_product".tr,
        body: Column(
          children: [
            Expanded(
                child: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: controller.obx(
                  (data) => Column(
                        children: [
                          "img_intro_1".pngImage(),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 20),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Text(
                                  //   data?.obIntroMsg??"",
                                  //   style: const TextStyle(fontSize: 14),
                                  // ),
                                  Html(
                                    data: data?.obIntroMsg,
                                    style: {
                                      "body": Style(
                                          fontSize: FontSize.medium,
                                          color: COLOR_858585),
                                    },
                                  )
                                ]),
                          )
                        ],
                      ),
                  onLoading: const Center(child: CircularProgressIndicator()),
                  onError: (error) => Text(error ?? "Load Content Error!"),
                  onEmpty: const Text("Data Empty")),
            )),
            Container(
              margin: const EdgeInsets.only(
                  left: 16, right: 16, top: 16, bottom: 16),
              child: CustomButton.defaultStyle(
                title: "register_now".tr,
                onPressed: () {
                  controller.toAcceptTerm();
                },
              ),
            )
          ],
        ));
  }
}
