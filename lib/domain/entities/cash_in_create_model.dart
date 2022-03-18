class CashInCreateModel {
  final String transactionId;
  final int amount;
  final int feeAmount;


  int get totalAmount => amount + feeAmount;

  CashInCreateModel({
    required this.transactionId,
    required this.amount,
    required this.feeAmount,
  });

}
