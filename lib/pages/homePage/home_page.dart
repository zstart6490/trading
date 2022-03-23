import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_module/domain/entities/model.dart';
import 'package:trading_module/pages/homePage/controller/home_page_controller.dart';
import 'package:trading_module/pages/homePage/views/menu_option_view.dart';
import 'package:trading_module/shared_widgets/CustomRefresher.dart';
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
            "Tài sản",
            style: TextStyle(
                fontSize: context.textSize18.fontSize, color: Colors.white),
          ),
          automaticallyImplyLeading: true,
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.white,
          leading: IconButton(
            icon: Image.asset("assets/images/png/ic_back_white.png",
                package: "trading_module"),
            onPressed: () => Get.back(),
          ),
          actions: <Widget>[
            IconButton(
              icon: Image.asset("assets/images/png/ic_trading_home_history.png",
                  package: "trading_module"),
              tooltip: 'Lịch sử',
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('This is a snackbar')));
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
                child: ListView.builder(
                    itemCount: 8,
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return HeaderHomeView(
                          controller: controller,
                        );
                      }
                      return BoardItemCell(
                        item: Model(gstId: "SSI", startTime: DateTime.now()),
                        onPressed: () {},
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomShape extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    double height = size.height;
    double width = size.width;
    var path = Path();
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
