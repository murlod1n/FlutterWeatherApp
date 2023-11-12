import 'package:json_annotation/json_annotation.dart';

part 'wind_dto.g.dart';

@JsonSerializable()
class WindDto {
  WindDto({
    this.speed
  });

  factory WindDto.fromJson(Map<String, dynamic> json) =>
      _$WindDtoFromJson(json);

  double? speed;
}