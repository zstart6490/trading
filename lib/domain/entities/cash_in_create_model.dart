class CashInCreateModel {
  final String transactionId;
  final double amount;
  final double feeAmount;
  final List<PaymentMethodModel>? paymentMethod;


  double get totalAmount => amount + feeAmount;

  CashInCreateModel({
    required this.transactionId,
    required this.amount,
    required this.feeAmount,
    this.paymentMethod
  });
}

class PaymentMethodModel {
  final String? title;
  final String? note;
  final String? introduce;
  final String? key;

  PaymentMethodModel({
    this.title,
    this.note,
    this.introduce,
    this.key,
  });
}
