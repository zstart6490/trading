import 'package:get/get.dart';
import 'package:trading_project/pages/home/bindings/home_binding.dart';
import 'package:trading_project/pages/home/views/home_view.dart';
part 'app_routes.dart';

// ignore: avoid_classes_with_only_static_members
class AppPages {
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
        name: Routes.HOME,
        page: () => const HomeView(),
        binding: HomeBinding(),
       ),
  ];
}
