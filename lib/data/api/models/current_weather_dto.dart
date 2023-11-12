import 'package:json_annotation/json_annotation.dart';
import 'clouds_dto.dart';
import 'main_dto.dart';
import 'weather_dto.dart';
import 'wind_dto.dart';

part 'current_weather_dto.g.dart';


@JsonSerializable()
class CurrentWeatherDto {
  CurrentWeatherDto({
    this.main,
    this.weather,
    this.wind,
    this.clouds,
    this.name,
    this.dt_txt
  });

  factory CurrentWeatherDto.fromJson(Map<String, dynamic> json) =>
      _$CurrentWeatherDtoFromJson(json);

  MainDto? main;
  List<WeatherDto>? weather;
  WindDto? wind;
  CloudsDto? clouds;
  String? name;
  String? dt_txt;

}

