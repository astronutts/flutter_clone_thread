import 'package:flutter/material.dart';

class Boardtype extends ChangeNotifier {
  String path = "";

  void getpath(String data) {
    path = data;
    notifyListeners();
  }
}

final boardtype = Boardtype();
