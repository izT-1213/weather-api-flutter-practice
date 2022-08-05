import 'package:flutter/material.dart';
import 'package:weather_app/pages/weather_details.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late final TextEditingController _controller;
  bool _isCityNameEmpty = true;

  @override
  void initState(){
    super.initState();
    _controller = TextEditingController();
    _controller.addListener(() {
      setState(() {
        _isCityNameEmpty = _controller.text.isEmpty;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather API'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text("Please enter city name", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
            const SizedBox(height: 10,),
            Padding(padding: const EdgeInsets.all(16),
              child: TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  hintText: "Enter City Name",
                  label: Text("City Name"),
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            ElevatedButton(
                onPressed: _isCityNameEmpty ? null: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WeatherDetail(
                        cityName: _controller.text)
                    )
                  );
                  },
                child: const Text("Search"))
          ]
        )
      )
    );
  }
}
