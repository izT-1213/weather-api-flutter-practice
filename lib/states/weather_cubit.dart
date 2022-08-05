import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_services.dart';
import 'package:weather_app/states/weather_state.dart';

class WeatherCubit extends Cubit<WeatherState>{
  WeatherCubit() : super(WeatherLoading());

  Future<void> fetchWeather(String cityName) async {
    WeatherService weatherService = WeatherService();

    emit(WeatherLoading());

    try{
      WeatherModel weatherModel = await weatherService.fetchWeatherInformation(cityName);
      emit(
        WeatherLoaded(weatherModel: weatherModel),
      );
    }catch(e){
      emit(WeatherError(errorMessage: e.toString()));
    }
  }
}