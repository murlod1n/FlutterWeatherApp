class WeatherUi {
  WeatherUi({
    this.temp,
    this.wind,
    this.humidity,
    this.clouds,
    this.icon,
    this.weatherTitle,
    this.cityName,
    this.pressure,
    this.date
  });

  double? temp;
  double? wind;
  int? humidity;
  int? clouds;
  String? icon;
  String? weatherTitle;
  String? cityName;
  int? pressure;
  String? date;
}