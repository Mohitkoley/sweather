import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(),
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String smiley = "🥵";
  Color BackgroundColor = Colors.red;
  int Degrees = 45;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BackgroundColor,
      appBar: AppBar(
        title: Text("Weather"),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(smiley,
              style: TextStyle(
                fontSize: 100,
              )),
          SizedBox(height: 24),
          Text(
            "$Degrees°C",
            style: TextStyle(fontSize: 80),
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.transparent,
                padding: EdgeInsets.all(20),
              ),
              onPressed: () => changeWeather(),
              child: const Text(
                "Change Weather",
                style: TextStyle(fontSize: 24, color: Colors.black),
              )),
        ]),
      ),
    );
  }

  void changeWeather() {
    final counter = Random().nextInt(6);
    setState(() {
      switch (counter) {
        case 0:
          smiley = "🥶";
          Degrees = nextNumber(min: -20, max: 0);
          BackgroundColor = Colors.blueAccent.shade700;
          break;
        case 1:
          smiley = "🥵";
          Degrees = nextNumber(min: 30, max: 45);
          BackgroundColor = Colors.red;
          break;

        case 3:
          smiley = "☁️";
          Degrees = nextNumber(min: 5, max: 20);
          BackgroundColor = Colors.deepPurple;
          break;

        case 4:
          smiley = "❄️";
          Degrees = nextNumber(min: -5, max: 3);
          BackgroundColor = Colors.blueAccent;
          break;

        case 5:
          smiley = "⛅";
          Degrees = nextNumber(min: 20, max: 30);
          BackgroundColor = Colors.orangeAccent;
          break;
      }
    });
  }

  int nextNumber({required int min, required int max}) =>
      min + Random().nextInt(max - min + 1);
}
