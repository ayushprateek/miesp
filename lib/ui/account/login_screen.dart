import 'dart:convert';

import 'package:bill/models/customer_model.dart';
import 'package:bill/services/service_manager.dart';
import 'package:bill/theme/custom_font.dart';
import 'package:bill/theme/get_text_field.dart';
import 'package:bill/ui/components/check_keyboard_visibility.dart';
import 'package:bill/ui/components/elements_button.dart';
import 'package:bill/ui/components/elements_snackbar.dart';
import 'package:bill/ui/select_warehouse.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  double div = 1.35;

  final key = GlobalKey<ScaffoldState>();
  final ScrollController _scrollController = ScrollController();
  bool obscurePassword = true;
  bool isLoading = false;
  TextEditingController userEmail =
      TextEditingController(text: 'rahul@punditz.in');
  TextEditingController password = TextEditingController(text: 'punditz@123');

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
                    child:
                        SizedBox(height: 100, width: 100, child: FlutterLogo()),
                    // child: Container(
                    //   color: appPrimary,
                    //   child: Image.asset(
                    //     logoPath,
                    //     fit: BoxFit.cover,
                    //   ),
                    // ),
                  ),
                ),
              ),
              const Divider(
                color: Colors.grey,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Center(
                  child: Container(
                    color: Colors.white,
                    child: const Text(
                      "Welcome!",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          fontFamily: CustomFont.customFont),
                    ),
                  ),
                ),
              ),
              Center(
                child: Container(
                  color: Colors.white,
                  child: const Text(
                    "Please enter username and password!",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        fontFamily: CustomFont.customFont),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, right: 8),
                child: getTextFieldWithoutLookup(
                  controller: userEmail,
                  labelText: 'Username',
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
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     getHeadingText(text: 'Click here to ', fontSize: 15),
              //     TextButton(
              //       child: getHeadingText(
              //           text: 'Reset password',
              //           fontSize: 15,
              //           decoration: TextDecoration.underline,
              //           color: textFieldBorderColor),
              //       onPressed: () {
              //         Get.to(() => PasswordResetScreen(
              //               isComingFromLogin: true,
              //             ));
              //       },
              //     ),
              //   ],
              // ),
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: loadingButton(
        isLoading: isLoading,
        btnText: 'Log In',
        onPress: () {
          _onLogin();
        },
      ),
    );
  }

  void onSuccess(CustomerModel customerModel) {
    getSuccessSnackBar('Login successful');
    CustomerModel.setLoginCustomer(customerModel: customerModel);
    Get.to(() => SelectWarehouse(
          isComingFromLogin: true,
        ));
  }

  void onError() {
    getErrorSnackBar('Invalid credentials');
  }

  _onLogin() async {
    if (await ServiceManager.isInternetAvailable()) {
      ServiceManager.login(
          UserEmail: userEmail.text,
          Password: password.text,
          onSuccess: onSuccess,
          onError: onError);
    }
  }
}
