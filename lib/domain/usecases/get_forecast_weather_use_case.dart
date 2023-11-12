import '../../utils/data_state.dart';
import '../models/forecast.dart';
import '../repositories/weather_repository.dart';

class GetForecastWeatherUseCase {
  GetForecastWeatherUseCase(this.repository);

  final WeatherRepository repository;

  Future<DataState<Forecast>> execute(String city) {
    return repository.getForecast(city);
  }

}