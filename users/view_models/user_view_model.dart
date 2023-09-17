import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test_app/users/models/user_profile_model.dart';

class UsersViewModel extends AsyncNotifier<UserProfileModel> {
  @override
  FutureOr<UserProfileModel> build() {
    // TODO: implement build
    return UserProfileModel.empty();
  }
}

final usersProvider = AsyncNotifierProvider(
  () => UsersViewModel(),
);
