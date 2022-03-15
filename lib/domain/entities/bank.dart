class UserBank{
  final int? id;
  final String? userId;
  final String? bankId;
  final String? accountName;
  final String? accountNo;
  final Bank? bank;
  final String? createdAt;
  final String? updatedAt;

  UserBank({
    this.id,
    this.userId,
    this.bankId,
    this.accountName,
    this.accountNo,
    this.bank,
    this.createdAt,
    this.updatedAt,
  });
}

class Bank {
  final int id;
  final String? code;
  final String? name;
  final String? logo;
  final String? type;

  Bank(
      {required this.id, this.code, this.name, this.logo, this.type});

}
