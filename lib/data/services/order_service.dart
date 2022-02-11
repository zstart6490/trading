import 'package:intl/intl.dart';
import 'package:trading_project/configs/constants.dart';
import 'package:trading_project/cores/api_services.dart';
import 'package:trading_project/cores/networking/http_response.dart';
import 'package:trading_project/data/entities/model.dart';

abstract class OrderService extends ApiServices {
  OrderService(String fullToken) : super(fullToken);

  Future<HttpResponseCustom<List<ModelDTO>>> fetchAllOrder(
      DateTime from, DateTime to);
}

class OrderServiceImpl extends OrderService {
  OrderServiceImpl(String fullToken) : super(fullToken);

  @override
  Future<HttpResponseCustom<List<ModelDTO>>> fetchAllOrder(
      DateTime from, DateTime to) async {
    var response = await api.getData(
        endPoint: "",
        params: {
          'startDate': DateFormat('yyyy-MM-dd').format(from),
          'endDate': DateFormat('yyyy-MM-dd').format(to)
        },
        timeOut: AppConstants.TIME_OUT);
    var data = (response.data as List).map((i) => ModelDTO.fromApi(i)).toList();
    return HttpResponseCustom(data, response);
  }
}
