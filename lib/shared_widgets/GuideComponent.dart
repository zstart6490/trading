import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:tikop/routes/routes.dart';
// import 'package:tikop/theme/app_color.dart';
// import 'package:tikop/utils/util.dart';
import 'package:trading_module/routes/app_routes.dart';
import 'package:trading_module/theme/app_color.dart';
import 'package:trading_module/utils/util.dart';


class GuideComponent extends StatelessWidget {
  final String? desc1;
  final String? desc2;
  final String? phone;
  const GuideComponent({Key? key, this.phone, this.desc1, this.desc2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(AppRoutes.tdDepositTutorial);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        decoration: const BoxDecoration(
            color: Color(0xFFFFEFCF), borderRadius: BOR_RAD8),
        child: Padding(
          padding: PAD_ALL12,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset("assets/images/png/ic_hotline.png"),
              SIZED_BOX_W06,
              Expanded(
                child: Column(
                  children: [
                    if (desc1 != null && desc1!.isNotEmpty)
                      Text(
                        desc1!,
                        style: context.textSize12,
                      ),
                    Row(
                      children: [
                        Text(
                          'Xem hướng dẫn',
                          style: context.textSize14
                              .copyWith(color: COLOR_SEMANTIC_INFO),
                        ),
                        const Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: COLOR_SEMANTIC_INFO,
                          size: 14,
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
