import 'package:flutter_test_app/screens/activity_screen.dart';
import 'package:flutter_test_app/screens/home.dart';
import 'package:flutter_test_app/screens/home_screen.dart';
import 'package:flutter_test_app/screens/privacy_screen.dart';
import 'package:flutter_test_app/screens/search_screen.dart';
import 'package:flutter_test_app/settings/views/setting_screen.dart';
import 'package:flutter_test_app/screens/user_profile_screen.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: Home.routeName,
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
