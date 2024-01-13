// import 'dart:io';
//
// import 'package:flutter/material.dart';
//
// import 'package:litsales/Component/SendEmail.dart';
// import 'package:litsales/Component/SnackbarComponent.dart';
// import 'package:path_provider/path_provider.dart';
//
// class LogFileScreen extends StatefulWidget {
//   const LogFileScreen({super.key});
//
//   @override
//   State<LogFileScreen> createState() => _LogFileScreenState();
// }
//
// class _LogFileScreenState extends State<LogFileScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Create Log'),
//       ),
//       body: Center(
//         child: Column(
//           children: [
//             MaterialButton(
//               onPressed: () {
//                 //writeToLogFile(
//                     text: "Hello, this text is written to a file!",
//                     fileName: 'ODLN.dart',
//                     lineNo: 28);
//               },
//               child: Text('Create Log'),
//             ),
//             MaterialButton(
//               onPressed: () async {
//                 readLogFile();
//               },
//               child: Text('View Log File'),
//             ),
//             MaterialButton(
//               onPressed: () async {
//                 shareLogFile();
//               },
//               child: Text('Share Log File'),
//             ),
//             MaterialButton(
//               onPressed: () async {
//                 shareFileOnWhatsApp();
//               },
//               child: Text('Share Log File on WhatsApp'),
//             ),
//             MaterialButton(
//               onPressed: () async {
//                 readFile();
//                 // final directory = await getExternalStorageDirectory();
//                 // File file = File('${directory?.path}/log.txt');
//                 // Navigator.push(
//                 //     context,
//                 //     MaterialPageRoute(
//                 //         builder: (context) =>
//                 //             ViewFile(file: file, heading: 'Log File')));
//               },
//               child: Text('View Log File'),
//             ),
//             MaterialButton(
//               onPressed: () async {
//                 await sendEmail(onError: (String error) {
//                   getErrorSnackBar(error);
//                 }, onSuccess: () {
//                   getSuccessSnackBar('Email sent');
//                 });
//               },
//               child: Text('Mail Log File'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Future<void> writeFile(String text) async {
//     Directory appDocDir = await getApplicationDocumentsDirectory();
//     File file = File(
//       '${appDocDir.path}/log.txt',
//     );
//     try {
//       await file.writeAsString(text, mode: FileMode.append, flush: true);
//       print('Text written to file successfully.');
//     } catch (e) {
//       //writeToLogFile(
//           text: e.toString(),
//           fileName: StackTrace.current.toString(),
//           lineNo: 141);
//       print('Error writing to file: $e');
//     }
//   }
//
//   Future<String> readFile() async {
//     try {
//       Directory appDocDir = await getApplicationDocumentsDirectory();
//       File file = File('${appDocDir.path}/log.txt');
//
//       if (await file.exists()) {
//         String fileContents = await file.readAsString();
//         print(fileContents);
//         return fileContents;
//       } else {
//         return "File not found.";
//       }
//     } catch (e) {
//       //writeToLogFile(
//           text: e.toString(),
//           fileName: StackTrace.current.toString(),
//           lineNo: 141);
//       return "Error reading file: $e";
//     }
//   }
// }
//
// class ViewFile extends StatelessWidget {
//   File file;
//   String heading;
//
//   ViewFile({super.key, required this.file, required this.heading});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(heading),
//       ),
//       body: Image.file(file),
//     );
//   }
// }
