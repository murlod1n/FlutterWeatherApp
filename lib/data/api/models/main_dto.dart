import 'dart:ffi';

import 'package:json_annotation/json_annotation.dart';

part 'main_dto.g.dart';

@JsonSerializable()
class MainDto {
  MainDto({
    this.temp,
    this.humidity,
    this.pressure
  });

  factory MainDto.fromJson(Map<String, dynamic> json) =>
      _$MainDtoFromJson(json);

  double? temp;
  int? humidity;
  int? pressure;
}