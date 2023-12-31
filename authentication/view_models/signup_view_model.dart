import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test_app/authentication/authentication_repo.dart';
import 'package:flutter_test_app/screens/home.dart';
import 'package:flutter_test_app/users/view_models/user_view_model.dart';
import 'package:flutter_test_app/utils.dart';
import 'package:go_router/go_router.dart';

class SignUpViewModel extends AsyncNotifier<void> {
  late final AuthenticationRepository _authRepo;
  @override
  FutureOr<void> build() {
    _authRepo = ref.watch(authRepo);
  }

  Future<void> signUp(BuildContext context) async {
    state = AsyncValue.loading();
    final users = ref.watch(usersProvider.notifier);
    final form = ref.watch(signUpForm);
    state = await AsyncValue.guard(() async {
      final userCredential = await _authRepo.signUp(
        form['email'],
        form['password'],
      );

      await users.createProfile(userCredential);
    });
    if (state.hasError) {
      showFirebaseErrorSnack(context, state.error);
    } else {
      context.goNamed(Home.routeName);
    }
  }
}

final signUpForm = StateProvider((ref) => {});

final signUpProvider = AsyncNotifierProvider<SignUpViewModel, void>(
  () => SignUpViewModel(),
);
