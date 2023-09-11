import 'package:flutter_test_app/activity_screen.dart';
import 'package:flutter_test_app/home.dart';
import 'package:flutter_test_app/home_screen.dart';
import 'package:flutter_test_app/privacy_screen.dart';
import 'package:flutter_test_app/search_screen.dart';
import 'package:flutter_test_app/setting_screen.dart';
import 'package:flutter_test_app/user_profile_screen.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: Home.routeName,
      builder: (context, state) => const Home(),
    ),
    GoRoute(
      path: HomeScreen.routeName,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: SearchScreen.routeName,
      builder: (context, state) => const SearchScreen(),
    ),
    GoRoute(
      path: ActivityScreen.routeName,
      builder: (context, state) => const ActivityScreen(),
    ),
    GoRoute(
      path: UserProfileScreen.routeName,
      builder: (context, state) => const UserProfileScreen(),
    ),
    GoRoute(
      path: SettingScreen.routeName,
      builder: (context, state) => const SettingScreen(),
    ),
    GoRoute(
      path: PrivacyScreen.routeName,
      builder: (context, state) => PrivacyScreen(),
    ),
  ],
);
