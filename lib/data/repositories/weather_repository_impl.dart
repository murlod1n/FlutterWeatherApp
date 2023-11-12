import '../../domain/models/forecast.dart';
import '../../domain/models/weather.dart';
import '../../domain/repositories/weather_repository.dart';
import '../../utils/constants.dart';
import '../../utils/data_state.dart';
import '../api/api_util.dart';
import '../api/models/current_weather_dto.dart';
import '../api/models/forecast_dto.dart';
import '../api/services/api_service.dart';
import '../mappers/forecast_mapper.dart';
import '../mappers/weather_mapper.dart';

class WeatherRepositoryImpl extends ApiUtil implements WeatherRepository {
  final ApiService _apiService;

  WeatherRepositoryImpl(this._apiService);

  @override
  Future<DataState<Weather>> getWeather(
      String city) {
    return getDataFromApi<Weather, CurrentWeatherDto>(
      request: () => _apiService.getWeather(city, "metric", API_KEY),
      mapper: (CurrentWeatherDto currentWeatherDto) => WeatherMapper.fromApi(currentWeatherDto) ,
    );
  }

  @override
  Future<DataState<Forecast>> getForecast(String city) {
    return getDataFromApi<Forecast, ForecastDto>(
      request: () => _apiService.getForecast(city, "metric", API_KEY),
      mapper: (ForecastDto forecastDto) => ForecastMapper.fromApi(forecastDto) ,
    );
  }
}
