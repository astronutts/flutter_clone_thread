// ignore_for_file: unused_import
import 'package:firebase_core/firebase_core.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test_app/firebase_options.dart';
import 'package:flutter_test_app/screens/activity_screen.dart';
import 'package:flutter_test_app/screens/home.dart';
import 'package:flutter_test_app/screens/home_screen.dart';
import 'package:flutter_test_app/screens/privacy_screen.dart';
import 'package:flutter_test_app/router.dart';
import 'package:flutter_test_app/screens/search_screen.dart';
import 'package:flutter_test_app/settings/repos/darkmode_config_repo.dart';
import 'package:flutter_test_app/settings/view_models/darkmode_config_vm.dart';
import 'package:flutter_test_app/settings/views/setting_screen.dart';
import 'package:flutter_test_app/users/screen/user_profile_screen.dart';
import 'package:flutter_test_app/video/video_recording_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final preferences = await SharedPreferences.getInstance();
  final repository = DarkmodeConfigRepository(preferences);

  runApp(
    ProviderScope(
      overrides: [
        darkModeConfigProvider.overrideWith(
          () => DarkmodeConfigViewModel(repository),
        )
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: ref.watch(routerProvider),
      themeMode: ref.watch(darkModeConfigProvider).darkmode
          ? ThemeMode.dark
          : ThemeMode.light,
      darkTheme: ThemeData(
        textTheme: Typography.whiteMountainView,
        scaffoldBackgroundColor: Colors.black,
        brightness: Brightness.dark,
      ),
      title: "Hey! I tried to .ddd.",
      debugShowCheckedModeBanner: false,
    );
  }
}
