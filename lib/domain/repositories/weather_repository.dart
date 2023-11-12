import '../../utils/data_state.dart';
import '../models/forecast.dart';
import '../models/weather.dart';

abstract class WeatherRepository {
  Future<DataState<Weather>> getWeather(String city);

  Future<DataState<Forecast>> getForecast(String city);
}
