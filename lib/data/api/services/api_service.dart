import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../../utils/constants.dart';
import '../models/current_weather_dto.dart';
import '../models/forecast_dto.dart';

part 'api_service.g.dart';

class Apis {
  static const String current = '/data/2.5/weather';
  static const String forecast = '/data/2.5/forecast';
}

@RestApi(baseUrl: BASE_URL)
abstract class ApiService {
  factory ApiService(Dio dio) = _ApiService;

  @GET(Apis.current)
  Future<HttpResponse<CurrentWeatherDto>> getWeather(@Query("q") String city,
      @Query("units") String units, @Query("appid") String apiKey);

  @GET(Apis.forecast)
  Future<HttpResponse<ForecastDto>> getForecast(@Query("q") String city,
      @Query("units") String units, @Query("appid") String apiKey);
}
