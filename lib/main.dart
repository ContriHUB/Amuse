// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:amuse/HomePage.dart';
import 'package:splashscreen/splashscreen.dart';

class ThemeClass {
  static ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: Colors.white,
      colorScheme: const ColorScheme.light(),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.blue,
      ));

  static ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: Color(0xFF26282c),
      colorScheme: const ColorScheme.dark(),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF26282c),
      ));
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: ThemeClass.lightTheme,
      darkTheme: ThemeClass.darkTheme,
      home: SplashScreenPage(),
    );
  }
}

class SplashScreenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 5,
      navigateAfterSeconds: const HomePage(),
      backgroundColor: Color(0xFF2A2E30),
      image: Image.asset(
        "assets/images/AMUSE.png",
        fit: BoxFit.contain,
      ),
      photoSize: 150.0,
      loaderColor: Color.fromARGB(255, 126, 126, 126),
    );
  }
}
