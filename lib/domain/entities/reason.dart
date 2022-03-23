class Reason {
  final int id;
  final String reason;
  String? note;

  Reason({
    required this.id,
    required this.reason,
  });

  factory Reason.other() {
    return Reason(id: -1, reason: "Lý do khác");
  }
}
