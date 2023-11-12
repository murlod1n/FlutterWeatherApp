part of 'weather_cubit.dart';


abstract class WeatherState extends Equatable {
  final WeatherUi? weather;
  final DioException? error;

  const WeatherState({this.weather, this.error});

  @override
  List<Object?> get props => [weather, error];
}

class WeatherStateLoading extends WeatherState {
  const WeatherStateLoading();
}

class WeatherStateSuccess extends WeatherState {
  const WeatherStateSuccess({required super.weather});
}

class WeatherStateFailed extends WeatherState {
  const WeatherStateFailed({super.error});
}
