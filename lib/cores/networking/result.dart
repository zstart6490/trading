import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
part 'result.g.dart';

@JsonSerializable()
class Result {
  Result({
    this.success = false,
    this.error,
    this.message,
    this.data,
  });

  final bool success;
  final Errors? error;
  final dynamic data;
  final String? message;
  bool get hasError => error != null;

  factory Result.fromJson(String json) =>
      _$ResultFromJson(jsonDecode(json) as Map<String, dynamic>);
  Map<String, dynamic> toJson() => _$ResultToJson(this);

  factory Result.unknowError() =>
      Result(error: const Errors(-1, "Có lỗi xảy ra! Hãy thử lại"));
}

@JsonSerializable()
class Errors {
  final int code;
  final String message;
  // @JsonKey(name: "errors")
  // final dynamic errors;

  const Errors(this.code, this.message);
  factory Errors.nullValue() => const Errors(-1, "Success");
  factory Errors.serverError() => const Errors(500, "Server Error");

  factory Errors.fromJson(Map<String, dynamic> json) => _$ErrorsFromJson(json);
  Map<String, dynamic> toJson() => _$ErrorsToJson(this);
}
