part of 'weather_bloc.dart';

@immutable
sealed class WeatherState {}

final class WeatherInitial extends WeatherState {}

final class WeatherSuccess extends WeatherState {
  final WeatherForecast weatherData;

  WeatherSuccess(this.weatherData);
}

final class WeatherFailure extends WeatherState {
  final String erroMsg;

  WeatherFailure(this.erroMsg);
}

final class WeatherLoading extends WeatherState {}
