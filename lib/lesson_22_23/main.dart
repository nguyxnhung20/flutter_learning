import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learning/firebase_options.dart';
import 'package:flutter_learning/lesson_19/navigator_demo/screens/not_found_page.dart';
import 'package:flutter_learning/lesson_22_23/forgot_password/forgot_password_screen.dart';
import 'package:flutter_learning/lesson_22_23/home/home_screen.dart';
import 'package:flutter_learning/lesson_22_23/login/login_screen.dart';
import 'package:flutter_learning/lesson_22_23/root_page.dart';
import 'package:flutter_learning/lesson_22_23/theme/my_theme.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: MyTheme.darkTheme(),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(builder: (_) => const LoginScreen());
          case 'home':
            return MaterialPageRoute(builder: (_) => const HomeScreen());
          case 'forgot-password':
            return MaterialPageRoute(
                builder: (_) => const ForgotPasswordScreen());
          default:
            return MaterialPageRoute(builder: (_) => const NotFoundPage());
        }
      },
      home: const RootPage(),
    );
  }
}
