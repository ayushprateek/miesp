import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:litsales/Component/CustomColor.dart';


showBackPressedWarning({required Function? onBackPressed,
String? text}) {
  try
  {
    showDialog(
      barrierDismissible: false,
      context: Get.context!,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            height: MediaQuery.of(context).size.height / 20,
            width: MediaQuery.of(context).size.width / 1.5,
            child: Text(
              text??"Your data is not saved. Are you sure you want to go back?",
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
          actions: [
            MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40),
              ),
              color: barColor,
              child: Text(
                'Cancel',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Get.back();
              },
            ),
            MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40),
              ),
              color: Colors.red,
              child: Text(
                'Ok',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () async {
                if (onBackPressed != null) {
                  onBackPressed();
                } else {
                  // Navigator.pushAndRemoveUntil(
                  //     context,
                  //     MaterialPageRoute(builder: (context) => Dashboard()),
                  //         (route) => false);
                }
              },
            ),
          ],
        );
      },
    );
  }
  catch(e)
  {

  }

}
