import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test_app/settings/models/darkmode_confing_model.dart';
import 'package:flutter_test_app/settings/repos/darkmode_config_repo.dart';

class DarkmodeConfigViewModel extends Notifier<DarkmodeConfigModel> {
  final DarkmodeConfigRepository _repository;

  DarkmodeConfigViewModel(this._repository);

  void setDarkmode(bool value) {
    _repository.setDarkmode(value);
    state = DarkmodeConfigModel(darkmode: value);
    print(value);
  }

  @override
  DarkmodeConfigModel build() {
    return DarkmodeConfigModel(darkmode: _repository.isDarkmode());
  }
}

final darkModeConfigProvider =
    NotifierProvider<DarkmodeConfigViewModel, DarkmodeConfigModel>(
  () => throw UnimplementedError(),
);
