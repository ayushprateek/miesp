import 'package:bill/local_storage/keys.dart';
import 'package:bill/local_storage/local_storage.dart';
import 'package:bill/theme/custom_snack_bar.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
// import 'package:mailer/mailer.dart';
// import 'package:mailer/smtp_server.dart';
import 'package:url_launcher/url_launcher.dart';

class ServiceManager {
  // static void updateCurrentLangCode(String locale) async {
  //   LocalStorage.getInstance()
  //       ?.localStorage
  //       ?.setString(keyAppLocaleCode, locale);
  //   Get.updateLocale(CustomLocale.toLocale(locale));
  // }

  static Future<bool> checkInternet() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      return false;
    }
    return true;
  }

  static launchInBrowser(Uri? uri) async {
    try {
      if (await canLaunchUrl(uri ?? Uri.parse(''))) {
        await launchUrl(uri ?? Uri.parse(''));
      } else {}
    } catch (e) {
      CustomSnackBar.errorSnackBar(e.toString());
    }
  }

  // static sendEmail(
  //   var recipient,
  //   var subject,
  //   var h1,
  //   var h2,
  //   var body, {
  //   Function? onSuccess,
  //   Function(String error)? onError,
  // }) async {
  //   String imagePath = 'http://139.59.54.184:8000/images/GoKartLogo.png';
  //   body +=
  //       "<br><I>If you have any query then kindly reply to this email or contact us at contact@kishul.com</I>";
  //   String username = 'ayush.kishul@gmail.com';
  //   String password = 'rfizqgzxzavkwhtm';
  //   //also use for gmail smtp
  //   final smtpServer = gmail(username, password);
  //   // final domainSmtp = value['email_domain_smtp'];
  //   // final smtpServer = SmtpServer(domainSmtp,
  //   //     username: username, password: password, port: value['email_port']);
  //   final message = Message()
  //     ..from = Address(username, 'GoKart')
  //     ..recipients.add(recipient)
  //     ..subject = subject
  //     ..text = 'This is the plain text.\nThis is line 2 of the text part.'
  //     ..html =
  //         "<img src=$imagePath width=180><h1>$h1</h1>\n\n<h2>$h2</h2>\n\n<p>$body </p>";
  //
  //   try {
  //     print(smtpServer.toString());
  //     final sendReport = await send(message, smtpServer);
  //     print('Message sent: $sendReport');
  //     if (onSuccess != null) {
  //       onSuccess();
  //     }
  //   } catch (e) {
  //     print('Message not sent.');
  //     print(e.toString());
  //     if (onError != null) {
  //       onError(e.toString());
  //     }
  //     CustomSnackBar.errorSnackBar(e.toString());
  //   }
  // }
}
