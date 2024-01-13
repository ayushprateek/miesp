import 'package:bill/common/app_assets.dart';
import 'package:bill/common/textfield_validators.dart';
import 'package:bill/theme/custom_colors.dart';
import 'package:bill/theme/custom_text_widgets.dart';
import 'package:bill/theme/elements_screen.dart';
import 'package:bill/theme/get_text_field.dart';
import 'package:bill/ui/components/check_keyboard_visibility.dart';
import 'package:bill/ui/components/elements_button.dart';
import 'package:bill/ui/components/space_dividers.dart';
import 'package:bill/ui/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PasswordResetScreen extends StatefulWidget {
  bool isComingFromLogin;

  PasswordResetScreen({super.key, required this.isComingFromLogin});

  @override
  State<PasswordResetScreen> createState() => _PasswordResetScreenState();
}

class _PasswordResetScreenState extends State<PasswordResetScreen> {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _existingPassword = TextEditingController();
  final TextEditingController _newPassword = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  bool isLoading = false;
  final GlobalKey<FormState> _formKey = GlobalKey();
  bool _obscureExistingPassword = true,
      _obscureNewPassword = true,
      _obscureConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    return screenWithAppBar(
      title: 'Password Reset',
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Container(
                    // width: MediaQuery.of(context).size.width/3,
                    // height: MediaQuery.of(context).size.height/15,
                    color: appPrimary,
                    child: Image.asset(
                      logoPath,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const Divider(
                color: Colors.grey,
              ),
              Center(
                child: Container(
                  color: Colors.white,
                  child: getHeadingText(
                      text:
                          'Please enter username and existing password \nto change it!',
                      textAlign: TextAlign.center),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              _usernameTextFields(),
              _existingPasswordTextFields(),
              getHalfBetweenFields(),
              _newPasswordTextFields(),
              getHalfBetweenFields(),
              _confirmPasswordTextFields(),
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
      // floatingActionButton: FloatingActionButton(onPressed: (){},
      // child: getHeadingText(text: 'Save',color: Colors.white),)
    );
  }

  Widget _usernameTextFields() {
    return getTextFieldWithoutLookup(
      controller: _username,
      labelText: 'Username',
      validator: (String? text) {
        return validateEmpty(text, 'Username');
      },
    );
  }

  Widget _existingPasswordTextFields() {
    return getTextFieldWithoutLookup(
      controller: _existingPassword,
      labelText: 'Existing Password',
      validator: (String? text) {
        return validateEmpty(text, 'Existing Password');
      },
      maxLines: 1,
      suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              _obscureExistingPassword = !_obscureExistingPassword;
            });
          },
          icon: Icon(_obscureExistingPassword
              ? Icons.visibility
              : Icons.visibility_off)),
      obscureText: _obscureExistingPassword,
    );
  }

  Widget _newPasswordTextFields() {
    return getTextFieldWithoutLookup(
      controller: _newPassword,
      maxLines: 1,
      labelText: 'New Password',
      validator: (String? text) {
        return validateEmptyText(text, 'New Password');
      },
      suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              _obscureNewPassword = !_obscureNewPassword;
            });
          },
          icon: Icon(
              _obscureNewPassword ? Icons.visibility : Icons.visibility_off)),
      obscureText: _obscureNewPassword,
    );
  }

  Widget _confirmPasswordTextFields() {
    return getTextFieldWithoutLookup(
      controller: _confirmPassword,
      maxLines: 1,
      labelText: 'Confirm Password',
      validator: (String? text) {
        return validateEmptyText(text, 'Confirm Password');
      },
      suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              _obscureConfirmPassword = !_obscureConfirmPassword;
            });
          },
          icon: Icon(_obscureConfirmPassword
              ? Icons.visibility
              : Icons.visibility_off)),
      obscureText: _obscureConfirmPassword,
    );
  }

  String? validateEmptyText(String? text, String label) {
    if (text?.trim().toString() == null ||
        text?.trim().toString().isEmpty == true) {
      return '$label can not be empty';
    }
    if (_newPassword.text != _confirmPassword.text) {
      return 'New password and confirm password did not match';
    } else {
      return null;
    }
  }

  Widget _buttonContainer() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: loadingButton(
        isLoading: isLoading,
        btnText: 'Save',
        onPress: () {
          _onSave();
        },
      ),
    );
  }

  _onSave() {
    if (_formKey.currentState?.validate() == true) {
      if (widget.isComingFromLogin) {
        Get.to(() => const Dashboard());
      } else {
        Navigator.pop(context);
      }
    }
  }
}
