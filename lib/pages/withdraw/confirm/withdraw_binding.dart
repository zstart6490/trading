import 'package:get/get.dart';
import 'package:trading_module/data/repos/otp_repo_impl.dart';
import 'package:trading_module/data/repos/withdraw_repos_impl.dart';
import 'package:trading_module/data/services/otp_services.dart';
import 'package:trading_module/data/services/withdraw_service.dart';
import 'package:trading_module/domain/entities/info_withdraw.dart';
import 'package:trading_module/domain/use_cases/otp_usecase.dart';
import 'package:trading_module/domain/use_cases/withdraw_usecase.dart';
import 'package:trading_module/pages/withdraw/confirm/withdraw_controller.dart';


class WithdrawBinding extends Bindings {
  @override
  void dependencies() {
    final arg = Get.arguments;
    if (arg is InfoWithdraw) {
      Get.lazyPut(() =>  WithdrawUseCase(WithdrawRepoImpl(WithdrawServiceImpl())));
      Get.lazyPut<OtpUseCase>(() => OtpUseCase(OtpRepoImpl(OtpServiceImpl())));
      Get.lazyPut(() => WithdrawController(arg));
    }
  }
}
