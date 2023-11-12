import '../../domain/models/forecast.dart';
import '../../domain/models/weather.dart';
import '../api/models/forecast_dto.dart';

class ForecastMapper {
  static Forecast fromApi(ForecastDto forecast) {
    return Forecast(
        list: forecast.list
            ?.map((e) => Weather(
                temp: e.main?.temp,
                wind: e.wind?.speed,
                humidity: e.main?.humidity,
                clouds: e.clouds?.all,
                icon: e.weather?[0].icon,
                weatherTitle: e.weather?[0].main,
                cityName: e.name,
                date: e.dt_txt
          )
        )
            .toList());
  }
}
