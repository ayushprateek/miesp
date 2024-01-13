import 'dart:async';

import 'package:bill/common/keys.dart';
import 'package:bill/local_storage/local_storage.dart';
import 'package:bill/theme/custom_theme.dart';
import 'package:bill/theme/elements_screen.dart';
import 'package:bill/ui/account/login_screen.dart';
import 'package:bill/ui/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OmSoftBill extends StatefulWidget {
  static _OmSoftBillState? _state;

  const OmSoftBill({Key? key}) : super(key: key);

  static void buildTheme(BuildContext context, bool? flagDarkTheme) async {
    _state?.buildTheme(flagDarkTheme);
  }

  static void setLocale(Locale locale) async {
    _state?.setLocale(locale);
  }

  @override
  State<OmSoftBill> createState() => _OmSoftBillState();
}

class _OmSoftBillState extends State<OmSoftBill> {
  @override
  void initState() {
    super.initState();

    initLocalStorage();
  }

  buildTheme(bool? flagDarkTheme) {
    setState(() {
      AppTheme.load(flagDarkTheme: flagDarkTheme ?? false);
    });
  }

  setLocale(Locale locale) {
    Get.locale = locale;
  }

  Future<void> initLocalStorage() async {
    await LocalStorage.getInstance()?.initLocalStorage();
    navigate();
  }



  navigate() async {
    String? customer = LocalStorage.getString(key: keyObjUser);
    await Future.delayed(const Duration(seconds: 2));
    //todo:
    // FlutterNativeSplash.remove();
    if (!mounted) {
      return;
    }
    if (customer == null || customer == '') {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const LoginPage()));
    } else {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const Dashboard()));
      // CustomerModel customerModel =
      //     CustomerModel.fromJson(jsonDecode(customer));
      // if (customerModel.email.isNotEmpty) {
      //   ServiceManager.loginViaEmail(
      //       email: customerModel.email,
      //       onError: (String error) {
      //         errorSnackBar(error);
      //         Timer(const Duration(seconds: 1), () {
      //           logout();
      //         });
      //       },
      //       onSuccess: () {
      //         Navigator.of(context).push(
      //             MaterialPageRoute(builder: (context) => const Dashboard()));
      //       });
      // }
    }
  }

  @override
  Widget build(BuildContext context) {
    return screenWithoutAppBar(body: const Center(child: FlutterLogo()));
  }
}
