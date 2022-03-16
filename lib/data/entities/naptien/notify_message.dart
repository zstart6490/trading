


import 'package:trading_module/data/entities/naptien/data_message.dart';
import 'package:trading_module/utils/enums.dart';

class NotifyMessage {
  String description;
  String type;
  String id;
  String body;
  String title;
  DataMessage data;

  NotifyMessage({
    this.description = '',
    this.type = '',
    this.id = '',
    this.body = '',
    this.title = '',
    required this.data,
  });

  NotificationType get notifyAction => _getAction();
  NotificationType _getAction() {
    switch (type) {
      case "account_register":
        return NotificationType.account_register;
      case "account_verified_ok":
        return NotificationType.account_verified_ok;
      case "account_verified_email_ok":
        return NotificationType.account_verified_email_ok;
      case "transaction_deposit":
        return NotificationType.transaction_deposit;
      case "transaction_withdraw":
        return NotificationType.transaction_withdraw;
      case "transaction_deposit_pause":
        return NotificationType.transaction_deposit_pause;
      case "promotion":
        return NotificationType.promotion;
      case "transaction_recommend":
        return NotificationType.transaction_recommend;
      case "social_connect":
        return NotificationType.social_connect;
      case "account_not_verified":
        return NotificationType.account_not_verified;
      case "transaction_saving_deposit_pause":
        return NotificationType.transaction_saving_deposit_pause;
      case "transaction_saving_withdraw":
        return NotificationType.transaction_saving_withdraw;
      case "transaction_saving_deposit":
        return NotificationType.transaction_saving_deposit;
      case 'user_profile':
        return NotificationType.user_profile;
      case 'transaction_referral':
        return NotificationType.transaction_referral;
      case "system_notification":
        return NotificationType.system_notification;
      case "share_puzzle_piece":
        return NotificationType.share_puzzle_piece;
      default:
        return NotificationType.system_notification;
    }
  }

  factory NotifyMessage.fromJson(Map<String, dynamic> map) {
    return NotifyMessage(
      description: map['description'] as String,
      type: map['type'] as String,
      id: map['id'] as String,
      body: map['body'] as String,
      title: map['title'] as String,
      data: DataMessage.fromJson(map['data'] as String),
    );
  }
}
