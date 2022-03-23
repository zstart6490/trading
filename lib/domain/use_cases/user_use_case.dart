import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:trading_module/cores/resources/data_state.dart';
import 'package:trading_module/domain/entities/user_contract.dart';
import 'package:trading_module/domain/repos/user_repos.dart';
import 'package:http/http.dart' as http;

class UserUseCase {
  final UserRepo _userRepo;

  UserUseCase(this._userRepo);

  Future<DataState<UserContractModel>> getContractUser(String? url_contract) async {
    var url = await http.get(Uri.parse("http://104.199.179.48:8501/v1/user/contract"));

    var dir = await getTemporaryDirectory();
    File file = new File(dir.path + "/contract.pdf");

    await file.writeAsBytes(url.bodyBytes, flush: true);

    var result = await _userRepo.getContractUser(url: file.path);
    return result;
  }

}
