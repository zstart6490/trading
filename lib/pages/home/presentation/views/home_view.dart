import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.add),
          onPressed: () {
            Get.snackbar('title', 'message');
          },
        ),
        title: Text('covid'.tr),
        backgroundColor: Colors.white10,
        elevation: 0,
        centerTitle: true,
      ),
      body: const Center(
        child: Text("Home"),
      ),
    );
  }
}
