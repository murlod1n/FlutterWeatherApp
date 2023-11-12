// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForecastDto _$ForecastDtoFromJson(Map<String, dynamic> json) => ForecastDto(
      list: (json['list'] as List<dynamic>?)
          ?.map((e) => CurrentWeatherDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ForecastDtoToJson(ForecastDto instance) =>
    <String, dynamic>{
      'list': instance.list,
    };
