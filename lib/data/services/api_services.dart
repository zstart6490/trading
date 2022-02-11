import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:trading_project/configs/constants.dart';
import 'package:trading_project/data/entities/model.dart';
import 'dart:convert';

import 'package:trading_project/data/services/api.dart';

class ApiServices {
  final api = Api(backendUrl: "", fullToken: "");

  Future<List<ModelDTO>> fetchAllCases(DateTime from, DateTime to) async {
    var response = await api.getData(
        endPoint: "",
        params: {
          'startDate': DateFormat('yyyy-MM-dd').format(from),
          'endDate': DateFormat('yyyy-MM-dd').format(to)
        },
        timeOut: AppConstants.timeOut);

    return (response.data as List).map((i) => ModelDTO.fromApi(i)).toList();
  }
}
