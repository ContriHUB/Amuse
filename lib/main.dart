// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, avoid_unnecessary_containers

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:amuse/HomePage.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

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

class SplashScreenPage extends StatefulWidget {
  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 5),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomePage())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF2A2E30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.all(20.0),
            child: Image.asset(
              "assets/images/AMUSE.png",
              fit: BoxFit.contain,
            ),
          ),
          Container(
            margin: const EdgeInsets.all(20.0),
            child: SpinKitCubeGrid(
              size: 50,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
