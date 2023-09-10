// ignore_for_file: unused_import

import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_app/activity_screen.dart';
import 'package:flutter_test_app/home.dart';
import 'package:flutter_test_app/home_screen.dart';
import 'package:flutter_test_app/privacy_screen.dart';
import 'package:flutter_test_app/search_screen.dart';
import 'package:flutter_test_app/setting_screen.dart';
import 'package:flutter_test_app/video/video_recording_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      darkTheme: ThemeData(
        textTheme: Typography.whiteMountainView,
        scaffoldBackgroundColor: Colors.black,
        brightness: Brightness.dark,
      ),
      title: "Hey! I tried to .ddd.",
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => Home(),
        "/home": (context) => HomeScreen(),
        "/settings": (context) => SettingScreen(),
        "/privacy": (context) => PrivacyScreen(),
      },
    );
  }
}
