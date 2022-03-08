import 'package:json_annotation/json_annotation.dart';
import 'package:trading_module/domain/entities/user_contract.dart';

part 'user_contract.g.dart';

@JsonSerializable()
class UserContractDTO {

  UserContractDTO(
      );

  static UserContractDTO fromResult(dynamic data) =>
      UserContractDTO.fromJson(data as Map<String, dynamic>);

  factory UserContractDTO.fromJson(dynamic json) =>
      _$UserContractDTOFromJson(json as Map<String,dynamic>);

  Map<String, dynamic> toJson() => _$UserContractDTOToJson(this);

}

extension UserContractDataMapper on UserContractDTO {
  UserContractModel toModel() {
    return UserContractModel(
    );
  }
}
