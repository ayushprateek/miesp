// import 'dart:io';
//
// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import 'package:litsales/Component/SnackbarComponent.dart';
// import 'package:litsales/main.dart';
// import 'package:permission_handler/permission_handler.dart';
//
// // Future<String?> pickFile() async {
// //   FilePickerResult? result = await FilePicker.platform.pickFiles(
// //     type: FileType.custom,
// //     allowedExtensions: ['jpg','jpeg','png', 'pdf', 'doc','docx'],
// //   );
// //   if(result!=null)
// //     {
// //       return result.files[0].path;
// //     }
// //   else
// //     {
// //       return "";
// //     }
// //
// //   // if (result != null) {
// //   //   onSuccess(result);
// //   // }
// // }
// Future pickFile({required BuildContext context}) async {
//   try {
//     //Map<Permission, PermissionStatus> statuses = await [
//     //       Permission.videos,
//     //       Permission.photos,
//     //     ].request();
//     FilePickerResult? result = await FilePicker.platform.pickFiles(
//       type: FileType.custom,
//       allowedExtensions: ['jpg', 'jpeg', 'png', 'pdf', 'doc', 'docx'],
//     );
//     return result?.paths[0]??'';
//   } catch (e) {
//     // //writeToLogFile(text: e.toString(), fileName: StackTrace.current.toString(), lineNo: 141);
//     if (Platform.isAndroid) {
//       bool isFirstTime = localStorage?.getBool('objIsFirstTimeGallery') ?? true;
//       if (isFirstTime) {
//         localStorage?.setBool('objIsFirstTimeGallery', false);
//       } else {
//         if (await Permission.manageExternalStorage
//             .request()
//             .isPermanentlyDenied) {
//           askPermissionIfPermanentlyDenied(
//               permissionName: 'Manage External Storage', context: context);
//         } else if (await Permission.manageExternalStorage.request().isDenied) {
//           askPermissionIfPermanentlyDenied(
//               permissionName: 'Manage External Storage', context: context);
//         }
//       }
//     } else {
//       getErrorSnackBar('Permission denied');
//     }
//   }
// }
//
// // Future<void> _pickFile() async {
// //   final androidInfo = await DeviceInfoPlugin().androidInfo;
// //   late final Map<Permission, PermissionStatus> statusess;
// //
// //   if ((androidInfo.version.sdkInt ?? 0) <= 32) {
// //     statusess = await [
// //       Permission.storage,
// //     ].request();
// //   } else {
// //     statusess = await [Permission.photos, Permission.notification].request();
// //   }
// //
// //   var allAccepted = true;
// //   statusess.forEach((permission, status) {
// //     if (status != PermissionStatus.granted) {
// //       allAccepted = false;
// //     }
// //   });
// //
// //   if (allAccepted) {
// //     final FilePickerResult? result =
// //         await FilePicker.platform.pickFiles(type: FileType.image);
// //
// //     final path = result?.files.single.path;
// //   }
// // }
//
// void askPermissionIfPermanentlyDenied(
//     {required String permissionName, required BuildContext context}) async {
//   showDialogConfirmationCustomButton(
//       positiveButtonText: "Open Settings",
//       negativeButtonText: "Not Now",
//       onOkayPress: () {
//         Navigator.pop(context);
//         openAppSettings();
//       },
//       onDismiss: () {
//         Navigator.pop(context);
//       },
//       isShowNegative: true,
//       context: context,
//       title: "Please allow permission",
//       message:
//           'Please allow the Trade School App to access your $permissionName');
// }
//
// void showDialogConfirmationCustomButton(
//     {BuildContext? context,
//     bool? isSuccess = true,
//     String? title,
//     String? positiveButtonText,
//     String negativeButtonText = "",
//     bool isShowNegative = true,
//     String? message,
//     List<String>? messages,
//     Function? onDismiss,
//     Function? onOkayPress}) {
//   List<Widget> titleRowWidgets = [
//     if (title != "") _dialogTitle(context!, title, isSuccess!)
//   ];
//   Widget content = _dialogContent(context!, message, messages);
//   List<Widget> actions = [
//     // Container(
//     //     width: MediaQuery.of(context).size.width,
//     //     alignment: Alignment.center,
//     //     child: Row(
//     //
//     //       children: [
//     //         // if (!isShowNegative)
//     //         // const Spacer(),
//     //
//     //         if (isShowNegative) ...[
//     //           _dialogButtonNegative(context, negativeButtonText,
//     //               () => Navigator.of(context).pop(false)),
//     //         ],
//     //         if (isShowNegative)
//     //           _dialogButtonPositive(context, positiveButtonText, onOkayPress),
//     //       ],
//     //     )),
//     if (isShowNegative) ...[
//       _dialogButtonNegative(context, negativeButtonText,
//           onDismiss ?? () => Navigator.of(context).pop(false)),
//     ],
//     if (isShowNegative)
//       _dialogButtonPositive(context, positiveButtonText, onOkayPress),
//   ];
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       if (Platform.isIOS) {
//         return CupertinoAlertDialog(
//           title: Row(
//             children: titleRowWidgets,
//           ),
//           content: content,
//           actions: actions,
//         );
//       } else {
//         return AlertDialog(
//           title: Row(
//             children: titleRowWidgets,
//           ),
//           content: content,
//           actions: actions,
//         );
//       }
//     },
//   );
// }
//
// Widget _dialogContent(
//     BuildContext context, String? message, List<String?>? messages) {
//   if (message != null) {
//     return SizedBox(
//       width: MediaQuery.of(context).size.width * 0.7,
//       child: Text(
//         message,
//         textAlign: TextAlign.start,
//         style: const TextStyle(
//             fontWeight: FontWeight.w700,
//             fontSize: 16,
//             letterSpacing: 0.3,
//             color: Colors.black),
//       ),
//     );
//   }
//   if (messages != null && messages.isNotEmpty) {
//     String _content = "";
//     for (String? msg in messages) {
//       _content += msg ?? "";
//       if (messages.indexOf(msg) != messages.length - 1) _content += "\n";
//     }
//
//     return Text(_content);
//   }
//   return const Text("");
// }
//
// Widget _dialogTitle(BuildContext context, String? title, bool isSuccess) {
//   if (title != null) {
//     return Flexible(child: Text(title));
//   } else {
//     return isSuccess
//         ? Flexible(
//             child: Text("  Success", style: TextStyle(color: Colors.green)),
//           )
//         : Flexible(
//             child: Text("  Failed", style: TextStyle(color: Colors.red)),
//           );
//   }
// }
//
// Widget _dialogButtonPositive(
//     BuildContext? context, String? text, Function? onPressed) {
//   if (Platform.isIOS) {
//     return CupertinoDialogAction(
//       // isDefaultAction: true,
//
//       onPressed: onPressed as Function(),
//       child: Text(
//         text ?? "",
//         style: const TextStyle(color: Colors.red),
//       ),
//     );
//   } else {
//     return TextButton(
//       onPressed: onPressed as Function(),
//       child: Text(
//         text ?? "",
//         style: const TextStyle(color: Colors.black),
//       ),
//     );
//   }
// }
//
// Widget _dialogButtonNegative(
//     BuildContext? context, String? text, Function onPressed) {
//   if (Platform.isIOS) {
//     return CupertinoDialogAction(
//       onPressed: onPressed as Function(),
//       child: Text(text ?? ""),
//       // isDefaultAction: false,
//     );
//   } else {
//     return TextButton(
//       onPressed: onPressed as Function(),
//       child: Text(text ?? ""),
//       // style: ElevatedButton.styleFrom(
//       //   shadowColor: Colors.grey,
//       //   primary: Colors.grey,
//       //   padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 5),
//       //   textStyle: const TextStyle(
//       //       fontFamily: FontName.ceraPro,
//       //       fontWeight: FontWeight.w700,
//       //       fontSize: 16,
//       //       letterSpacing: 0.3,
//       //       color: Colors.white),
//       //   shape: RoundedRectangleBorder(
//       //     borderRadius: BorderRadius.circular(25),
//       //   ),
//       // ),
//     );
//   }
// }
