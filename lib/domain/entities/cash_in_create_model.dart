class CashInCreateModel {
  final String transactionId;
  final int amount;
  final int feeAmount;
  final List<PaymentMethodModel>? paymentMethod;


  int get totalAmount => amount + feeAmount;

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
