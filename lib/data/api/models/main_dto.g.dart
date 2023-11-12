// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MainDto _$MainDtoFromJson(Map<String, dynamic> json) => MainDto(
      temp: (json['temp'] as num?)?.toDouble(),
      humidity: json['humidity'] as int?,
      pressure: json['pressure'] as int?,
    );

Map<String, dynamic> _$MainDtoToJson(MainDto instance) => <String, dynamic>{
      'temp': instance.temp,
      'humidity': instance.humidity,
      'pressure': instance.pressure,
    };
