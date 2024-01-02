import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather_app_bloc/model/branch_model/weather_model.dart';
import 'package:weather_app_bloc/model/main_model/current_weather_model.dart';
import 'package:weather_app_bloc/model/main_model/five_days_model.dart';
import 'package:weather_app_bloc/services/base_services.dart';

part 'waether_event.dart';
part 'waether_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WaetherInitial()) {
    on<GetCurrentWeatherData>((event, emit) async {
      emit(LoadingWeatherData());

      dynamic temp = await WeatherService().getCurrentWeather();
      print(temp);

      if (temp is bool) {
        emit(ErrorWeatherData());
      } else if (temp is String) {
        emit(NoEnternetWeatherData());
      } else {
        CurrentWeatherModel weather = CurrentWeatherModel.fromMap(temp);
        emit(SuccessGetingCurrentWeatherData(data: weather));
      }
    });

    on<GetFiveOther>((event, emit) async {
      emit(LoadingWeatherData());
      dynamic temp = await WeatherService().getFiveDaysWeather();
      print(temp);

      if (temp is bool) {
        emit(ErrorWeatherData());
      } else if (temp is String) {
        emit(NoEnternetWeatherData());
      } else {
        CurrentWeatherModel weather = CurrentWeatherModel.fromMap(temp);
        emit(SuccessGetingFiveOthers(data1: temp));
      }
    });
  }
}
