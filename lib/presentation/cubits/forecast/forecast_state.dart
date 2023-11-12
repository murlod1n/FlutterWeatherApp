part of 'forecast_cubit.dart';

@immutable
abstract class ForecastState {
  final ForecastUi? forecast;
  final DioException? error;

  const ForecastState({this.forecast, this.error});

  @override
  List<Object?> get props => [forecast, error];
}

class ForecastStateLoading extends ForecastState {
  const ForecastStateLoading();
}

class ForecastStateSuccess extends ForecastState {
  const ForecastStateSuccess({required super.forecast});
}

class ForecastStateFailed extends ForecastState {
  const ForecastStateFailed({super.error});
}