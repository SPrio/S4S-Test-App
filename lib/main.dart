import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:dio/dio.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
  Weather _currentWeather;
  double current, hourly, daily;

   Future<Weather> getC() async {
    var response = await Dio().get('https://api.openweathermap.org/data/2.5/onecall?lat=22.57318&lon=88.43354&units=metric&exclude=minutely,alerts&appid=df1e864e1422bd31a181524824d17711');
    print("RESPONSE ${response.data}");
    Map<String, dynamic> map = jsonDecode(response.data);
    Weather weather = Weather(
        double.parse(map['hourly'][1]["temp"].toString()),
        double.parse(map['current']["temp"].toString()),
        double.parse(map["daily"][1]["temp"]["day"].toString()));
    setState(() {
      _currentWeather = weather;
      current = double.parse(map['hourly'][1]["temp"].toString());
      hourly = double.parse(map['current']["temp"].toString());
      daily = double.parse(map["daily"][1]["temp"]["day"].toString());
    });
    return weather;
  }

  @override
  initState() {
    super.initState();

    final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });
    }).catchError((e) {
      print(e);
    });
    getC();
    String rawJson = """
{
  "lat": 22.57,
  "lon": 88.43,
  "timezone": "Asia/Kolkata",
  "timezone_offset": 19800,
  "current": {
    "dt": 1609351049,
    "sunrise": 1609289141,
    "sunset": 1609327903,
    "temp": 16,
    "feels_like": 14.62,
    "pressure": 1014,
    "humidity": 77,
    "dew_point": 11.97,
    "uvi": 0,
    "clouds": 0,
    "visibility": 2500,
    "wind_speed": 2.85,
    "wind_deg": 346,
    "weather": [
      {
        "id": 701,
        "main": "Mist",
        "description": "mist",
        "icon": "50n"
      }
    ]
  },
  "hourly": [
    {
      "dt": 1609347600,
      "temp": 16,
      "feels_like": 14.62,
      "pressure": 1014,
      "humidity": 77,
      "dew_point": 11.97,
      "uvi": 0,
      "clouds": 0,
      "visibility": 10000,
      "wind_speed": 2.85,
      "wind_deg": 346,
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "clear sky",
          "icon": "01n"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1609351200,
      "temp": 17.02,
      "feels_like": 14.82,
      "pressure": 1014,
      "humidity": 60,
      "dew_point": 9.21,
      "uvi": 0,
      "clouds": 0,
      "visibility": 10000,
      "wind_speed": 2.91,
      "wind_deg": 348,
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "clear sky",
          "icon": "01n"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1609354800,
      "temp": 17.24,
      "feels_like": 14.57,
      "pressure": 1015,
      "humidity": 51,
      "dew_point": 7.02,
      "uvi": 0,
      "clouds": 1,
      "visibility": 10000,
      "wind_speed": 2.82,
      "wind_deg": 353,
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "clear sky",
          "icon": "01n"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1609358400,
      "temp": 17.02,
      "feels_like": 13.94,
      "pressure": 1015,
      "humidity": 48,
      "dew_point": 5.94,
      "uvi": 0,
      "clouds": 3,
      "visibility": 10000,
      "wind_speed": 3.07,
      "wind_deg": 357,
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "clear sky",
          "icon": "01n"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1609362000,
      "temp": 16.59,
      "feels_like": 13.42,
      "pressure": 1014,
      "humidity": 49,
      "dew_point": 5.84,
      "uvi": 0,
      "clouds": 2,
      "visibility": 10000,
      "wind_speed": 3.17,
      "wind_deg": 356,
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "clear sky",
          "icon": "01n"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1609365600,
      "temp": 16.04,
      "feels_like": 12.9,
      "pressure": 1014,
      "humidity": 52,
      "dew_point": 6.26,
      "uvi": 0,
      "clouds": 1,
      "visibility": 10000,
      "wind_speed": 3.23,
      "wind_deg": 354,
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "clear sky",
          "icon": "01n"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1609369200,
      "temp": 15.44,
      "feels_like": 12.52,
      "pressure": 1015,
      "humidity": 55,
      "dew_point": 6.52,
      "uvi": 0,
      "clouds": 6,
      "visibility": 10000,
      "wind_speed": 2.99,
      "wind_deg": 359,
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "clear sky",
          "icon": "01n"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1609372800,
      "temp": 14.9,
      "feels_like": 12.34,
      "pressure": 1015,
      "humidity": 58,
      "dew_point": 6.82,
      "uvi": 0,
      "clouds": 8,
      "visibility": 10000,
      "wind_speed": 2.57,
      "wind_deg": 5,
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "clear sky",
          "icon": "01n"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1609376400,
      "temp": 14.68,
      "feels_like": 12.22,
      "pressure": 1016,
      "humidity": 60,
      "dew_point": 7.15,
      "uvi": 0,
      "clouds": 43,
      "visibility": 10000,
      "wind_speed": 2.51,
      "wind_deg": 2,
      "weather": [
        {
          "id": 802,
          "main": "Clouds",
          "description": "scattered clouds",
          "icon": "03d"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1609380000,
      "temp": 17.18,
      "feels_like": 14.42,
      "pressure": 1017,
      "humidity": 53,
      "dew_point": 7.79,
      "uvi": 0.57,
      "clouds": 66,
      "visibility": 10000,
      "wind_speed": 3.11,
      "wind_deg": 357,
      "weather": [
        {
          "id": 803,
          "main": "Clouds",
          "description": "broken clouds",
          "icon": "04d"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1609383600,
      "temp": 20.56,
      "feels_like": 17.37,
      "pressure": 1018,
      "humidity": 44,
      "dew_point": 8.2,
      "uvi": 1.8,
      "clouds": 65,
      "visibility": 10000,
      "wind_speed": 3.85,
      "wind_deg": 359,
      "weather": [
        {
          "id": 803,
          "main": "Clouds",
          "description": "broken clouds",
          "icon": "04d"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1609387200,
      "temp": 23.35,
      "feels_like": 19.53,
      "pressure": 1018,
      "humidity": 37,
      "dew_point": 7.99,
      "uvi": 3.57,
      "clouds": 58,
      "visibility": 10000,
      "wind_speed": 4.74,
      "wind_deg": 358,
      "weather": [
        {
          "id": 803,
          "main": "Clouds",
          "description": "broken clouds",
          "icon": "04d"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1609390800,
      "temp": 25.25,
      "feels_like": 21.11,
      "pressure": 1017,
      "humidity": 32,
      "dew_point": 7.49,
      "uvi": 5.19,
      "clouds": 47,
      "visibility": 10000,
      "wind_speed": 5.04,
      "wind_deg": 359,
      "weather": [
        {
          "id": 802,
          "main": "Clouds",
          "description": "scattered clouds",
          "icon": "03d"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1609394400,
      "temp": 26.56,
      "feels_like": 22.12,
      "pressure": 1016,
      "humidity": 27,
      "dew_point": 6.52,
      "uvi": 5.94,
      "clouds": 46,
      "visibility": 10000,
      "wind_speed": 5.04,
      "wind_deg": 357,
      "weather": [
        {
          "id": 802,
          "main": "Clouds",
          "description": "scattered clouds",
          "icon": "03d"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1609398000,
      "temp": 27.55,
      "feels_like": 22.86,
      "pressure": 1015,
      "humidity": 24,
      "dew_point": 5.72,
      "uvi": 5.53,
      "clouds": 100,
      "visibility": 10000,
      "wind_speed": 5.14,
      "wind_deg": 354,
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04d"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1609401600,
      "temp": 28.16,
      "feels_like": 23.35,
      "pressure": 1014,
      "humidity": 23,
      "dew_point": 5.19,
      "uvi": 4.07,
      "clouds": 100,
      "visibility": 10000,
      "wind_speed": 5.28,
      "wind_deg": 353,
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04d"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1609405200,
      "temp": 28.11,
      "feels_like": 23.3,
      "pressure": 1014,
      "humidity": 23,
      "dew_point": 5.1,
      "uvi": 2.27,
      "clouds": 100,
      "visibility": 10000,
      "wind_speed": 5.27,
      "wind_deg": 355,
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04d"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1609408800,
      "temp": 27.39,
      "feels_like": 22.73,
      "pressure": 1014,
      "humidity": 24,
      "dew_point": 5.14,
      "uvi": 0.83,
      "clouds": 100,
      "visibility": 10000,
      "wind_speed": 5.06,
      "wind_deg": 360,
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04d"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1609412400,
      "temp": 25.47,
      "feels_like": 21.95,
      "pressure": 1014,
      "humidity": 28,
      "dew_point": 5.88,
      "uvi": 0.13,
      "clouds": 99,
      "visibility": 10000,
      "wind_speed": 3.6,
      "wind_deg": 13,
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04d"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1609416000,
      "temp": 22.35,
      "feels_like": 19.05,
      "pressure": 1014,
      "humidity": 33,
      "dew_point": 5.36,
      "uvi": 0,
      "clouds": 99,
      "visibility": 10000,
      "wind_speed": 3.19,
      "wind_deg": 23,
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04n"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1609419600,
      "temp": 21.28,
      "feels_like": 18.06,
      "pressure": 1015,
      "humidity": 34,
      "dew_point": 4.98,
      "uvi": 0,
      "clouds": 62,
      "visibility": 10000,
      "wind_speed": 2.93,
      "wind_deg": 24,
      "weather": [
        {
          "id": 803,
          "main": "Clouds",
          "description": "broken clouds",
          "icon": "04n"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1609423200,
      "temp": 20.48,
      "feels_like": 17.42,
      "pressure": 1015,
      "humidity": 35,
      "dew_point": 4.66,
      "uvi": 0,
      "clouds": 56,
      "visibility": 10000,
      "wind_speed": 2.62,
      "wind_deg": 13,
      "weather": [
        {
          "id": 803,
          "main": "Clouds",
          "description": "broken clouds",
          "icon": "04n"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1609426800,
      "temp": 19.79,
      "feels_like": 16.64,
      "pressure": 1016,
      "humidity": 36,
      "dew_point": 4.52,
      "uvi": 0,
      "clouds": 58,
      "visibility": 10000,
      "wind_speed": 2.69,
      "wind_deg": 2,
      "weather": [
        {
          "id": 803,
          "main": "Clouds",
          "description": "broken clouds",
          "icon": "04n"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1609430400,
      "temp": 19.11,
      "feels_like": 15.76,
      "pressure": 1016,
      "humidity": 38,
      "dew_point": 4.54,
      "uvi": 0,
      "clouds": 58,
      "visibility": 10000,
      "wind_speed": 3.03,
      "wind_deg": 359,
      "weather": [
        {
          "id": 803,
          "main": "Clouds",
          "description": "broken clouds",
          "icon": "04n"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1609434000,
      "temp": 18.47,
      "feels_like": 14.98,
      "pressure": 1016,
      "humidity": 39,
      "dew_point": 4.62,
      "uvi": 0,
      "clouds": 51,
      "visibility": 10000,
      "wind_speed": 3.17,
      "wind_deg": 359,
      "weather": [
        {
          "id": 803,
          "main": "Clouds",
          "description": "broken clouds",
          "icon": "04n"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1609437600,
      "temp": 17.76,
      "feels_like": 14.24,
      "pressure": 1016,
      "humidity": 41,
      "dew_point": 4.51,
      "uvi": 0,
      "clouds": 52,
      "visibility": 10000,
      "wind_speed": 3.23,
      "wind_deg": 0,
      "weather": [
        {
          "id": 803,
          "main": "Clouds",
          "description": "broken clouds",
          "icon": "04n"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1609441200,
      "temp": 17.04,
      "feels_like": 13.54,
      "pressure": 1016,
      "humidity": 42,
      "dew_point": 4.14,
      "uvi": 0,
      "clouds": 72,
      "visibility": 10000,
      "wind_speed": 3.12,
      "wind_deg": 4,
      "weather": [
        {
          "id": 803,
          "main": "Clouds",
          "description": "broken clouds",
          "icon": "04n"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1609444800,
      "temp": 16.45,
      "feels_like": 12.9,
      "pressure": 1015,
      "humidity": 42,
      "dew_point": 3.83,
      "uvi": 0,
      "clouds": 85,
      "visibility": 10000,
      "wind_speed": 3.06,
      "wind_deg": 4,
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04n"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1609448400,
      "temp": 16.04,
      "feels_like": 12.49,
      "pressure": 1015,
      "humidity": 43,
      "dew_point": 3.73,
      "uvi": 0,
      "clouds": 75,
      "visibility": 10000,
      "wind_speed": 3.04,
      "wind_deg": 359,
      "weather": [
        {
          "id": 803,
          "main": "Clouds",
          "description": "broken clouds",
          "icon": "04n"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1609452000,
      "temp": 15.65,
      "feels_like": 12.15,
      "pressure": 1015,
      "humidity": 44,
      "dew_point": 3.61,
      "uvi": 0,
      "clouds": 64,
      "visibility": 10000,
      "wind_speed": 2.97,
      "wind_deg": 354,
      "weather": [
        {
          "id": 803,
          "main": "Clouds",
          "description": "broken clouds",
          "icon": "04n"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1609455600,
      "temp": 15.23,
      "feels_like": 11.74,
      "pressure": 1015,
      "humidity": 45,
      "dew_point": 3.47,
      "uvi": 0,
      "clouds": 55,
      "visibility": 10000,
      "wind_speed": 2.94,
      "wind_deg": 352,
      "weather": [
        {
          "id": 803,
          "main": "Clouds",
          "description": "broken clouds",
          "icon": "04n"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1609459200,
      "temp": 14.76,
      "feels_like": 11,
      "pressure": 1016,
      "humidity": 46,
      "dew_point": 3.4,
      "uvi": 0,
      "clouds": 49,
      "visibility": 10000,
      "wind_speed": 3.29,
      "wind_deg": 347,
      "weather": [
        {
          "id": 802,
          "main": "Clouds",
          "description": "scattered clouds",
          "icon": "03n"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1609462800,
      "temp": 14.32,
      "feels_like": 10.49,
      "pressure": 1016,
      "humidity": 48,
      "dew_point": 3.51,
      "uvi": 0,
      "clouds": 33,
      "visibility": 10000,
      "wind_speed": 3.44,
      "wind_deg": 346,
      "weather": [
        {
          "id": 802,
          "main": "Clouds",
          "description": "scattered clouds",
          "icon": "03d"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1609466400,
      "temp": 16.61,
      "feels_like": 12.82,
      "pressure": 1017,
      "humidity": 43,
      "dew_point": 4.13,
      "uvi": 0.55,
      "clouds": 49,
      "visibility": 10000,
      "wind_speed": 3.53,
      "wind_deg": 346,
      "weather": [
        {
          "id": 802,
          "main": "Clouds",
          "description": "scattered clouds",
          "icon": "03d"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1609470000,
      "temp": 19.92,
      "feels_like": 16.1,
      "pressure": 1018,
      "humidity": 35,
      "dew_point": 4.24,
      "uvi": 1.75,
      "clouds": 62,
      "visibility": 10000,
      "wind_speed": 3.57,
      "wind_deg": 351,
      "weather": [
        {
          "id": 803,
          "main": "Clouds",
          "description": "broken clouds",
          "icon": "04d"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1609473600,
      "temp": 22.54,
      "feels_like": 18.65,
      "pressure": 1019,
      "humidity": 30,
      "dew_point": 4.37,
      "uvi": 3.52,
      "clouds": 64,
      "visibility": 10000,
      "wind_speed": 3.7,
      "wind_deg": 352,
      "weather": [
        {
          "id": 803,
          "main": "Clouds",
          "description": "broken clouds",
          "icon": "04d"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1609477200,
      "temp": 24.57,
      "feels_like": 20.47,
      "pressure": 1018,
      "humidity": 26,
      "dew_point": 3.99,
      "uvi": 5.11,
      "clouds": 59,
      "visibility": 10000,
      "wind_speed": 3.92,
      "wind_deg": 351,
      "weather": [
        {
          "id": 803,
          "main": "Clouds",
          "description": "broken clouds",
          "icon": "04d"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1609480800,
      "temp": 26.16,
      "feels_like": 21.76,
      "pressure": 1017,
      "humidity": 22,
      "dew_point": 3.11,
      "uvi": 5.85,
      "clouds": 56,
      "visibility": 10000,
      "wind_speed": 4.08,
      "wind_deg": 346,
      "weather": [
        {
          "id": 803,
          "main": "Clouds",
          "description": "broken clouds",
          "icon": "04d"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1609484400,
      "temp": 27.43,
      "feels_like": 22.59,
      "pressure": 1015,
      "humidity": 19,
      "dew_point": 2.46,
      "uvi": 5.42,
      "clouds": 52,
      "visibility": 10000,
      "wind_speed": 4.47,
      "wind_deg": 340,
      "weather": [
        {
          "id": 803,
          "main": "Clouds",
          "description": "broken clouds",
          "icon": "04d"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1609488000,
      "temp": 28.06,
      "feels_like": 23.08,
      "pressure": 1014,
      "humidity": 18,
      "dew_point": 2.01,
      "uvi": 4,
      "clouds": 47,
      "visibility": 10000,
      "wind_speed": 4.61,
      "wind_deg": 336,
      "weather": [
        {
          "id": 802,
          "main": "Clouds",
          "description": "scattered clouds",
          "icon": "03d"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1609491600,
      "temp": 28.17,
      "feels_like": 23.25,
      "pressure": 1013,
      "humidity": 18,
      "dew_point": 1.69,
      "uvi": 2.23,
      "clouds": 37,
      "visibility": 10000,
      "wind_speed": 4.54,
      "wind_deg": 338,
      "weather": [
        {
          "id": 802,
          "main": "Clouds",
          "description": "scattered clouds",
          "icon": "03d"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1609495200,
      "temp": 27.56,
      "feels_like": 22.79,
      "pressure": 1013,
      "humidity": 18,
      "dew_point": 1.73,
      "uvi": 0.83,
      "clouds": 29,
      "visibility": 10000,
      "wind_speed": 4.21,
      "wind_deg": 342,
      "weather": [
        {
          "id": 802,
          "main": "Clouds",
          "description": "scattered clouds",
          "icon": "03d"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1609498800,
      "temp": 25.51,
      "feels_like": 21.78,
      "pressure": 1013,
      "humidity": 22,
      "dew_point": 2.83,
      "uvi": 0.13,
      "clouds": 23,
      "visibility": 10000,
      "wind_speed": 2.99,
      "wind_deg": 348,
      "weather": [
        {
          "id": 801,
          "main": "Clouds",
          "description": "few clouds",
          "icon": "02d"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1609502400,
      "temp": 22.17,
      "feels_like": 18.74,
      "pressure": 1014,
      "humidity": 26,
      "dew_point": 2.12,
      "uvi": 0,
      "clouds": 20,
      "visibility": 10000,
      "wind_speed": 2.45,
      "wind_deg": 358,
      "weather": [
        {
          "id": 801,
          "main": "Clouds",
          "description": "few clouds",
          "icon": "02n"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1609506000,
      "temp": 20.74,
      "feels_like": 17.48,
      "pressure": 1015,
      "humidity": 29,
      "dew_point": 2.45,
      "uvi": 0,
      "clouds": 0,
      "visibility": 10000,
      "wind_speed": 2.28,
      "wind_deg": 12,
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "clear sky",
          "icon": "01n"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1609509600,
      "temp": 19.8,
      "feels_like": 16.68,
      "pressure": 1015,
      "humidity": 32,
      "dew_point": 2.87,
      "uvi": 0,
      "clouds": 0,
      "visibility": 10000,
      "wind_speed": 2.22,
      "wind_deg": 17,
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "clear sky",
          "icon": "01n"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1609513200,
      "temp": 19.3,
      "feels_like": 16.18,
      "pressure": 1016,
      "humidity": 33,
      "dew_point": 3.05,
      "uvi": 0,
      "clouds": 0,
      "visibility": 10000,
      "wind_speed": 2.21,
      "wind_deg": 17,
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "clear sky",
          "icon": "01n"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1609516800,
      "temp": 18.89,
      "feels_like": 15.77,
      "pressure": 1016,
      "humidity": 34,
      "dew_point": 3.07,
      "uvi": 0,
      "clouds": 0,
      "visibility": 10000,
      "wind_speed": 2.23,
      "wind_deg": 9,
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "clear sky",
          "icon": "01n"
        }
      ],
      "pop": 0
    }
  ],
  "daily": [
    {
      "dt": 1609306200,
      "sunrise": 1609289141,
      "sunset": 1609327903,
      "temp": {
        "day": 25.13,
        "min": 14.99,
        "max": 28.39,
        "night": 16,
        "eve": 25.82,
        "morn": 15.62
      },
      "feels_like": {
        "day": 21.07,
        "night": 14.62,
        "eve": 22,
        "morn": 12.55
      },
      "pressure": 1018,
      "humidity": 25,
      "dew_point": 4.22,
      "wind_speed": 3.83,
      "wind_deg": 353,
      "weather": [
        {
          "id": 802,
          "main": "Clouds",
          "description": "scattered clouds",
          "icon": "03d"
        }
      ],
      "clouds": 38,
      "pop": 0,
      "uvi": 5.98
    },
    {
      "dt": 1609392600,
      "sunrise": 1609375561,
      "sunset": 1609414339,
      "temp": {
        "day": 25.25,
        "min": 14.68,
        "max": 28.16,
        "night": 18.47,
        "eve": 25.47,
        "morn": 15.44
      },
      "feels_like": {
        "day": 21.11,
        "night": 14.98,
        "eve": 21.95,
        "morn": 12.52
      },
      "pressure": 1017,
      "humidity": 32,
      "dew_point": 7.49,
      "wind_speed": 5.04,
      "wind_deg": 359,
      "weather": [
        {
          "id": 802,
          "main": "Clouds",
          "description": "scattered clouds",
          "icon": "03d"
        }
      ],
      "clouds": 47,
      "pop": 0,
      "uvi": 5.94
    },
    {
      "dt": 1609479000,
      "sunrise": 1609461979,
      "sunset": 1609500776,
      "temp": {
        "day": 24.57,
        "min": 14.32,
        "max": 28.17,
        "night": 18.35,
        "eve": 25.51,
        "morn": 15.23
      },
      "feels_like": {
        "day": 20.47,
        "night": 15.05,
        "eve": 21.78,
        "morn": 11.74
      },
      "pressure": 1018,
      "humidity": 26,
      "dew_point": 3.99,
      "wind_speed": 3.92,
      "wind_deg": 351,
      "weather": [
        {
          "id": 803,
          "main": "Clouds",
          "description": "broken clouds",
          "icon": "04d"
        }
      ],
      "clouds": 59,
      "pop": 0,
      "uvi": 5.85
    },
    {
      "dt": 1609565400,
      "sunrise": 1609548396,
      "sunset": 1609587213,
      "temp": {
        "day": 24.09,
        "min": 13.92,
        "max": 27.96,
        "night": 18.1,
        "eve": 25.27,
        "morn": 14.77
      },
      "feels_like": {
        "day": 19.79,
        "night": 15.4,
        "eve": 21.71,
        "morn": 11.57
      },
      "pressure": 1017,
      "humidity": 22,
      "dew_point": 1.42,
      "wind_speed": 3.53,
      "wind_deg": 338,
      "weather": [
        {
          "id": 802,
          "main": "Clouds",
          "description": "scattered clouds",
          "icon": "03d"
        }
      ],
      "clouds": 38,
      "pop": 0,
      "uvi": 5.94
    },
    {
      "dt": 1609651800,
      "sunrise": 1609634813,
      "sunset": 1609673651,
      "temp": {
        "day": 26.51,
        "min": 14.74,
        "max": 28.99,
        "night": 19.38,
        "eve": 23.23,
        "morn": 14.74
      },
      "feels_like": {
        "day": 22.75,
        "night": 16.87,
        "eve": 19.98,
        "morn": 11.72
      },
      "pressure": 1015,
      "humidity": 21,
      "dew_point": 2.92,
      "wind_speed": 3.08,
      "wind_deg": 345,
      "weather": [
        {
          "id": 803,
          "main": "Clouds",
          "description": "broken clouds",
          "icon": "04d"
        }
      ],
      "clouds": 78,
      "pop": 0,
      "uvi": 5.96
    },
    {
      "dt": 1609738200,
      "sunrise": 1609721228,
      "sunset": 1609760090,
      "temp": {
        "day": 27.88,
        "min": 16.74,
        "max": 30.09,
        "night": 20.75,
        "eve": 24.83,
        "morn": 16.74
      },
      "feels_like": {
        "day": 24.67,
        "night": 18.57,
        "eve": 22.09,
        "morn": 14.04
      },
      "pressure": 1015,
      "humidity": 24,
      "dew_point": 5.77,
      "wind_speed": 3.1,
      "wind_deg": 353,
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "clear sky",
          "icon": "01d"
        }
      ],
      "clouds": 0,
      "pop": 0,
      "uvi": 6.1
    },
    {
      "dt": 1609824600,
      "sunrise": 1609807641,
      "sunset": 1609846529,
      "temp": {
        "day": 29.39,
        "min": 17.64,
        "max": 31.44,
        "night": 21.16,
        "eve": 25.42,
        "morn": 17.64
      },
      "feels_like": {
        "day": 25.89,
        "night": 19.21,
        "eve": 23.05,
        "morn": 15.32
      },
      "pressure": 1015,
      "humidity": 25,
      "dew_point": 7.41,
      "wind_speed": 4.1,
      "wind_deg": 345,
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "clear sky",
          "icon": "01d"
        }
      ],
      "clouds": 1,
      "pop": 0,
      "uvi": 7
    },
    {
      "dt": 1609911000,
      "sunrise": 1609894054,
      "sunset": 1609932969,
      "temp": {
        "day": 30.51,
        "min": 18.77,
        "max": 32.76,
        "night": 22.22,
        "eve": 27.09,
        "morn": 18.77
      },
      "feels_like": {
        "day": 27.74,
        "night": 20.97,
        "eve": 25.35,
        "morn": 16.51
      },
      "pressure": 1013,
      "humidity": 24,
      "dew_point": 8.18,
      "wind_speed": 3.17,
      "wind_deg": 356,
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "clear sky",
          "icon": "01d"
        }
      ],
      "clouds": 0,
      "pop": 0,
      "uvi": 7
    }
  ]
}
    """;
    // Map<String, dynamic> map = jsonDecode(rawJson);
    // Weather weather = Weather(
    //     double.parse(map['hourly'][1]["temp"].toString()),
    //     double.parse(map['current']["temp"].toString()),
    //     double.parse(map["daily"][1]["temp"]["day"].toString()));
    // setState(() {
    //   _currentWeather = weather;
    // });
    // _makeAPIRequest();
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
              // FutureBuilder(
              //   future: getC(),
              //   builder:
              //       (BuildContext context, AsyncSnapshot<Weather> snapshot) {
              //     if (snapshot.hasData) {
              //       Weather weather = snapshot.data;
              //       return Text(
              //         "Current Temperature: ${weather.current} °C",
              //         style: TextStyle(
              //           fontSize: 16,
              //         ),
              //       );
              //     } else {
              //       return Center(child: CircularProgressIndicator());
              //     }
              //   },
              // ),

              Text(
                "Current Temperature: ${current} °C",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Next Hour's Temperature: ${hourly} °C",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Next Day's Temperature: ${daily} °C",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _makeAPIRequest() async {
    // make GET request
    // final String weatherURL =
    //     "https://api.openweathermap.org/data/2.5/onecall?lat=22.57318&lon=88.43354&units=metric&exclude=minutely,alerts&appid=df1e864e1422bd31a181524824d17711";
    //
    // Response res = await get(weatherURL);

    String rawJson = """
{
  "lat": 22.57,
  "lon": 88.43,
  "timezone": "Asia/Kolkata",
  "timezone_offset": 19800,
  "current": {
    "dt": 1609351049,
    "sunrise": 1609289141,
    "sunset": 1609327903,
    "temp": 16,
    "feels_like": 14.62,
    "pressure": 1014,
    "humidity": 77,
    "dew_point": 11.97,
    "uvi": 0,
    "clouds": 0,
    "visibility": 2500,
    "wind_speed": 2.85,
    "wind_deg": 346,
    "weather": [
      {
        "id": 701,
        "main": "Mist",
        "description": "mist",
        "icon": "50n"
      }
    ]
  },
  "hourly": [
    {
      "dt": 1609347600,
      "temp": 16,
      "feels_like": 14.62,
      "pressure": 1014,
      "humidity": 77,
      "dew_point": 11.97,
      "uvi": 0,
      "clouds": 0,
      "visibility": 10000,
      "wind_speed": 2.85,
      "wind_deg": 346,
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "clear sky",
          "icon": "01n"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1609351200,
      "temp": 17.02,
      "feels_like": 14.82,
      "pressure": 1014,
      "humidity": 60,
      "dew_point": 9.21,
      "uvi": 0,
      "clouds": 0,
      "visibility": 10000,
      "wind_speed": 2.91,
      "wind_deg": 348,
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "clear sky",
          "icon": "01n"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1609354800,
      "temp": 17.24,
      "feels_like": 14.57,
      "pressure": 1015,
      "humidity": 51,
      "dew_point": 7.02,
      "uvi": 0,
      "clouds": 1,
      "visibility": 10000,
      "wind_speed": 2.82,
      "wind_deg": 353,
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "clear sky",
          "icon": "01n"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1609358400,
      "temp": 17.02,
      "feels_like": 13.94,
      "pressure": 1015,
      "humidity": 48,
      "dew_point": 5.94,
      "uvi": 0,
      "clouds": 3,
      "visibility": 10000,
      "wind_speed": 3.07,
      "wind_deg": 357,
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "clear sky",
          "icon": "01n"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1609362000,
      "temp": 16.59,
      "feels_like": 13.42,
      "pressure": 1014,
      "humidity": 49,
      "dew_point": 5.84,
      "uvi": 0,
      "clouds": 2,
      "visibility": 10000,
      "wind_speed": 3.17,
      "wind_deg": 356,
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "clear sky",
          "icon": "01n"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1609365600,
      "temp": 16.04,
      "feels_like": 12.9,
      "pressure": 1014,
      "humidity": 52,
      "dew_point": 6.26,
      "uvi": 0,
      "clouds": 1,
      "visibility": 10000,
      "wind_speed": 3.23,
      "wind_deg": 354,
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "clear sky",
          "icon": "01n"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1609369200,
      "temp": 15.44,
      "feels_like": 12.52,
      "pressure": 1015,
      "humidity": 55,
      "dew_point": 6.52,
      "uvi": 0,
      "clouds": 6,
      "visibility": 10000,
      "wind_speed": 2.99,
      "wind_deg": 359,
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "clear sky",
          "icon": "01n"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1609372800,
      "temp": 14.9,
      "feels_like": 12.34,
      "pressure": 1015,
      "humidity": 58,
      "dew_point": 6.82,
      "uvi": 0,
      "clouds": 8,
      "visibility": 10000,
      "wind_speed": 2.57,
      "wind_deg": 5,
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "clear sky",
          "icon": "01n"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1609376400,
      "temp": 14.68,
      "feels_like": 12.22,
      "pressure": 1016,
      "humidity": 60,
      "dew_point": 7.15,
      "uvi": 0,
      "clouds": 43,
      "visibility": 10000,
      "wind_speed": 2.51,
      "wind_deg": 2,
      "weather": [
        {
          "id": 802,
          "main": "Clouds",
          "description": "scattered clouds",
          "icon": "03d"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1609380000,
      "temp": 17.18,
      "feels_like": 14.42,
      "pressure": 1017,
      "humidity": 53,
      "dew_point": 7.79,
      "uvi": 0.57,
      "clouds": 66,
      "visibility": 10000,
      "wind_speed": 3.11,
      "wind_deg": 357,
      "weather": [
        {
          "id": 803,
          "main": "Clouds",
          "description": "broken clouds",
          "icon": "04d"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1609383600,
      "temp": 20.56,
      "feels_like": 17.37,
      "pressure": 1018,
      "humidity": 44,
      "dew_point": 8.2,
      "uvi": 1.8,
      "clouds": 65,
      "visibility": 10000,
      "wind_speed": 3.85,
      "wind_deg": 359,
      "weather": [
        {
          "id": 803,
          "main": "Clouds",
          "description": "broken clouds",
          "icon": "04d"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1609387200,
      "temp": 23.35,
      "feels_like": 19.53,
      "pressure": 1018,
      "humidity": 37,
      "dew_point": 7.99,
      "uvi": 3.57,
      "clouds": 58,
      "visibility": 10000,
      "wind_speed": 4.74,
      "wind_deg": 358,
      "weather": [
        {
          "id": 803,
          "main": "Clouds",
          "description": "broken clouds",
          "icon": "04d"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1609390800,
      "temp": 25.25,
      "feels_like": 21.11,
      "pressure": 1017,
      "humidity": 32,
      "dew_point": 7.49,
      "uvi": 5.19,
      "clouds": 47,
      "visibility": 10000,
      "wind_speed": 5.04,
      "wind_deg": 359,
      "weather": [
        {
          "id": 802,
          "main": "Clouds",
          "description": "scattered clouds",
          "icon": "03d"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1609394400,
      "temp": 26.56,
      "feels_like": 22.12,
      "pressure": 1016,
      "humidity": 27,
      "dew_point": 6.52,
      "uvi": 5.94,
      "clouds": 46,
      "visibility": 10000,
      "wind_speed": 5.04,
      "wind_deg": 357,
      "weather": [
        {
          "id": 802,
          "main": "Clouds",
          "description": "scattered clouds",
          "icon": "03d"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1609398000,
      "temp": 27.55,
      "feels_like": 22.86,
      "pressure": 1015,
      "humidity": 24,
      "dew_point": 5.72,
      "uvi": 5.53,
      "clouds": 100,
      "visibility": 10000,
      "wind_speed": 5.14,
      "wind_deg": 354,
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04d"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1609401600,
      "temp": 28.16,
      "feels_like": 23.35,
      "pressure": 1014,
      "humidity": 23,
      "dew_point": 5.19,
      "uvi": 4.07,
      "clouds": 100,
      "visibility": 10000,
      "wind_speed": 5.28,
      "wind_deg": 353,
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04d"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1609405200,
      "temp": 28.11,
      "feels_like": 23.3,
      "pressure": 1014,
      "humidity": 23,
      "dew_point": 5.1,
      "uvi": 2.27,
      "clouds": 100,
      "visibility": 10000,
      "wind_speed": 5.27,
      "wind_deg": 355,
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04d"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1609408800,
      "temp": 27.39,
      "feels_like": 22.73,
      "pressure": 1014,
      "humidity": 24,
      "dew_point": 5.14,
      "uvi": 0.83,
      "clouds": 100,
      "visibility": 10000,
      "wind_speed": 5.06,
      "wind_deg": 360,
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04d"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1609412400,
      "temp": 25.47,
      "feels_like": 21.95,
      "pressure": 1014,
      "humidity": 28,
      "dew_point": 5.88,
      "uvi": 0.13,
      "clouds": 99,
      "visibility": 10000,
      "wind_speed": 3.6,
      "wind_deg": 13,
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04d"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1609416000,
      "temp": 22.35,
      "feels_like": 19.05,
      "pressure": 1014,
      "humidity": 33,
      "dew_point": 5.36,
      "uvi": 0,
      "clouds": 99,
      "visibility": 10000,
      "wind_speed": 3.19,
      "wind_deg": 23,
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04n"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1609419600,
      "temp": 21.28,
      "feels_like": 18.06,
      "pressure": 1015,
      "humidity": 34,
      "dew_point": 4.98,
      "uvi": 0,
      "clouds": 62,
      "visibility": 10000,
      "wind_speed": 2.93,
      "wind_deg": 24,
      "weather": [
        {
          "id": 803,
          "main": "Clouds",
          "description": "broken clouds",
          "icon": "04n"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1609423200,
      "temp": 20.48,
      "feels_like": 17.42,
      "pressure": 1015,
      "humidity": 35,
      "dew_point": 4.66,
      "uvi": 0,
      "clouds": 56,
      "visibility": 10000,
      "wind_speed": 2.62,
      "wind_deg": 13,
      "weather": [
        {
          "id": 803,
          "main": "Clouds",
          "description": "broken clouds",
          "icon": "04n"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1609426800,
      "temp": 19.79,
      "feels_like": 16.64,
      "pressure": 1016,
      "humidity": 36,
      "dew_point": 4.52,
      "uvi": 0,
      "clouds": 58,
      "visibility": 10000,
      "wind_speed": 2.69,
      "wind_deg": 2,
      "weather": [
        {
          "id": 803,
          "main": "Clouds",
          "description": "broken clouds",
          "icon": "04n"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1609430400,
      "temp": 19.11,
      "feels_like": 15.76,
      "pressure": 1016,
      "humidity": 38,
      "dew_point": 4.54,
      "uvi": 0,
      "clouds": 58,
      "visibility": 10000,
      "wind_speed": 3.03,
      "wind_deg": 359,
      "weather": [
        {
          "id": 803,
          "main": "Clouds",
          "description": "broken clouds",
          "icon": "04n"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1609434000,
      "temp": 18.47,
      "feels_like": 14.98,
      "pressure": 1016,
      "humidity": 39,
      "dew_point": 4.62,
      "uvi": 0,
      "clouds": 51,
      "visibility": 10000,
      "wind_speed": 3.17,
      "wind_deg": 359,
      "weather": [
        {
          "id": 803,
          "main": "Clouds",
          "description": "broken clouds",
          "icon": "04n"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1609437600,
      "temp": 17.76,
      "feels_like": 14.24,
      "pressure": 1016,
      "humidity": 41,
      "dew_point": 4.51,
      "uvi": 0,
      "clouds": 52,
      "visibility": 10000,
      "wind_speed": 3.23,
      "wind_deg": 0,
      "weather": [
        {
          "id": 803,
          "main": "Clouds",
          "description": "broken clouds",
          "icon": "04n"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1609441200,
      "temp": 17.04,
      "feels_like": 13.54,
      "pressure": 1016,
      "humidity": 42,
      "dew_point": 4.14,
      "uvi": 0,
      "clouds": 72,
      "visibility": 10000,
      "wind_speed": 3.12,
      "wind_deg": 4,
      "weather": [
        {
          "id": 803,
          "main": "Clouds",
          "description": "broken clouds",
          "icon": "04n"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1609444800,
      "temp": 16.45,
      "feels_like": 12.9,
      "pressure": 1015,
      "humidity": 42,
      "dew_point": 3.83,
      "uvi": 0,
      "clouds": 85,
      "visibility": 10000,
      "wind_speed": 3.06,
      "wind_deg": 4,
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04n"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1609448400,
      "temp": 16.04,
      "feels_like": 12.49,
      "pressure": 1015,
      "humidity": 43,
      "dew_point": 3.73,
      "uvi": 0,
      "clouds": 75,
      "visibility": 10000,
      "wind_speed": 3.04,
      "wind_deg": 359,
      "weather": [
        {
          "id": 803,
          "main": "Clouds",
          "description": "broken clouds",
          "icon": "04n"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1609452000,
      "temp": 15.65,
      "feels_like": 12.15,
      "pressure": 1015,
      "humidity": 44,
      "dew_point": 3.61,
      "uvi": 0,
      "clouds": 64,
      "visibility": 10000,
      "wind_speed": 2.97,
      "wind_deg": 354,
      "weather": [
        {
          "id": 803,
          "main": "Clouds",
          "description": "broken clouds",
          "icon": "04n"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1609455600,
      "temp": 15.23,
      "feels_like": 11.74,
      "pressure": 1015,
      "humidity": 45,
      "dew_point": 3.47,
      "uvi": 0,
      "clouds": 55,
      "visibility": 10000,
      "wind_speed": 2.94,
      "wind_deg": 352,
      "weather": [
        {
          "id": 803,
          "main": "Clouds",
          "description": "broken clouds",
          "icon": "04n"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1609459200,
      "temp": 14.76,
      "feels_like": 11,
      "pressure": 1016,
      "humidity": 46,
      "dew_point": 3.4,
      "uvi": 0,
      "clouds": 49,
      "visibility": 10000,
      "wind_speed": 3.29,
      "wind_deg": 347,
      "weather": [
        {
          "id": 802,
          "main": "Clouds",
          "description": "scattered clouds",
          "icon": "03n"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1609462800,
      "temp": 14.32,
      "feels_like": 10.49,
      "pressure": 1016,
      "humidity": 48,
      "dew_point": 3.51,
      "uvi": 0,
      "clouds": 33,
      "visibility": 10000,
      "wind_speed": 3.44,
      "wind_deg": 346,
      "weather": [
        {
          "id": 802,
          "main": "Clouds",
          "description": "scattered clouds",
          "icon": "03d"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1609466400,
      "temp": 16.61,
      "feels_like": 12.82,
      "pressure": 1017,
      "humidity": 43,
      "dew_point": 4.13,
      "uvi": 0.55,
      "clouds": 49,
      "visibility": 10000,
      "wind_speed": 3.53,
      "wind_deg": 346,
      "weather": [
        {
          "id": 802,
          "main": "Clouds",
          "description": "scattered clouds",
          "icon": "03d"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1609470000,
      "temp": 19.92,
      "feels_like": 16.1,
      "pressure": 1018,
      "humidity": 35,
      "dew_point": 4.24,
      "uvi": 1.75,
      "clouds": 62,
      "visibility": 10000,
      "wind_speed": 3.57,
      "wind_deg": 351,
      "weather": [
        {
          "id": 803,
          "main": "Clouds",
          "description": "broken clouds",
          "icon": "04d"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1609473600,
      "temp": 22.54,
      "feels_like": 18.65,
      "pressure": 1019,
      "humidity": 30,
      "dew_point": 4.37,
      "uvi": 3.52,
      "clouds": 64,
      "visibility": 10000,
      "wind_speed": 3.7,
      "wind_deg": 352,
      "weather": [
        {
          "id": 803,
          "main": "Clouds",
          "description": "broken clouds",
          "icon": "04d"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1609477200,
      "temp": 24.57,
      "feels_like": 20.47,
      "pressure": 1018,
      "humidity": 26,
      "dew_point": 3.99,
      "uvi": 5.11,
      "clouds": 59,
      "visibility": 10000,
      "wind_speed": 3.92,
      "wind_deg": 351,
      "weather": [
        {
          "id": 803,
          "main": "Clouds",
          "description": "broken clouds",
          "icon": "04d"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1609480800,
      "temp": 26.16,
      "feels_like": 21.76,
      "pressure": 1017,
      "humidity": 22,
      "dew_point": 3.11,
      "uvi": 5.85,
      "clouds": 56,
      "visibility": 10000,
      "wind_speed": 4.08,
      "wind_deg": 346,
      "weather": [
        {
          "id": 803,
          "main": "Clouds",
          "description": "broken clouds",
          "icon": "04d"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1609484400,
      "temp": 27.43,
      "feels_like": 22.59,
      "pressure": 1015,
      "humidity": 19,
      "dew_point": 2.46,
      "uvi": 5.42,
      "clouds": 52,
      "visibility": 10000,
      "wind_speed": 4.47,
      "wind_deg": 340,
      "weather": [
        {
          "id": 803,
          "main": "Clouds",
          "description": "broken clouds",
          "icon": "04d"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1609488000,
      "temp": 28.06,
      "feels_like": 23.08,
      "pressure": 1014,
      "humidity": 18,
      "dew_point": 2.01,
      "uvi": 4,
      "clouds": 47,
      "visibility": 10000,
      "wind_speed": 4.61,
      "wind_deg": 336,
      "weather": [
        {
          "id": 802,
          "main": "Clouds",
          "description": "scattered clouds",
          "icon": "03d"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1609491600,
      "temp": 28.17,
      "feels_like": 23.25,
      "pressure": 1013,
      "humidity": 18,
      "dew_point": 1.69,
      "uvi": 2.23,
      "clouds": 37,
      "visibility": 10000,
      "wind_speed": 4.54,
      "wind_deg": 338,
      "weather": [
        {
          "id": 802,
          "main": "Clouds",
          "description": "scattered clouds",
          "icon": "03d"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1609495200,
      "temp": 27.56,
      "feels_like": 22.79,
      "pressure": 1013,
      "humidity": 18,
      "dew_point": 1.73,
      "uvi": 0.83,
      "clouds": 29,
      "visibility": 10000,
      "wind_speed": 4.21,
      "wind_deg": 342,
      "weather": [
        {
          "id": 802,
          "main": "Clouds",
          "description": "scattered clouds",
          "icon": "03d"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1609498800,
      "temp": 25.51,
      "feels_like": 21.78,
      "pressure": 1013,
      "humidity": 22,
      "dew_point": 2.83,
      "uvi": 0.13,
      "clouds": 23,
      "visibility": 10000,
      "wind_speed": 2.99,
      "wind_deg": 348,
      "weather": [
        {
          "id": 801,
          "main": "Clouds",
          "description": "few clouds",
          "icon": "02d"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1609502400,
      "temp": 22.17,
      "feels_like": 18.74,
      "pressure": 1014,
      "humidity": 26,
      "dew_point": 2.12,
      "uvi": 0,
      "clouds": 20,
      "visibility": 10000,
      "wind_speed": 2.45,
      "wind_deg": 358,
      "weather": [
        {
          "id": 801,
          "main": "Clouds",
          "description": "few clouds",
          "icon": "02n"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1609506000,
      "temp": 20.74,
      "feels_like": 17.48,
      "pressure": 1015,
      "humidity": 29,
      "dew_point": 2.45,
      "uvi": 0,
      "clouds": 0,
      "visibility": 10000,
      "wind_speed": 2.28,
      "wind_deg": 12,
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "clear sky",
          "icon": "01n"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1609509600,
      "temp": 19.8,
      "feels_like": 16.68,
      "pressure": 1015,
      "humidity": 32,
      "dew_point": 2.87,
      "uvi": 0,
      "clouds": 0,
      "visibility": 10000,
      "wind_speed": 2.22,
      "wind_deg": 17,
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "clear sky",
          "icon": "01n"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1609513200,
      "temp": 19.3,
      "feels_like": 16.18,
      "pressure": 1016,
      "humidity": 33,
      "dew_point": 3.05,
      "uvi": 0,
      "clouds": 0,
      "visibility": 10000,
      "wind_speed": 2.21,
      "wind_deg": 17,
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "clear sky",
          "icon": "01n"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1609516800,
      "temp": 18.89,
      "feels_like": 15.77,
      "pressure": 1016,
      "humidity": 34,
      "dew_point": 3.07,
      "uvi": 0,
      "clouds": 0,
      "visibility": 10000,
      "wind_speed": 2.23,
      "wind_deg": 9,
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "clear sky",
          "icon": "01n"
        }
      ],
      "pop": 0
    }
  ],
  "daily": [
    {
      "dt": 1609306200,
      "sunrise": 1609289141,
      "sunset": 1609327903,
      "temp": {
        "day": 25.13,
        "min": 14.99,
        "max": 28.39,
        "night": 16,
        "eve": 25.82,
        "morn": 15.62
      },
      "feels_like": {
        "day": 21.07,
        "night": 14.62,
        "eve": 22,
        "morn": 12.55
      },
      "pressure": 1018,
      "humidity": 25,
      "dew_point": 4.22,
      "wind_speed": 3.83,
      "wind_deg": 353,
      "weather": [
        {
          "id": 802,
          "main": "Clouds",
          "description": "scattered clouds",
          "icon": "03d"
        }
      ],
      "clouds": 38,
      "pop": 0,
      "uvi": 5.98
    },
    {
      "dt": 1609392600,
      "sunrise": 1609375561,
      "sunset": 1609414339,
      "temp": {
        "day": 25.25,
        "min": 14.68,
        "max": 28.16,
        "night": 18.47,
        "eve": 25.47,
        "morn": 15.44
      },
      "feels_like": {
        "day": 21.11,
        "night": 14.98,
        "eve": 21.95,
        "morn": 12.52
      },
      "pressure": 1017,
      "humidity": 32,
      "dew_point": 7.49,
      "wind_speed": 5.04,
      "wind_deg": 359,
      "weather": [
        {
          "id": 802,
          "main": "Clouds",
          "description": "scattered clouds",
          "icon": "03d"
        }
      ],
      "clouds": 47,
      "pop": 0,
      "uvi": 5.94
    },
    {
      "dt": 1609479000,
      "sunrise": 1609461979,
      "sunset": 1609500776,
      "temp": {
        "day": 24.57,
        "min": 14.32,
        "max": 28.17,
        "night": 18.35,
        "eve": 25.51,
        "morn": 15.23
      },
      "feels_like": {
        "day": 20.47,
        "night": 15.05,
        "eve": 21.78,
        "morn": 11.74
      },
      "pressure": 1018,
      "humidity": 26,
      "dew_point": 3.99,
      "wind_speed": 3.92,
      "wind_deg": 351,
      "weather": [
        {
          "id": 803,
          "main": "Clouds",
          "description": "broken clouds",
          "icon": "04d"
        }
      ],
      "clouds": 59,
      "pop": 0,
      "uvi": 5.85
    },
    {
      "dt": 1609565400,
      "sunrise": 1609548396,
      "sunset": 1609587213,
      "temp": {
        "day": 24.09,
        "min": 13.92,
        "max": 27.96,
        "night": 18.1,
        "eve": 25.27,
        "morn": 14.77
      },
      "feels_like": {
        "day": 19.79,
        "night": 15.4,
        "eve": 21.71,
        "morn": 11.57
      },
      "pressure": 1017,
      "humidity": 22,
      "dew_point": 1.42,
      "wind_speed": 3.53,
      "wind_deg": 338,
      "weather": [
        {
          "id": 802,
          "main": "Clouds",
          "description": "scattered clouds",
          "icon": "03d"
        }
      ],
      "clouds": 38,
      "pop": 0,
      "uvi": 5.94
    },
    {
      "dt": 1609651800,
      "sunrise": 1609634813,
      "sunset": 1609673651,
      "temp": {
        "day": 26.51,
        "min": 14.74,
        "max": 28.99,
        "night": 19.38,
        "eve": 23.23,
        "morn": 14.74
      },
      "feels_like": {
        "day": 22.75,
        "night": 16.87,
        "eve": 19.98,
        "morn": 11.72
      },
      "pressure": 1015,
      "humidity": 21,
      "dew_point": 2.92,
      "wind_speed": 3.08,
      "wind_deg": 345,
      "weather": [
        {
          "id": 803,
          "main": "Clouds",
          "description": "broken clouds",
          "icon": "04d"
        }
      ],
      "clouds": 78,
      "pop": 0,
      "uvi": 5.96
    },
    {
      "dt": 1609738200,
      "sunrise": 1609721228,
      "sunset": 1609760090,
      "temp": {
        "day": 27.88,
        "min": 16.74,
        "max": 30.09,
        "night": 20.75,
        "eve": 24.83,
        "morn": 16.74
      },
      "feels_like": {
        "day": 24.67,
        "night": 18.57,
        "eve": 22.09,
        "morn": 14.04
      },
      "pressure": 1015,
      "humidity": 24,
      "dew_point": 5.77,
      "wind_speed": 3.1,
      "wind_deg": 353,
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "clear sky",
          "icon": "01d"
        }
      ],
      "clouds": 0,
      "pop": 0,
      "uvi": 6.1
    },
    {
      "dt": 1609824600,
      "sunrise": 1609807641,
      "sunset": 1609846529,
      "temp": {
        "day": 29.39,
        "min": 17.64,
        "max": 31.44,
        "night": 21.16,
        "eve": 25.42,
        "morn": 17.64
      },
      "feels_like": {
        "day": 25.89,
        "night": 19.21,
        "eve": 23.05,
        "morn": 15.32
      },
      "pressure": 1015,
      "humidity": 25,
      "dew_point": 7.41,
      "wind_speed": 4.1,
      "wind_deg": 345,
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "clear sky",
          "icon": "01d"
        }
      ],
      "clouds": 1,
      "pop": 0,
      "uvi": 7
    },
    {
      "dt": 1609911000,
      "sunrise": 1609894054,
      "sunset": 1609932969,
      "temp": {
        "day": 30.51,
        "min": 18.77,
        "max": 32.76,
        "night": 22.22,
        "eve": 27.09,
        "morn": 18.77
      },
      "feels_like": {
        "day": 27.74,
        "night": 20.97,
        "eve": 25.35,
        "morn": 16.51
      },
      "pressure": 1013,
      "humidity": 24,
      "dew_point": 8.18,
      "wind_speed": 3.17,
      "wind_deg": 356,
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "clear sky",
          "icon": "01d"
        }
      ],
      "clouds": 0,
      "pop": 0,
      "uvi": 7
    }
  ]
}
    """;

    // if (res.statusCode == 200) {
    Map<String, dynamic> map = jsonDecode(rawJson);
    Weather weather = Weather(map['hourly'][1]["temp"], map['current']["temp"],
        map["daily"][1]["temp"]["day"]);
    setState(() {
      _currentWeather = weather;
    });
    // return weather;
    // } else {
    // throw "Can't get weather Data.";
    // }
  }
}
