import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_learning/lesson_24/core/utils/dot_env_util.dart';
import 'package:flutter_learning/lesson_24/screens/now_playing_movie_screen.dart';

Future<void> main() async {
  await DotEnvUtil.initDotEnv();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Now Playing Movies',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const NowPlayingMoviesScreen(),
      debugShowCheckedModeBanner: false, // Optional: Removes the debug banner
    );
  }
}
