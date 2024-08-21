import 'dart:convert';

import 'package:bloc_example_app/data/data_provider/weather_data_provider.dart';
import 'package:bloc_example_app/data/model/weather_model.dart';

class WeatherRepository {
  final WeatherDataProvider weatherDataProvider;

  WeatherRepository({required this.weatherDataProvider});
  Future<WeatherForecast> getCurrentWeather() async {
    try {
      final weatherData = await weatherDataProvider.getCurrentWeather();

      final data = WeatherForecast.fromJson(jsonDecode(weatherData));

      if (data.code != '200') {
        throw 'An unexpected error occurred';
      }

      return data;
    } catch (e) {
      throw e.toString();
    }
  }
}
