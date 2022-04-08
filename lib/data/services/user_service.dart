import 'package:trading_module/configs/constants.dart';
import 'package:trading_module/cores/api_services.dart';
import 'package:trading_module/cores/networking/decoder.dart';
import 'package:trading_module/data/entities/product_own_dto.dart';
import 'package:trading_module/data/entities/user_contract.dart';

abstract class UserService extends ApiServices {
  UserService() : super();

  Future<BaseDecoder<UserContractDTO>> getUserContract();
  Future<BaseDecoder<List<ProductOwnDto>>> getListProductOwn();
}

class UserServiceImpl extends UserService {
  UserServiceImpl() : super();

  @override
  Future<BaseDecoder<UserContractDTO>> getUserContract() async {
    return  BaseDecoder(await api.getData(
        endPoint: "/user/v1/contract",
        params: {
        },
        timeOut: AppConstants.TIME_OUT),
    decoder: UserContractDTO.fromJson);
  }

  @override
  Future<BaseDecoder<List<ProductOwnDto>>> getListProductOwn() async{
    return  BaseDecoder(await api.getData(
        endPoint: "/account/v1/stock/list",
        params: {
        },
        timeOut: AppConstants.TIME_OUT),
    decoder: ProductOwnDto.getList);
  }
}
