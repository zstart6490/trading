import 'package:trading_project/data/entities/model.dart';
import 'package:trading_project/cores/networking/result.dart';

class HttpResponseCustom<T>{
  late T _data;
  late Result _response;

  T get data => _data;

  HttpResponseCustom(List<ModelDTO> list, Result response);

  Result get response => _response;
}