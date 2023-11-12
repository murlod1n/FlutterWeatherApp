class Weather {
  Weather({
    this.temp,
    this.wind,
    this.humidity,
    this.clouds,
    this.icon,
    this.weatherTitle,
    this.cityName,
    this.region,
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
  String? region;
  int? pressure;
  String? date;
}