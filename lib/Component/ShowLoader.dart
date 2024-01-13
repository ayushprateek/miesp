import 'package:flutter/material.dart';

void showLoader(BuildContext context, {bool barrierDismissible = false}) {
  showDialog(
    barrierDismissible: barrierDismissible,
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: Container(
          height: MediaQuery.of(context).size.height / 20,
          width: MediaQuery.of(context).size.width / 1.5,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      );
    },
  );
}
