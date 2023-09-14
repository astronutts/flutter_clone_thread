import 'package:flutter/material.dart';
import 'package:flutter_test_app/settings/models/darkmode_confing_model.dart';
import 'package:flutter_test_app/settings/repos/darkmode_config_repo.dart';

class DarkmodeConfigViewModel extends ChangeNotifier {
  final DarkmodeConfigRepository _repository;

  DarkmodeConfigViewModel(this._repository);

  late final DarkmodeConfigModel _model =
      DarkmodeConfigModel(darkmode: _repository.isDarkmode());

  bool get darkmode => _model.darkmode;

  void setDarkmode(bool value) {
    _repository.setDarkmode(value);
    _model.darkmode = value;
    print(value);
    notifyListeners();
  }
}
