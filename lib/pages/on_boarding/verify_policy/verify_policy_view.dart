import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_file/internet_file.dart';
import 'package:pdfx/pdfx.dart';
import 'package:trading_project/pages/on_boarding/intro/intro_controller.dart';
import 'package:trading_project/pages/on_boarding/verify_policy/verify_policy_binding.dart';
import 'package:trading_project/pages/on_boarding/verify_policy/verify_policy_controller.dart';
import 'package:trading_project/routes/app_pages.dart';
import 'package:trading_project/shared_widgets/BaseScaffold.dart';
import 'package:trading_project/shared_widgets/CustomAlertDialog.dart';
import 'package:trading_project/shared_widgets/CustomButton.dart';
import 'package:trading_project/theme/app_color.dart';
import 'package:trading_project/utils/enums.dart';
import 'package:trading_project/utils/extensions.dart';

class VerifyPolicyView extends GetView<VerifyPolicyController> {
  const VerifyPolicyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScaffoldAppBar<VerifyPolicyController>(
        showBackBtn: true,
        backgroundColor: Colors.white,
        title: "policy_title".tr,
        body: Column(
          children: [
            Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16, vertical: 30),
                  physics: const ClampingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: "img_verify_policy_logo"
                            .pngImage(mWidth: 125, mHeight: 125),
                      ),
                      const SizedBox(height: 32),
                      Text(
                        "verify_policy_title".tr,
                        style: const TextStyle(
                          color: COLOR_333333,
                          fontSize: 16,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'iCielHelveticaNowText',
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      InkWell(
                        onTap: () {
                        controller.openPdf(0);
                        },
                        child: Text(
                          'verify_policy_line_1'.tr,
                          style: const TextStyle(
                            fontSize: 16,
                            color: PRIMARY_COLOR_L,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w600,
                            decoration: TextDecoration.underline,
                            fontFamily: 'iCielHelveticaNowText',
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {
                          controller.openPdf(1);
                        },
                        child: Text(
                          'verify_policy_line_2'.tr,
                          style: const TextStyle(
                            fontSize: 16,
                            color: PRIMARY_COLOR_L,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w600,
                            decoration: TextDecoration.underline,
                            fontFamily: 'iCielHelveticaNowText',
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {
                          controller.openPdf(2);
                        },
                        child: Text(
                          'verify_policy_line_3'.tr,
                          style: const TextStyle(
                            fontSize: 16,
                            color: PRIMARY_COLOR_L,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w600,
                            decoration: TextDecoration.underline,
                            fontFamily: 'iCielHelveticaNowText',
                          ),
                        ),
                      )
                    ],
                  ),
                )),
            Container(
              margin: const EdgeInsets.only(
                  left: 16, right: 16, top: 16, bottom: 16),
              child: Column(
                children: [
                  CustomButton.defaultStyle(
                    title: "verify_policy".tr,
                    onPressed: () {
                      controller.acceptTerm();
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      "later".tr,
                      style: const TextStyle(
                        fontSize: 16,
                        color: PRIMARY_COLOR_L,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'iCielHelveticaNowText',
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
