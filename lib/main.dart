import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:miesp/local_storage/local_storage.dart';
import 'package:miesp/miesp.dart';
import 'package:miesp/theme/custom_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();

  init();

  runApp(GetMaterialApp(
    home: const MIESP(),
    debugShowCheckedModeBanner: false,
    theme: AppTheme.createLightTheme(),
    darkTheme: AppTheme.createLightTheme(),
  ));
}

Future<void> init() async {
  await LocalStorage.getInstance()?.initLocalStorage();
}
