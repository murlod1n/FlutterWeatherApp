import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import '../../../domain/usecases/get_forecast_weather_use_case.dart';
import '../../../utils/data_state.dart';
import '../../mappers/forecast_ui_mapper.dart';
import '../../models/forecast_ui.dart';

part 'forecast_state.dart';

class ForecastCubit extends Cubit<ForecastState> {
  ForecastCubit(this._getForecastWeatherUseCase) : super(const ForecastStateLoading());

  final GetForecastWeatherUseCase _getForecastWeatherUseCase;

  Future <void> getForecast(String city) async {
    emit(const ForecastStateLoading());
    final forecast = await _getForecastWeatherUseCase.execute(city);
    if(forecast is DataSuccess) {
      final uiForecast = ForecastUiMapper.fromDomain(forecast.data!);
      emit(ForecastStateSuccess(forecast: uiForecast));
    } else if (forecast is DataFailed) {
      emit(ForecastStateFailed(error: forecast.error!));
    }
  }


}
