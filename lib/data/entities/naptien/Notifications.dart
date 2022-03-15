import 'package:json_annotation/json_annotation.dart';
import 'package:trading_module/utils/enums.dart';
import 'package:trading_module/utils/util.dart';

part 'Notifications.g.dart';

@JsonSerializable()
class NotificationData {
  final List<NotificationInfo> notifications;
  @JsonKey(name: "total_not_read")
  final int totalNotRead;
  @JsonKey(name: "meta_data")
  final MetaData? metaData;

  static NotificationData fromResult(dynamic map) =>
      NotificationData.fromJson(map as Map<String, dynamic>);
  NotificationData(this.notifications, {this.totalNotRead = 0, this.metaData});
  factory NotificationData.fromJson(Map<String, dynamic> json) =>
      _$NotificationDataFromJson(json);
  Map<String, dynamic> toJson() => _$NotificationDataToJson(this);
}

@JsonSerializable()
class NotificationInfo {
  @JsonKey(name: "id")
  final dynamic idDynamic;
  final String? type;
  final String? title;
  final String? description;
  @JsonKey(name: "is_read")
  dynamic isReadDynamic;
  @JsonKey(name: "created_at")
  final String? createAt;
  @JsonKey(name: "updated_at")
  final String? updateAt;
  final DataID? data;
  @JsonKey(name: "content")
  final dynamic contentDynamic;

  NotificationInfo({
    this.idDynamic,
    this.type,
    this.title,
    this.description,
    this.isReadDynamic,
    this.createAt,
    this.updateAt,
    this.data,
    this.contentDynamic,
  });

  String get id => "$idDynamic";
  bool get isRead =>
      isReadDynamic != "0" && isReadDynamic != 0 && isReadDynamic != false;
  void read() {
    isReadDynamic = true;
  }

  DateTime get createDate => createAt!.toDateFormat(DateFormater.UTC);
  NotificationType get notificationType => _getType();
  factory NotificationInfo.fromJson(Map<String, dynamic> json) =>
      _$NotificationInfoFromJson(json);
  Map<String, dynamic> toJson() => _$NotificationInfoToJson(this);
  static NotificationInfo fromResult(dynamic data) =>
      NotificationInfo.fromJson(data['notification'] as Map<String, dynamic>);

  NotificationType _getType() {
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
      case "system_notification":
        return NotificationType.system_notification;
      case "user_profile":
        return NotificationType.user_profile;
      case "renew_contract":
        return NotificationType.renew_contract;
      default:
        return NotificationType.type_default;
    }
  }
}

@JsonSerializable()
class MetaData {
  MetaData(
    this.currentPage,
    this.lastPage,
    this.perPage,
    this.total,
  );

  @JsonKey(name: "current_page")
  final int currentPage;
  @JsonKey(name: "last_page")
  final int lastPage;
  @JsonKey(name: "per_page")
  final String perPage;
  final int total;

  factory MetaData.fromJson(Map<String, dynamic> json) =>
      _$MetaDataFromJson(json);
  Map<String, dynamic> toJson() => _$MetaDataToJson(this);
}

@JsonSerializable()
class DataID {
  @JsonKey(name: "id")
  final dynamic idDynamic;
  DataID(this.idDynamic);
  String get id => "$idDynamic";
  factory DataID.fromJson(Map<String, dynamic> json) => _$DataIDFromJson(json);
  Map<String, dynamic> toJson() => _$DataIDToJson(this);
}
