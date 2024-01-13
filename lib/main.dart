import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:litsales/Component/AppConfig.dart';
import 'package:litsales/Component/CustomColor.dart';
import 'package:litsales/Component/CustomLocalStorage.dart';
import 'package:litsales/LoginPage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await LocalStorage.getInstance()?.initLocalStorage();
  } catch (e) {
    //writeToLogFile(text: e.toString(), fileName: StackTrace.current.toString(), lineNo: 141);
    print(e.toString());
  }

  // ##################
  //rgba(88, 115, 254, 0.04);
  Map<int, Color> color = {
    50: Color.fromRGBO(0, 55, 119, .1),
    100: Color.fromRGBO(0, 55, 119, .2),
    200: Color.fromRGBO(0, 55, 119, .3),
    300: Color.fromRGBO(0, 55, 119, .4),
    400: Color.fromRGBO(0, 55, 119, .5),
    500: Color.fromRGBO(0, 55, 119, .6),
    600: Color.fromRGBO(0, 55, 119, .7),
    700: Color.fromRGBO(0, 55, 119, .8),
    800: Color.fromRGBO(0, 55, 119, .9),
    900: Color.fromRGBO(0, 55, 119, 1),
  };
  MaterialColor colorCustom = MaterialColor(0xFF5b84b1, color);
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: colorCustom,
          hintColor: barColor,
          appBarTheme: AppBarTheme(
              iconTheme: IconThemeData(
                color: Colors.white,
              ),
              titleTextStyle: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              )),
          buttonTheme: ButtonThemeData(
            buttonColor: barColor,
          ),
          iconTheme: IconThemeData(
            color: Colors.white,
          )),
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final key = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    navigate();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void navigate() async {
    await Future.delayed(Duration(seconds: 2));
    Get.to(() => LoginPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      backgroundColor: Colors.white,
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.asset(
                  logoPath,
                  // height: MediaQuery.of(context).size.height,
                  // width: MediaQuery.of(context).size.width,
                ),
              ),
            ),
            SpinKitRipple(
              color: backColor,
            )
          ]),
    );
  }
}
