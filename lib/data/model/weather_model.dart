import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_model.freezed.dart';
part 'weather_model.g.dart';

@freezed
class WeatherForecast with _$WeatherForecast {
  const factory WeatherForecast({
    @JsonKey(name: 'cod') required String code,
    @JsonKey(name: 'message') required int message,
    @JsonKey(name: 'cnt') required int count,
    @JsonKey(name: 'list') required List<WeatherList> list,
    @JsonKey(name: 'city') required City city,
  }) = _WeatherForecast;

  factory WeatherForecast.fromJson(Map<String, dynamic> json) =>
      _$WeatherForecastFromJson(json);
}

@freezed
class WeatherList with _$WeatherList {
  const factory WeatherList({
    @JsonKey(name: 'dt') required int dt,
    @JsonKey(name: 'main') required Main main,
    @JsonKey(name: 'weather') required List<Weather> weather,
    @JsonKey(name: 'clouds') required Clouds clouds,
    @JsonKey(name: 'wind') required Wind wind,
    @JsonKey(name: 'visibility') required int visibility,
    @JsonKey(name: 'pop') required double pop,
    @JsonKey(name: 'sys') required Sys sys,
    @JsonKey(name: 'dt_txt') required String dtTxt,
  }) = _WeatherList;

  factory WeatherList.fromJson(Map<String, dynamic> json) =>
      _$WeatherListFromJson(json);
}

@freezed
class Main with _$Main {
  const factory Main({
    @JsonKey(name: 'temp') required double temp,
    @JsonKey(name: 'feels_like') required double feelsLike,
    @JsonKey(name: 'temp_min') required double tempMin,
    @JsonKey(name: 'temp_max') required double tempMax,
    @JsonKey(name: 'pressure') required int pressure,
    @JsonKey(name: 'humidity') required int humidity,
  }) = _Main;

  factory Main.fromJson(Map<String, dynamic> json) => _$MainFromJson(json);
}

@freezed
class Weather with _$Weather {
  const factory Weather({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'main') required String main,
    @JsonKey(name: 'description') required String description,
    @JsonKey(name: 'icon') required String icon,
  }) = _Weather;

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);
}

@freezed
class Clouds with _$Clouds {
  const factory Clouds({
    @JsonKey(name: 'all') required int all,
  }) = _Clouds;

  factory Clouds.fromJson(Map<String, dynamic> json) => _$CloudsFromJson(json);
}

@freezed
class Wind with _$Wind {
  const factory Wind({
    @JsonKey(name: 'speed') required double speed,
    @JsonKey(name: 'deg') required int deg,
    @JsonKey(name: 'gust') required double gust,
  }) = _Wind;

  factory Wind.fromJson(Map<String, dynamic> json) => _$WindFromJson(json);
}

@freezed
class Sys with _$Sys {
  const factory Sys({
    @JsonKey(name: 'pod') required String pod,
  }) = _Sys;

  factory Sys.fromJson(Map<String, dynamic> json) => _$SysFromJson(json);
}

@freezed
class City with _$City {
  const factory City({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'coord') required Coord coord,
    @JsonKey(name: 'country') required String country,
    @JsonKey(name: 'population') required int population,
    @JsonKey(name: 'timezone') required int timezone,
    @JsonKey(name: 'sunrise') required int sunrise,
    @JsonKey(name: 'sunset') required int sunset,
  }) = _City;

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);
}

@freezed
class Coord with _$Coord {
  const factory Coord({
    @JsonKey(name: 'lat') required double lat,
    @JsonKey(name: 'lon') required double lon,
  }) = _Coord;

  factory Coord.fromJson(Map<String, dynamic> json) => _$CoordFromJson(json);
}
