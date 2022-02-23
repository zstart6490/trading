import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/on_boarding_controller.dart';

class OnBoardingPage extends GetView<OnBoardingController> {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = controller.state;
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Get.back();
              })),
      body: Column(children: [
        Container(
          margin: const EdgeInsets.all(16),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              'https://blog.shaharia.com/wp-content/uploads/Forex-Trading-in-Bangladesh.jpeg',
              height: 120,
              width: Get.width,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(16),
          alignment: Alignment.center,
          width: Get.width,
          height: 300,
          decoration:
              BoxDecoration(border: Border.all(color: Colors.blueAccent)),
          child: Text("Giới thiệu sản phẩm"),
        ),
         Container(
          child: TextButton(
            style: TextButton.styleFrom(
              primary: Colors.white,
              backgroundColor: Colors.blue,
              minimumSize: const Size(150, 36),
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
              ),
            ),
            onPressed: () {},
            child: Text('Đăng ký ngay'),
          ),
        )
      ]),
    );
  }
}
