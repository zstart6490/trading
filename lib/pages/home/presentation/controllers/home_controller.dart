import 'package:get/get.dart';
import 'package:trading_mobile/pages/home/domain/entity/cases_model.dart';

import '../../domain/adapters/repository_adapter.dart';

class HomeController extends GetxController with StateMixin<CasesModel>{
  HomeController({required this.homeRepository});

  final IHomeRepository homeRepository;

  @override
  void onInit() {
    super.onInit();

    //Loading, Success, Error handle with 1 line of code
  }
}
