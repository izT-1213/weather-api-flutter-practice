import 'package:flutter/material.dart';

import '../models/weather_model.dart';

class WeatherInformation extends StatelessWidget {
  const WeatherInformation({required this.weatherModel, Key? key}) : super(key: key);

  final WeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.tealAccent,
      child: SizedBox(
        height: 300,
        width: 300,
        child:Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network('http://openweathermap.org/img/wn/${weatherModel.weather.first.icon}@2x.png'),
            const SizedBox(height: 10),
            Text('${weatherModel.main.temp} \u00B0C', style: const TextStyle(fontSize: 25),),
            const SizedBox(height: 10),
            Text(weatherModel.name, style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
            const SizedBox(height: 10,),
            Text('${weatherModel.weather.first.description[0].toUpperCase()}${weatherModel.weather.first.description.substring(1, weatherModel.weather.first.description.length)}', style: const TextStyle(fontSize: 25, fontStyle: FontStyle.italic)),
          ]
        )
    )
    )
    );
  }
}
