import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(home: MyApp()),
  );
}

class MyApp extends StatelessWidget {
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
            ],
          ),
        ),
      ),
    );
  }
}
