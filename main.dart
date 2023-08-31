import 'package:flutter/material.dart';
import 'package:flutter_test_app/home.dart';

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
    return const MaterialApp(
      title: "Hey! I tried to .ddd.",
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
