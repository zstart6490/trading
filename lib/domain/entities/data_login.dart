import 'package:trading_module/domain/entities/user_data.dart';

class DataLogin{
  final String? nextScreen;
  final String? token;
  final UserData? userData;
  final ConfigMap? configMap;
  final MsgMap? msgMap;


  DataLogin({this.nextScreen, this.token,  this.userData, this.configMap,
      this.msgMap});
}

class MsgMap {
  final String obIntroMsg;
  final String obKycRequestMsg;
  final String obTermMsg;
  final String obTermUsageMsg;
  final String obTermAccountMsg;
  final String obTermStockMsg;
  final String obKycIncompleteMsg;
  final String obOtpRequestMsg;
  MsgMap({
      required this.obIntroMsg,
      required this.obKycRequestMsg,
      required this.obTermMsg,
      required this.obTermUsageMsg,
      required this.obTermAccountMsg,
      required this.obTermStockMsg,
      required this.obKycIncompleteMsg,
      required this.obOtpRequestMsg});
}

class ConfigMap {
  final String obTermStockLink;
  final String obTermAccountLink;
  final String obTermUsageLink;


  ConfigMap(this.obTermStockLink, this.obTermAccountLink, this.obTermUsageLink);

}
