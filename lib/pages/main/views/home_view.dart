import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_module/pages/main_controller.dart';

class MainView extends GetView<MainController> {


  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}
