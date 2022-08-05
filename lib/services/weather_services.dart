import 'package:http/http.dart' as http;

import '../models/weather_model.dart';

class WeatherService {
  Future<WeatherModel> fetchWeatherInformation(String cityName) async {
    const String apiKey = '9fcbd895063cf11eea209bbf27fdb64d';

    final Uri url = Uri(
      scheme: 'https',
      host: 'api.openweathermap.org',
      path: 'data/2.5/weather',
      queryParameters: {'q': cityName, 'appid': apiKey, 'units': 'metric'},
    );

    http.Response response = await http.get(url);

    if(response.statusCode == 200){
      return WeatherModel.fromJson(response.body);
    } else{
      throw Exception("Failed to load weather information.");
    }
  }
}