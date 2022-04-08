import 'package:json_annotation/json_annotation.dart';
import 'package:trading_module/data/entities/stock_transaction_detail_dto.dart';
import 'package:trading_module/domain/entities/list_order_transaction.dart';
import 'package:trading_module/domain/entities/stock_transaction_history.dart';

part 'list_order_transaction_dto.g.dart';

@JsonSerializable()
class ListOrderTransactionDto{
  final List<OrderRecordDto>? records;

  ListOrderTransactionDto(this.records);

  factory ListOrderTransactionDto.fromJson(dynamic json) => _$ListOrderTransactionDtoFromJson(json as Map<String, dynamic>);

  Map<String, dynamic> toJson() => _$ListOrderTransactionDtoToJson(this);
}

@JsonSerializable()
class OrderRecordDto{
  final String? key;
  final List<StockTransactionDetailDto>? data;

  OrderRecordDto(this.key, this.data);

  factory OrderRecordDto.fromJson(dynamic json) => _$OrderRecordDtoFromJson(json as Map<String, dynamic>);

}
extension OrderRecordMapper on OrderRecordDto{
  OrderRecord toModel(){
    List<StockTransactionHistory> listData =[];
    if(data!=null){
      for(StockTransactionDetailDto item in data!){
        listData.add(item.toHistoryModel());
      }
    }
    return OrderRecord(key: key??"", data: listData);
  }
}

extension ListOrderTransactionMapper on ListOrderTransactionDto{
  ListOrderTransaction toModel(){
    final List<OrderRecord> listData =[];
    if(records!=null){
      for(final OrderRecordDto item in records!){
        listData.add(item.toModel());
      }
    }
    return ListOrderTransaction(records: listData);
  }
}