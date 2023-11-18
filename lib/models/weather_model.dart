class Weather {
  final String cityName;
  final double tempreture;
  final String mainCondition;

  Weather({
    required this.cityName,
    required this.tempreture,
    required this.mainCondition,
  });

  factory Weather.fromjson(Map<String, dynamic> json) {
    return Weather(
      cityName: json['name'],
      tempreture: json['main']['temp'].toDouble(),
      mainCondition: json['weather'][0]['main'],
    );
  }
}
