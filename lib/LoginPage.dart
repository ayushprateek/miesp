import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:litsales/Component/AppConfig.dart';
import 'package:litsales/Component/CustomColor.dart';
import 'package:litsales/Component/CustomFont.dart';
import 'package:litsales/Component/GetTextField.dart';
import 'package:litsales/Component/KeyboardVisible.dart';
import 'package:litsales/Component/SnackbarComponent.dart';
import 'package:litsales/ui/SalesQuotationUI.dart';

class LoginPage extends StatefulWidget {
  static bool hasSynced = false;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  double div = 1.35;

  final key = GlobalKey<ScaffoldState>();
  bool obscurePassword = true;
  final ScrollController _scrollController = ScrollController();
  bool isLoading = false;

  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  String getHashedPassword() {
    var stringInBytes = utf8.encode(password.text);
    String value = sha256.convert(stringInBytes).toString();
    return value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 60,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Container(
                      // width: MediaQuery.of(context).size.width/3,
                      // height: MediaQuery.of(context).size.height/15,
                      color: barColor,
                      child: Image.asset(
                        logoPath,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              Divider(
                color: Colors.grey,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Center(
                  child: Container(
                    color: Colors.white,
                    child: Text(
                      "Welcome!",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          fontFamily: custom_font),
                    ),
                  ),
                ),
              ),
              Center(
                child: Container(
                  color: Colors.white,
                  child: Text(
                    "Please enter username and password!",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        fontFamily: custom_font),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, right: 8),
                child: getTextFieldWithoutLookup(
                  controller: username,
                  labelText: 'Username',
                  style: new TextStyle(
                    fontFamily: "Poppins",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, right: 8),
                child: getTextFieldWithoutLookup(
                    labelText: 'Password',
                    controller: password,
                    maxLines: 1,
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            obscurePassword = !obscurePassword;
                          });
                        },
                        icon: Icon(obscurePassword
                            ? Icons.visibility
                            : Icons.visibility_off)),
                    obscureText: obscurePassword),
              ),
              if (keyboardIsVisible(
                  context: context, scrollController: _scrollController)) ...[
                const SizedBox(
                  height: 30,
                ),
                _buttonContainer(),
              ],
            ],
          ),
        ),
      ),
      bottomNavigationBar: !keyboardIsVisible(
              context: context, scrollController: _scrollController)
          ? _buttonContainer()
          : null,
    );
  }

  Widget _buttonContainer() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 13,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Material(
          borderRadius: BorderRadius.circular(10.0),
          color: barColor,
          elevation: 0.0,
          child: isLoading
              ? Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                )
              : MaterialButton(

                  onPressed: () {
                    try {
                      _onLogin();
                    } catch (e) {
                      getErrorSnackBar('Something went wrong');
                    }
                  },
                  minWidth: MediaQuery.of(context).size.width,
                  child: Text(
                    "Proceed Securely",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0),
                  ),
                ),
        ),
      ),
    );
  }

  _onLogin() async {
    if (username.text.isEmpty || password.text.isEmpty) {
      getErrorSnackBar('Username or password ca not be empty');
    } else {
      setState(() {
        isLoading = true;
      });
      Future.delayed(Duration(seconds: 2));
      Get.to(SalesQuotationUI(0));
    }
  }
}
