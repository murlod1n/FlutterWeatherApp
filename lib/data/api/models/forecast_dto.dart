import 'package:json_annotation/json_annotation.dart';
import 'current_weather_dto.dart';

part 'forecast_dto.g.dart';

@JsonSerializable()
class ForecastDto {
  ForecastDto({
    this.list
  });

  factory ForecastDto.fromJson(Map<String, dynamic> json) =>
      _$ForecastDtoFromJson(json);

    List<CurrentWeatherDto>? list;

}