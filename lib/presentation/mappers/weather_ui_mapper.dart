import '../../domain/models/weather.dart';
import '../models/weather_ui.dart';

class WeatherUiMapper {
  static WeatherUi fromDomain(Weather weather) {
    return WeatherUi(
        temp: weather.temp,
      wind: weather.wind,
      humidity: weather.humidity,
      clouds: weather.clouds,
      icon: weather.icon,
      weatherTitle: weather.weatherTitle,
      cityName: weather.cityName,
      pressure: weather.pressure
    );
  }
}