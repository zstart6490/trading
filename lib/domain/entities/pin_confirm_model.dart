class PinConfirmModel {
  final String? state;
  final String? warningMsg;
  final String? userLocked;
  final int? lockCount;

  PinConfirmModel({
    required this.state,
    required this.warningMsg,
    required this.userLocked,
    required this.lockCount,
  });
}