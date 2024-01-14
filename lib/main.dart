import 'package:bill/local_storage/local_storage.dart';
import 'package:bill/miesp.dart';
import 'package:bill/theme/custom_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
