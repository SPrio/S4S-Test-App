import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class Weather {
  Weather(this.hourly, this.current, this.daily);

  final double hourly;
  final double current;
  final double daily;
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Position _currentPosition;
  Future<Weather> _currentWeather;

  Future<Weather> getC(Position position) async {
    var response = await http.get(
        'https://api.openweathermap.org/data/2.5/onecall?lat=' +
            position.latitude.toString() +
            '&lon=' +
            position.longitude.toString() +
            '&units=metric&exclude=minutely,alerts&appid=df1e864e1422bd31a181524824d17711');
    print("RESPONSE ${response.body}");
    Map<String, dynamic> map = jsonDecode(response.body);
    Weather weather = Weather(
        double.parse(map['hourly'][1]["temp"].toString()),
        double.parse(map['current']["temp"].toString()),
        double.parse(map["daily"][1]["temp"]["day"].toString()));
    return weather;
  }

  @override
  initState() {
    super.initState();

    final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      _currentWeather = getC(position);
      setState(() {
        _currentPosition = position;
      });
    }).catchError((e) {
      print(e);
    });
  }

  @override
  Widget build(BuildContext context) {
    // getC();
    return Scaffold(
      appBar: AppBar(
        title: Text('S4S Test'),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.only(top: 40),
          child: Column(
            children: <Widget>[
              Text(
                'Supriyo Mahanta',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Location Co-ordinates: ${_currentPosition.latitude}, ${_currentPosition.longitude}",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 10),
              FutureBuilder(
                future: _currentWeather,
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  if (snapshot.hasData) {
                    Weather weather = snapshot.data;
                    return Column(children: <Widget>[
                      Text(
                        "Current Temperature: ${weather.current} °C",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        "Next Hour's Temperature: ${weather.hourly} °C",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        "Next Day's Temperature: ${weather.daily} °C",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ]);
                  } else if (snapshot.hasError) {
                    // If something went wrong
                    return Text('Something went wrong...');
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
