import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:bill/theme/custom_colors.dart';
import 'package:bill/ui/components/elements_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:get/get.dart';

import 'package:path_provider/path_provider.dart';

double textSize = 20;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(CustomScreenshot());
}

class CustomScreenshot extends StatefulWidget {
  @override
  _CustomScreenshotState createState() => _CustomScreenshotState();
}

class _CustomScreenshotState extends State<CustomScreenshot> {
  String firstButtonText = 'Take photo';
  String secondButtonText = 'Record video';

  String albumName = 'Media';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              ScreenshotWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class ScreenshotWidget extends StatefulWidget {
  @override
  _ScreenshotWidgetState createState() => _ScreenshotWidgetState();
}

class _ScreenshotWidgetState extends State<ScreenshotWidget> {
  final GlobalKey _globalKey = GlobalKey();
  String screenshotButtonText = 'Save screenshot';

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: RepaintBoundary(
        key: _globalKey,
        child: Container(
          child: Column(
            children: [
              Container(
                  padding: const EdgeInsets.all(30.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueAccent, width: 5.0),
                    color: Colors.amberAccent,
                  ),
                  child: Stack(
                    children: [
                      Image.asset(
                        'images/male_user.jpeg',
                      ),
                      Text("This widget will be captured as an image"),
                    ],
                  )),
              TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.pink),
                ),
                onPressed: () async {
                  String? path = await captureScreenshot(context: context);
                  if (path != null) showCapturedImage(context, path);
                },
                child: Text(screenshotButtonText,
                    style: TextStyle(fontSize: textSize, color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<dynamic> showCapturedImage(BuildContext context, String path) {
  return showDialog(
    useSafeArea: false,
    context: context,
    builder: (context) => Scaffold(
      appBar: AppBar(
        backgroundColor: appPrimary,
        title: Text("Captured screenshot"),
      ),
      body: Center(child: Image.file(File(path))),
    ),
  );
}

class DisplaySS extends StatelessWidget {
  String path;

  DisplaySS({Key? key, required this.path}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appPrimary,
        title: Text("Captured screenshot"),
      ),
      body: Center(child: Image.file(File(path))),
    );
  }
}

Future<String?> captureScreenshot({required BuildContext? context}) async {
  try {
    final RenderRepaintBoundary boundary =
        context?.findRenderObject() as RenderRepaintBoundary;
    if (boundary.debugNeedsPaint) {
      await Future.delayed(const Duration(milliseconds: 20));
      return captureScreenshot(context: context);
    }
    final ui.Image image = await boundary.toImage(pixelRatio: 3.0);
    final ByteData? byteData =
        await image.toByteData(format: ui.ImageByteFormat.png);
    final Uint8List? pngBytes = byteData?.buffer.asUint8List();

    //create file
    final String dir = (await getApplicationDocumentsDirectory()).path;
    final String fullPath = '$dir/${DateTime.now().millisecond}.png';
    File capturedFile = File(fullPath);
    await capturedFile.writeAsBytes(pngBytes!.toList());
    print(capturedFile.path);
    return capturedFile.path;
  } catch (e) {
    //writeToLogFile(text: e.toString(), fileName: StackTrace.current.toString(), lineNo: 141);
    print(e);
    return null;
  }
}

Future<bool> saveScreenShots(
    {required List<String> list, int index = 0}) async {
  if (list.isEmpty) {
    getErrorSnackBar('Empty List');
    return false;
  } else if (index == list.length) {
    return true;
  }
  await GallerySaver.saveImage(list[index]).then((value) {});
  return saveScreenShots(list: list, index: index + 1);
}
