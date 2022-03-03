import 'package:get/get.dart';
import 'package:trading_project/pages/contract/views/contract_scene.dart';
import 'package:trading_project/pages/home/bindings/home_binding.dart';
import 'package:trading_project/pages/home/views/home_view.dart';
import 'package:trading_project/pages/market/views/market_view.dart';

import '../pages/contract/bindings/contract_binding.dart';
part 'app_routes.dart';

// ignore: avoid_classes_with_only_static_members
class AppPages {
  static const INITIAL = Routes.CONTRACT;

  static final routes = [
    GetPage(
        name: Routes.CONTRACT,
        page: () => ContractPage(),
        binding: ContractBinding(),
       ),
  ];
}
