class CashInConfirmModel {
  final String? id;
  final int? requestAmount;
  final List<BankCashInModel>? banks;
  final String transferCode;

  CashInConfirmModel({
    this.id,
    this.requestAmount,
    this.banks,
    required this.transferCode,
  });
}

class BankCashInModel{
  final String? id;
  final String? name;
  final String code;
  final String imageUrl;
  final String? branchName;
  final String? accountNo;
  final String? accountName;
  final bool? va;

  BankCashInModel({
    this.id,
    this.name,
    required this.code,
    required this.imageUrl,
    this.branchName,
    this.accountNo,
    this.accountName,
    this.va,
  });
}