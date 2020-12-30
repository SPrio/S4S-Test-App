import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

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

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Position _currentPosition;

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
  }

  @override
  Widget build(BuildContext context) {
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
              Text(
                  "Location Co-ordinates: ${_currentPosition.latitude}, ${_currentPosition.longitude}"),
            ],
          ),
        ),
      ),
    );
  }
}
