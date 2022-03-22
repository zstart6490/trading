import 'package:json_annotation/json_annotation.dart';
//import 'package:tikop/models/Bank.dart';
part 'VirtualAccount.g.dart';

@JsonSerializable()
class VirtualAccount {
  VirtualAccount(
    this.id,
    this.userName,
    //this.bank,
    this.accountNo,
    this.accountName,
    this.accountAddress,
    this.createdAt,
  );

  final int id;
  @JsonKey(name: "uname")
  final String userName;
  //final OurBank bank;
  @JsonKey(name: "account_no")
  final String accountNo;
  @JsonKey(name: "account_name")
  final String accountName;
  @JsonKey(name: "account_address")
  final String accountAddress;
  @JsonKey(name: "created_at")
  final DateTime? createdAt;

  static List<VirtualAccount> fromList(dynamic map) {
    final List list = map as List;

    return list
        .map((e) => VirtualAccount.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  factory VirtualAccount.fromJson(Map<String, dynamic> json) =>
      _$VirtualAccountFromJson(json);
  Map<String, dynamic> toJson() => _$VirtualAccountToJson(this);
}
