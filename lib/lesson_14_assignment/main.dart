import 'package:flutter/material.dart';
import 'package:flutter_learning/lesson_14_assignment/weather_home_screen.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: WeatherHomeScreen(),
    );
  }
}