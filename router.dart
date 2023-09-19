import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test_app/authentication/authentication_repo.dart';
import 'package:flutter_test_app/authentication/screen/sign_up_screen.dart';
import 'package:flutter_test_app/screens/activity_screen.dart';
import 'package:flutter_test_app/screens/home.dart';
import 'package:flutter_test_app/screens/home_screen.dart';
import 'package:flutter_test_app/authentication/screen/login_screen.dart';
import 'package:flutter_test_app/screens/privacy_screen.dart';
import 'package:flutter_test_app/screens/search_screen.dart';
import 'package:flutter_test_app/settings/views/setting_screen.dart';
import 'package:flutter_test_app/users/screen/user_profile_screen.dart';
import 'package:go_router/go_router.dart';

final routerProvider = Provider((ref) {
  //ref.watch(authState);
  return GoRouter(
    initialLocation: "/home",
    redirect: (context, state) {
      final isLoggedIn = ref.watch(authRepo).isLoggedIn;
      if (!isLoggedIn) {
        if (state.subloc != SignUpScreen.routeURL &&
            state.subloc != LoginScreen.routeURL) {
          return SignUpScreen.routeURL;
        }
      }
      return null;
    },
    routes: [
      GoRoute(
        name: SignUpScreen.routeName,
        path: SignUpScreen.routeURL,
        builder: (context, state) => const SignUpScreen(),
      ),
      GoRoute(
        name: LoginScreen.routeName,
        path: LoginScreen.routeURL,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        name: Home.routeName,
        path: Home.routeURL,
        builder: (context, state) => const Home(),
      ),
      GoRoute(
        name: HomeScreen.routeName,
        path: HomeScreen.routeURL,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        name: SearchScreen.routeName,
        path: SearchScreen.routeURL,
        builder: (context, state) => const SearchScreen(),
      ),
      GoRoute(
        name: ActivityScreen.routeName,
        path: ActivityScreen.routeURL,
        builder: (context, state) => const ActivityScreen(),
      ),
      GoRoute(
        name: UserProfileScreen.routeName,
        path: UserProfileScreen.routeURL,
        builder: (context, state) => const UserProfileScreen(),
      ),
      GoRoute(
        name: SettingScreen.routeName,
        path: SettingScreen.routeURL,
        builder: (context, state) => const SettingScreen(),
      ),
      GoRoute(
        name: PrivacyScreen.routeName,
        path: PrivacyScreen.routeURL,
        builder: (context, state) => PrivacyScreen(),
      ),
    ],
  );
});
