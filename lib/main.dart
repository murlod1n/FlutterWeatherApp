import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'config/app_router.dart';
import 'config/app_themes.dart';
import 'domain/usecases/get_current_weather_use_case.dart';
import 'domain/usecases/get_forecast_weather_use_case.dart';
import 'di/locator.dart';
import 'presentation/cubits/forecast/forecast_cubit.dart';
import 'presentation/cubits/weather/weather_cubit.dart';


Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => WeatherCubit(
            locator<GetCurrentWeatherUseCase>(),
          )..getWeather("Minsk")),
          BlocProvider(create: (context) => ForecastCubit(
            locator<GetForecastWeatherUseCase>(),
          )..getForecast("Minsk"))
        ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: AppTheme.light,
          routerConfig: appRouter.config(),
        )
    );
  }
}