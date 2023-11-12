import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../cubits/forecast/forecast_cubit.dart';
import '../../cubits/weather/weather_cubit.dart';
import '../../models/forecast_ui.dart';
import '../../models/weather_ui.dart';
import 'circle_loading_indicator.dart';
import 'error_indicator.dart';

class TodayTab extends StatefulWidget {
  const TodayTab({super.key});

  @override
  State<StatefulWidget> createState() => _TodayTabState();
}

class _TodayTabState extends State<TodayTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (_, state) {
          switch (state.runtimeType) {
            case WeatherStateSuccess:
              return _weatherSuccess(state.weather!);
            case WeatherStateLoading:
              return CircleLoadingIndicator();
            case WeatherStateFailed:
              return ErrorIndicator();
            default:
              return Container();
          }
        },
      ),
    );
  }

  Widget _weatherSuccess(WeatherUi weather) {
    return SingleChildScrollView(
      child: SizedBox(
        height: MediaQuery.of(context).size.height - 170,
        child: Container(
          padding: const EdgeInsets.only(top: 20.0),
          child: Column(
            children: <Widget>[
              Column(children: [
                weather.icon != null
                    ? const Image(
                        height: 200.0,
                        width: 200.0,
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            "https://www.iconsdb.com/icons/preview/white/clouds-2-xxl.png"))
                    : SizedBox(
                        width: 200.0,
                        height: 200.0,
                        child: Image.asset('assets/images/error.png')),
                weather.weatherTitle != null
                    ? Text(
                        weather.weatherTitle!.toUpperCase(),
                        style:
                            const TextStyle(color: Colors.grey, fontSize: 22),
                      )
                    : const Text(
                        "Oops, Data is not available",
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                weather.temp != null
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("\u{00B0}",
                              style: TextStyle(
                                  color: Colors.transparent,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 72)),
                          Text(weather.temp!.round().toString() + "\u{00B0}",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 72))
                        ],
                      )
                    : const Text(
                        "Oops, Data is not available",
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
              ]),
              Expanded(
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            weather.wind != null
                                ? Text(
                                    "Wind : ${weather.wind!} km/h",
                                    style: const TextStyle(
                                        color: Colors.grey, fontSize: 16),
                                  )
                                : const Text(
                                    "Oops, Data is not available",
                                    style: const TextStyle(
                                        color: Colors.grey, fontSize: 14),
                                  ),
                            weather.clouds != null
                                ? Text(
                                    "Cloudy : ${weather.clouds!} %",
                                    style: const TextStyle(
                                        color: Colors.grey, fontSize: 16),
                                  )
                                : const Text(
                                    "Oops, Data is not available",
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 14),
                                  )
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            weather.pressure != null
                                ? Text(
                                    "Pressure : ${weather.pressure!} mb",
                                    style: const TextStyle(
                                        color: Colors.grey, fontSize: 16),
                                  )
                                : const Text(
                                    "Oops, Data is not available",
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 14),
                                  ),
                            weather.clouds != null
                                ? Text(
                                    "Humidity : ${weather.humidity!} %",
                                    style: const TextStyle(
                                        color: Colors.grey, fontSize: 16),
                                  )
                                : const Text(
                                    "Oops, Data is not available",
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 14),
                                  )
                          ],
                        ),
                      ),
                      Container(height: 30),
                      BlocBuilder<ForecastCubit, ForecastState>(
                        builder: (_, state) {
                          switch (state.runtimeType) {
                            case ForecastStateSuccess:
                              return _forecastSuccess(state.forecast!);
                            case ForecastStateLoading:
                              return const Center(child: Text("loading"));
                            case ForecastStateFailed:
                              return ErrorIndicator();
                            default:
                              return Container();
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _forecastSuccess(ForecastUi forecast) {
    return (forecast.forecast != null
        ? Container(
            padding: const EdgeInsets.only(left: 16.0, bottom: 16.0),
            height: 190,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (context, index) {
                return Container(
                    decoration: const BoxDecoration(
                        color: Colors.white12,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    padding: const EdgeInsets.only(left: 16),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image(
                              height: 100.0,
                              width: 100.0,
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  "https://openweathermap.org/img/wn/${forecast.forecast![index].icon.toString()}@2x.png")),
                          Text(
                            DateFormat("H:mm").format(
                                DateFormat('yyyy-MM-dd HH:mm:ss')
                                    .parse(forecast.forecast![index].date!)),
                            style: const TextStyle(
                                color: Colors.grey, fontSize: 16),
                          ),
                          Text(
                            "${forecast.forecast![index].temp!.round().toString()}\u{00B0}",
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 28),
                          )
                        ]));
              },
              separatorBuilder: (context, index) => const SizedBox(
                width: 10,
              ),
            ),
          )
        : ErrorIndicator());
  }
}
