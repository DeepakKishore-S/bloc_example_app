import 'package:bloc/bloc.dart';
import 'package:bloc_example_app/data/model/weather_model.dart';
import 'package:bloc_example_app/data/repository/weather_repository.dart';
import 'package:meta/meta.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;
  WeatherBloc(this.weatherRepository) : super(WeatherInitial()) {
    on<WeatherFetchEvent>(fetchWeatherEvent);
  }

  fetchWeatherEvent(WeatherEvent event, Emitter<WeatherState> emit) async {
    try {
      emit(WeatherLoading());
      final WeatherForecast data = await weatherRepository.getCurrentWeather();
      emit(WeatherSuccess(data));
    } catch (e) {
      emit(WeatherFailure(e.toString()));
    }
  }
}
