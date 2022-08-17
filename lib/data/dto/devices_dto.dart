import 'package:json_annotation/json_annotation.dart';

import '../../domain/model/devices_model.dart';
part 'devices_dto.g.dart';

@JsonSerializable()
class DevicesDto extends DevicesModel {

  @JsonKey(name: "created_at")
  @override
  String? createAt;

  @override
  int? id;

  @JsonKey(name: "mac_address")
  @override
  String? macAddress;

  @JsonKey(name: "name_device")
  @override
  String? nameDevice;

  DevicesDto(this.createAt, this.id, this.macAddress, this.nameDevice);

  factory DevicesDto.fromJson(Map<String, dynamic> json) =>
      _$DevicesDtoFromJson(json);

  Map<String, dynamic> toJson() => _$DevicesDtoToJson(this);


}
