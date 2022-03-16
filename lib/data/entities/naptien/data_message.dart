import 'dart:convert';

class DataMessage {
  final dynamic idDynamic;

  String get id => idDynamic.toString();
  const DataMessage({this.idDynamic = ''});
  factory DataMessage.fromJson(String data) {
    final Map<String, dynamic> json = jsonDecode(data) as Map<String, dynamic>;
    return DataMessage(
      idDynamic: json['id'],
    );
  }
}
