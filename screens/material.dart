import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test_app/router.dart';
import 'package:flutter_test_app/settings/view_models/darkmode_config_vm.dart';

class MaterialAppWidget extends ConsumerWidget {
  const MaterialAppWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      routerConfig: router,
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
