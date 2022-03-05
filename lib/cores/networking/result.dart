import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'result.g.dart';

@JsonSerializable()
class Result {
  Result({
    required this.success,
    required this.code,
    required this.msg,
    this.data,
  });

  final bool success;
  final int code;
  final dynamic data;
  final String msg;
  bool get hasError => !success;

  Errors get error => Errors(code, msg);

  factory Result.fromJson(String json) =>
      _$ResultFromJson(jsonDecode(json) as Map<String, dynamic>);


  factory Result.unknowError() =>
      Result(code: -1,success: false,msg: "Có lỗi xảy ra! Hãy thử lại");
}


class Errors {
  final int code;
  final String message;
  // @JsonKey(name: "errors")
  // final dynamic errors;

  const Errors(this.code, this.message);
  factory Errors.nullValue() => const Errors(-1, "Success");
  factory Errors.serverError() => const Errors(500, "Server Error");

  // factory Errors.fromJson(Map<String, dynamic> json) => _$ErrorsFromJson(json);
  // Map<String, dynamic> toJson() => _$ErrorsToJson(this);
}