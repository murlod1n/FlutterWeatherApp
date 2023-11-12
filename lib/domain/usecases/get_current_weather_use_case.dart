import '../../utils/data_state.dart';
import '../models/weather.dart';
import '../repositories/weather_repository.dart';

class GetCurrentWeatherUseCase {
  GetCurrentWeatherUseCase(this.repository);

  final WeatherRepository repository;

  Future<DataState<Weather>> execute(String city) {
    return repository.getWeather(city);
  }

}