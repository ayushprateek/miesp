import 'dart:convert';

import 'package:bill/models/customer_model.dart';
import 'package:bill/models/item_details_model.dart';
import 'package:bill/models/warehouse_model.dart';
import 'package:bill/theme/custom_snack_bar.dart';
import 'package:bill/ui/components/elements_snackbar.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart' as http;

// import 'package:mailer/mailer.dart';
// import 'package:mailer/smtp_server.dart';
import 'package:url_launcher/url_launcher.dart';

class ServiceManager {
  static String baseURL = 'http://51.79.229.83:8080/API/';
  static Map<String, String>? header = {
    'accept': '*/*',
    'Content-Type': 'application/json'
  };

  static Future<bool> isInternetAvailable() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      getErrorSnackBar('No Internet');
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

  static Future<void> login({
    required String UserEmail,
    required String Password,
    required Function(CustomerModel) onSuccess,
    required Function onError,
  }) async {
    CustomerModel? customerModel;
    var res = await http.post(Uri.parse('${baseURL}Account/Login'),
        headers: header,
        body: jsonEncode({"UserEmail": UserEmail, "Password": Password}));
    print(res.body);
    if (res.statusCode == 200) {
      customerModel = CustomerModel.fromJson(jsonDecode(res.body));
      onSuccess(customerModel);
    } else {
      onError();
    }
  }

  static Future<void> getWarehouseList({
    required Function(List<WarehouseModel>) onSuccess,
    required Function onError,
  }) async {
    List<WarehouseModel>? warehouseList = [];
    ;
    var res = await http.get(
      Uri.parse('${baseURL}Items/GetWarehouseList'),
      headers: header,
    );
    print(res.body);
    if (res.statusCode == 200) {
      warehouseList = warehouseModelFromJson(res.body);
      onSuccess(warehouseList);
    } else {
      onError();
    }
  }

  static Future<void> getItemDetails({
    required String barCode,
    required Function(ItemDetailModel) onSuccess,
    required Function onError,
  }) async {
    ItemDetailModel? warehouseList;
    CustomerModel customerModel=CustomerModel.getLoginCustomer();

    var res = await http.post(
      Uri.parse('${baseURL}Items/GetItemDetail'),
      body: jsonEncode({
        "Barcode": barCode,
        "UserId": customerModel.userId??0
      }),
      headers: header,
    );
    print(res.body);
    if (res.statusCode == 200) {
      warehouseList = itemDetailModelFromJson(res.body);
      onSuccess(warehouseList);
    } else {
      onError();
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
// static void updateCurrentLangCode(String locale) async {
//   LocalStorage.getInstance()
//       ?.localStorage
//       ?.setString(keyAppLocaleCode, locale);
//   Get.updateLocale(CustomLocale.toLocale(locale));
// }
}
