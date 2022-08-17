// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'devices_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DevicesDto _$DevicesDtoFromJson(Map<String, dynamic> json) => DevicesDto(
      json['created_at'] as String?,
      json['id'] as int?,
      json['mac_address'] as String?,
      json['name_device'] as String?,
    );

Map<String, dynamic> _$DevicesDtoToJson(DevicesDto instance) =>
    <String, dynamic>{
      'created_at': instance.createAt,
      'id': instance.id,
      'mac_address': instance.macAddress,
      'name_device': instance.nameDevice,
    };
