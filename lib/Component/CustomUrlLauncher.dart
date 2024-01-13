import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

launchURL(String url) async {
  try {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    } else {}
  } catch (e) {
    //writeToLogFile(text: e.toString(), fileName: StackTrace.current.toString(), lineNo: 141);
  }
}

void customLaunchURL(String url) async {
  url =
      "http://103.233.58.106:8002/Resources/Images/ecac2355-76f6-43e7-af2f-29b64c847087-Screenshot_2022-09-19-18-57-53-721_com.mi.android.globallauncher.jpg";
  Uri uri = Uri.parse(url);
  try {
    if (await urlExists(url)) {
      launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  } catch (e) {
    //writeToLogFile(text: e.toString(), fileName: StackTrace.current.toString(), lineNo: 141);
    print(e.toString());
  }
}

Future<bool> urlExists(String url) async {
  Uri uri = Uri.parse(url);
  return await canLaunchUrl(uri);
}
