import 'package:json_annotation/json_annotation.dart';

part 'clouds_dto.g.dart';

@JsonSerializable()
class CloudsDto {

  CloudsDto({
    this.all,
  });

  factory CloudsDto.fromJson(Map<String, dynamic> json) =>
      _$CloudsDtoFromJson(json);

  int? all;

}