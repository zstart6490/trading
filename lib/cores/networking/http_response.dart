import 'package:trading_project/cores/networking/result.dart';

class HttpResponseCustom<T> {
  final T _data;
  final Result _response;

  T get data => _data;

  HttpResponseCustom(this._data, this._response);

  Result get response => _response;
}
