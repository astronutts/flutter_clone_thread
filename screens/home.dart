// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test_app/utils.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'board_screen.dart';

class Home extends StatefulWidget {
  static String routeName = 'home';
  static String routeURL = "/home";
  const Home({super.key});

  @override
  State<Home> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        print(orientation);
        return BoardScreen();
      },
    );
  }
}
