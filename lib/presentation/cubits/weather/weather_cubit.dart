import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import '../../../domain/usecases/get_current_weather_use_case.dart';
import '../../../utils/data_state.dart';
import '../../mappers/weather_ui_mapper.dart';
import '../../models/weather_ui.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this._getCurrentWeatherUseCase) : super(const WeatherStateLoading());

  final GetCurrentWeatherUseCase _getCurrentWeatherUseCase;


  Future<void> getWeather(String city) async {
      emit(const WeatherStateLoading());
      await Future.delayed(const Duration(seconds: 4));

      final weather = await _getCurrentWeatherUseCase.execute(city);
      if(weather is DataSuccess) {
        final iuWeather = WeatherUiMapper.fromDomain(weather.data!);
        emit(WeatherStateSuccess(weather: iuWeather));
      } else if (weather is DataFailed) {
        emit(WeatherStateFailed(error: weather.error));
      }
  }

}
