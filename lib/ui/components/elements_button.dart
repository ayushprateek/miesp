import 'package:bill/theme/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget loadingButton({
  required bool isLoading,
  required String? btnText,
  required Function onPress,
  double fontSize = 20.0,
  Color? backColor = appPrimary,
  double rounded = 10,
  Color textColor = Colors.white,
}) {
  return Material(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(rounded)),
    elevation: 0.0,
    color: backColor,
    clipBehavior: Clip.antiAlias,
    child: isLoading
        ? const Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          )
        : MaterialButton(
            onPressed: isLoading ? null : onPress as Function(),
            minWidth: Get.width,
            color: backColor,
            child: Text(
              btnText ?? '',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: fontSize),
            ),
          ),
  );
}

IconButton getIconButton({
  IconData? icon,
  required Function onPressed,
  Color? iconColor,
  double iconSize = 22.0,
}) {
  return IconButton(
      onPressed: onPressed as Function(),
      icon: getIcon(icon, iconColor: iconColor, iconSize: iconSize));
}

Icon getIcon(IconData? icon, {Color? iconColor, double iconSize = 22.0}) {
  return Icon(
    icon,
    color: iconColor,
    size: iconSize,
  );
}
