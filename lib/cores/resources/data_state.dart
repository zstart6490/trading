

abstract class DataState<T> {
  final T? data;
  final int? code;
  final String? msg;

  DataState({this.data, this.code, this.msg});
}

class DataSuccess<T> extends DataState<T> {
  DataSuccess(T? data) : super(data: data);
}

class DataFailed<T> extends DataState<T> {
   DataFailed(int? code, String? msg) : super(code: code, msg: msg);
}
