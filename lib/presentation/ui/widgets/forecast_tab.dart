import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../cubits/forecast/forecast_cubit.dart';
import '../../models/forecast_ui.dart';
import 'circle_loading_indicator.dart';
import 'error_indicator.dart';

class ForecastTab extends StatefulWidget {
  const ForecastTab({super.key});

  @override
  State<StatefulWidget> createState() => _ForecastTabState();
}

class _ForecastTabState extends State<ForecastTab> {
  @override
  Widget build(BuildContext context) {
    return Container(child: BlocBuilder<ForecastCubit, ForecastState>(
      builder: (_, state) {
        switch (state.runtimeType) {
          case ForecastStateSuccess:
            return _forecastSuccess(state.forecast!);
          case ForecastStateLoading:
            return CircleLoadingIndicator();
          case ForecastStateFailed:
            return ErrorIndicator();
          default:
            return Container();
        }
      },
    ));
  }

  Widget _forecastSuccess(ForecastUi forecast) {
    return (forecast.forecast != null
        ? Container(
            padding: const EdgeInsets.only(left: 16.0),
            height: 190,
            child: ListView.builder(
                itemCount: forecast.forecast!.length - 6,
                itemBuilder: (context, index) {
                  return (((index + 4) % 8) == 0)
                      ? Container(
                          padding: const EdgeInsets.only(bottom: 26.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        DateFormat("EEEE, MMM dd").format(
                                            DateFormat('yyyy-MM-dd HH:mm:ss')
                                                .parse(forecast
                                                    .forecast![index].date!)),
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 22),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              Container(
                                height: 190,
                                padding: const EdgeInsets.only(top: 10.0),
                                child: ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 8,
                                  itemBuilder: (context, cardIndex) {
                                    return Container(
                                        decoration: const BoxDecoration(
                                            color: Colors.white12,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20))),
                                        padding:
                                            const EdgeInsets.only(left: 16),
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Image(
                                                  height: 100.0,
                                                  width: 100.0,
                                                  fit: BoxFit.cover,
                                                  image: NetworkImage(
                                                      "https://openweathermap.org/img/wn/${forecast.forecast![(index + cardIndex) -1].icon.toString()}@2x.png")),
                                              Text(
                                                DateFormat("H:mm").format(
                                                    DateFormat(
                                                            'yyyy-MM-dd HH:mm:ss')
                                                        .parse(forecast
                                                            .forecast![(index + cardIndex) - 1]
                                                            .date!)),
                                                style: const TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 16),
                                              ),
                                              Text(
                                                "${forecast.forecast![(index + cardIndex) - 1].temp!.round().toString()}\u{00B0}",
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 28),
                                              )
                                            ]));
                                  },
                                  separatorBuilder: (context, index) =>
                                      const SizedBox(
                                    width: 10,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      : Container();
                }))
        : ErrorIndicator());
  }
}
