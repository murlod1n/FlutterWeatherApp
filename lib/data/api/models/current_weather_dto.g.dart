// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_weather_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrentWeatherDto _$CurrentWeatherDtoFromJson(Map<String, dynamic> json) =>
    CurrentWeatherDto(
      main: json['main'] == null
          ? null
          : MainDto.fromJson(json['main'] as Map<String, dynamic>),
      weather: (json['weather'] as List<dynamic>?)
          ?.map((e) => WeatherDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      wind: json['wind'] == null
          ? null
          : WindDto.fromJson(json['wind'] as Map<String, dynamic>),
      clouds: json['clouds'] == null
          ? null
          : CloudsDto.fromJson(json['clouds'] as Map<String, dynamic>),
      name: json['name'] as String?,
      dt_txt: json['dt_txt'] as String?,
    );

Map<String, dynamic> _$CurrentWeatherDtoToJson(CurrentWeatherDto instance) =>
    <String, dynamic>{
      'main': instance.main,
      'weather': instance.weather,
      'wind': instance.wind,
      'clouds': instance.clouds,
      'name': instance.name,
      'dt_txt': instance.dt_txt,
    };
