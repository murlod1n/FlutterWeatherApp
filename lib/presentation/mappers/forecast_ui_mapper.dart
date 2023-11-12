import '../../domain/models/forecast.dart';
import '../models/forecast_ui.dart';
import '../models/weather_ui.dart';

class ForecastUiMapper {
  static ForecastUi fromDomain(Forecast forecast) {
    return ForecastUi(
        forecast: forecast.list
            ?.map((e) => WeatherUi(
                temp: e.temp,
                wind: e.wind,
                humidity: e.humidity,
                clouds: e.clouds,
                icon: e.icon,
                weatherTitle: e.weatherTitle,
                date: e.date))
            .toList());
  }
}
