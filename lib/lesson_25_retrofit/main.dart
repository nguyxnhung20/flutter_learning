import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_learning/lesson_25_retrofit/presentation/screens/now_playing_movies_screen.dart';

void main(List<String> args) async {
  await dotenv.load(fileName: '.env');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NowPlayingMoviesScreen(),
    );
  }
}
