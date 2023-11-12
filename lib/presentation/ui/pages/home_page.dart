import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../cubits/forecast/forecast_cubit.dart';
import '../../cubits/weather/weather_cubit.dart';
import '../widgets/nested_tab_bar.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String city = "Minsk";
  String textFieldValue = "";

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showBottomSheet(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
          margin: MediaQuery.of(context).padding,
          padding: const EdgeInsets.all(16),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            IconButton(
              onPressed: () {
                showBottomSheet(context);
              },
              tooltip: "set location",
              icon: const Icon(
                Icons.location_on_outlined,
                color: Colors.grey,
                size: 32.0,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  DateFormat('MMM dd, yyyy').format(DateTime.now()),
                  style: const TextStyle(color: Colors.grey),
                ),
                Text(
                  city,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                )
              ],
            )
          ]),
        ),
        NestedTabBar(),
      ],
    ));
  }

  void showBottomSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(
                color: const Color(0xFF343438),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25.0),
                    topRight: Radius.circular(25.0))),
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Text('Enter the name of the city',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.white)),
                  Container(height: 20.0),
                  TextField(
                      onChanged: (text) {
                        setState(() {
                          textFieldValue = text;
                        });
                      },
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        hintStyle: TextStyle(color: Colors.grey),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        hintText: 'Enter a search term',
                      )),
                  Container(height: 20.0),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 60.0,
                    child: ElevatedButton(
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          backgroundColor: const Color(0xFF4B4B4F),
                          foregroundColor: Colors.white70,
                          side: const BorderSide(color: Color(0xFF4B4B4F)),
                        ),
                        child: const Text('SEARCH'),
                        onPressed: () => {
                              Navigator.pop(context),
                              if (textFieldValue.isNotEmpty)
                                {
                                  setState(() {
                                    city = textFieldValue;
                                  }),
                                  context
                                      .read<WeatherCubit>()
                                      .getWeather(textFieldValue),
                                  context
                                      .read<ForecastCubit>()
                                      .getForecast(city)
                                }
                            }),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
