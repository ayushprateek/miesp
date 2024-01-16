import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:miesp/local_storage/local_storage.dart';
import 'package:miesp/miesp.dart';
import 'package:miesp/theme/custom_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterDownloader.initialize(
      debug: false, // optional: set to false to disable printing logs to console (default: true)
      ignoreSsl: true // option: set to false to disable working with http links (default: false)
  );

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
