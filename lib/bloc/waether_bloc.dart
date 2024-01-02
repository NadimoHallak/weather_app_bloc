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

      dynamic temp1 = await WeatherService().getCurrentWeather();
      dynamic temp2 = await WeatherService().getFiveDaysWeather();
      print(temp2);

      if (temp1 is bool || temp2 is bool) {
        emit(ErrorWeatherData());
      } else if (temp1 is String || temp2 is String) {
        emit(NoEnternetWeatherData());
      } else {
        CurrentWeatherModel currentWeather = CurrentWeatherModel.fromMap(temp1);
        FiveDaysModel FiveOthersWeather = FiveDaysModel.fromMap(temp1);
        emit(SuccessGetingCurrentWeatherData(
            data: currentWeather, data1: FiveOthersWeather));
      }
    });
  }
}
