import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  // apikey
  static const _API_KEY = '868c12c0d1eae7f378adb9b37f4f7139';
  final _weatherService = WeatherService(_API_KEY);
  Weather? _weather;

  // fetch weather
  _fetchWeather() async {
    // get current city
    String cityName = await _weatherService.getCurrentCity();

    // get the weater for city
    try {
      final weather = await _weatherService.getWeather(cityName);
      setState(() {
        _weather = weather;
        print(_weather?.cityName ?? "null");
        print(_weather?.tempreture.round().toString() ?? "null");
      });
    }

    // eny errors
    catch (e) {
      print(e);
    }
  }

  // weather animation

  // init state

  @override
  void initState() {
    super.initState();
    // fetch weather on startup
    _fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // city name
            Text(_weather?.cityName ?? "Loading city ..."),

            // tempreture
            Text("${_weather?.tempreture.round()} C"),
          ],
        ),
      ),
    );
  }
}
