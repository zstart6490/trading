import 'package:json_annotation/json_annotation.dart';
import 'package:trading_module/domain/entities/transaction_detail.dart';
import 'package:trading_module/utils/enums.dart';

part 'transaction_detail_dto.g.dart';

@JsonSerializable()
class TransactionDetailDto {
  final String id;
  final String? transactionCode;
  final int? requestAmount;
  final int? amount;
  final int? fee;
  final int? vat;
  final int? receiveAmount;
  final String? name;
  final String? bankName;
  final String? bankCode;
  final String? accountName;
  final String? accountNo;
  final String? transferType;
  final String? feeType;
  final String? content;
  final String? methodLabel;
  final String? fundsLabel;
  final String? pendingStatus;
  @JsonKey(unknownEnumValue: TransactionType.withdraw)
  final TransactionType type;
  @JsonKey(
      unknownEnumValue: TransactionMethod.none,
      defaultValue: TransactionMethod.bankTransfer)
  final TransactionMethod method;
  @JsonKey(
      unknownEnumValue: TransactionState.failed,
      defaultValue: TransactionState.progressing)
  final TransactionState status;
  final DateTime createDate;
  final bool? completed;
  final String? statusName;
  final String? typeName;

  TransactionDetailDto(
      {required this.id,
      this.transactionCode,
      this.requestAmount,
      this.amount,
      this.fee,
      this.vat,
      this.receiveAmount,
      this.name,
      this.bankName,
      this.bankCode,
      this.accountName,
      this.accountNo,
      required this.transferType,
      this.feeType,
      this.content,
      this.methodLabel,
      this.fundsLabel,
      this.pendingStatus,
      required this.type,
      required this.method,
      required this.status,
      required this.createDate,
      this.completed,
      this.statusName,
      this.typeName});

  factory TransactionDetailDto.fromJson(dynamic json) =>
      _$TransactionDetailDtoFromJson(json as Map<String, dynamic>);

  Map<String, dynamic> toJson() => _$TransactionDetailDtoToJson(this);
}

extension TransactionMapper on TransactionDetailDto {
  TransactionDetail toModel() {
    return TransactionDetail(
        id: id,
        transactionCode: transactionCode ?? "",
        requestAmount: requestAmount ?? 0,
        amount: amount ?? 0,
        fee: fee ?? 0,
        vat: vat ?? 0,
        receiveAmount: receiveAmount ?? 0,
        name: name ?? "",
        bankName: bankName ?? "",
        bankCode: bankCode ?? "",
        accountName: accountName ?? "",
        accountNo: accountNo ?? "",
        content: content ?? "",
        methodLabel: methodLabel ?? "",
        fundsLabel: fundsLabel ?? "",
        pendingStatus: pendingStatus ?? "",
        type: type,
        method: method,
        status: status,
        createDate: createDate,
        statusName: statusName ?? "",
        typeName: typeName ?? "");
  }
}
