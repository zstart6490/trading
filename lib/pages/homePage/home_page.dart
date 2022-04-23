import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_module/configs/constants.dart';
import 'package:trading_module/pages/homePage/controller/home_page_controller.dart';
import 'package:trading_module/pages/homePage/views/menu_option_view.dart';
import 'package:trading_module/routes/app_navigate.dart';
import 'package:trading_module/shared_widgets/CustomRefresher.dart';
import 'package:trading_module/shared_widgets/ListNoDataBackground.dart';
import 'package:trading_module/utils/extensions.dart';

class HomePageView extends GetView<HomePageController> {
  const HomePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(
        textScaleFactor: 1,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: Text(
            "Chứng khoán",
            style: TextStyle(
                fontSize: context.textSize18.fontSize, color: Colors.white),
          ),
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.white,
          leading: IconButton(
            icon: Image.asset(
              "assets/images/png/ic_back_white.png",
              package: "trading_module",
            ),
            onPressed: () => Get.back(),
          ),
          actions: <Widget>[
            IconButton(
              icon: Image.asset("assets/images/png/ic_trading_home_history.png",
                  package: "trading_module"),
              tooltip: 'Lịch sử',
              onPressed: () {
                navToHistoryStock();
              },
            ),
          ],
        ),
        body: Stack(
          children: <Widget>[
            Positioned(
              left: 0,
              right: 0,
              top: 0,
              child: ClipPath(
                clipper: CustomShape(),
                // this is my own class which extendsCustomClipper
                child: Container(
                  height: 250,
                  color: const Color(0xFF008E3F),
                ),
              ),
            ),
            SafeArea(
              child: CustomRefresher(
                controller: controller.refreshController,
                onRefresh: controller.onRefresh,
                child: controller.obx(
                  (property) => ListView.builder(
                    padding: const EdgeInsets.only(bottom: 16),
                    itemCount: controller.tabController.index == 0
                        ? property?.stockList?.length ?? 0
                        : property?.productWatchingVOList?.length ?? 0,
                    itemBuilder: (context, index) {
                      if ((controller.tabController.index == 0 &&
                              (property?.stockList?.length ?? 0) == 1) ||
                          (controller.tabController.index == 1 &&
                              (property?.productWatchingVOList?.length ?? 0) ==
                                  1)) {
                        return Column(
                          children: [
                            HeaderHomeView(
                              controller: controller,
                              accountInfo: property!,
                            ),
                            ListNoDataBackground(
                              pngPath:
                                  "assets/images/png/banner_empty_data.png",
                              desc: "Chưa có mã nào trong mục này",
                              padding: PAD_SYM_H40,
                              btnTitle: "Thêm mã",
                              onPressed: () {
                                controller.selectStock();
                              },
                            ),
                          ],
                        );
                      } else {
                        if (index == 0) {
                          return HeaderHomeView(
                            controller: controller,
                            accountInfo: property!,
                          );
                        }

                        return BoardItemCell(
                          item: controller.tabController.index == 0
                              ? (property?.stockList?[index])
                              : (property?.productWatchingVOList?[index]),

                          onPressed: () {
                            controller.tabController.index == 0
                                ? controller.stockDetail(property?.stockList?[index])
                                : controller.stockDetail(property?.productWatchingVOList?[index]);
                          },
                          controller: controller,
                        );
                      }
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

//   Widget _buildChild() {
//     return ListView.builder(
//         padding: const EdgeInsets.only(bottom: 16),
//         itemCount: controller.countItem,
//         itemBuilder: (context, index) {
//           if (index == 0) {
//             return HeaderHomeView(
//               controller: controller,
//             );
//           }
//           if (controller.countItem > 2) {
//             return BoardItemCell(
//               item: Model(gstId: "SSI", startTime: DateTime.now()),
//               onPressed: () {},
//             );
//           } else {
//             return ListNoDataBackground(
//                 pngPath: "assets/images/png/banner_empty_data.png",
//                 desc: "Chưa có mã nào trong mục này",
//                 padding: PAD_SYM_H40,
//                 btnTitle: "Thêm mã",
//                 onPressed: () {
//                   controller.selectStock();
//                 });
//           }
//         });
//   }
// }

}

class CustomShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final double height = size.height;
    final double width = size.width;
    final path = Path();
    path.lineTo(0, height - 50);
    path.quadraticBezierTo(width / 2, height, width, height - 50);
    path.lineTo(width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}
