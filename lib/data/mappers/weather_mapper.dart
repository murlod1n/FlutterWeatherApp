import '../api/models/current_weather_dto.dart';
import '../../domain/models/weather.dart';

class WeatherMapper {
  static Weather fromApi(CurrentWeatherDto weather) {
    return Weather(
      temp: weather.main?.temp,
      wind: weather.wind?.speed,
      humidity: weather.main?.humidity,
      clouds: weather.clouds?.all,
      icon: weather.weather?[0].icon,
      weatherTitle: weather.weather?[0].main,
      cityName: weather.name,
      pressure: weather.main?.pressure
    );
  }
}