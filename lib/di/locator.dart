import "package:dio/dio.dart";
import "package:get_it/get_it.dart";

import '../data/api/services/api_service.dart';
import '../data/repositories/weather_repository_impl.dart';
import '../domain/repositories/weather_repository.dart';
import '../domain/usecases/get_current_weather_use_case.dart';
import '../domain/usecases/get_forecast_weather_use_case.dart';


final locator = GetIt.instance;

Future<void> initializeDependencies() async {

  final dio = Dio();

  locator.registerSingleton<Dio>(dio);
  
  locator.registerSingleton<ApiService>(ApiService(locator<Dio>()));
  
  locator.registerSingleton<WeatherRepository>(WeatherRepositoryImpl(locator<ApiService>()));

  locator.registerSingleton<GetCurrentWeatherUseCase>(GetCurrentWeatherUseCase(locator<WeatherRepository>()));
  locator.registerSingleton<GetForecastWeatherUseCase>(GetForecastWeatherUseCase(locator<WeatherRepository>()));


}