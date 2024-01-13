import 'package:get/get.dart';
import 'package:intl/intl.dart';


bool isNumeric(String result) {
  try {
    double.parse(result);
    return true;
  } catch (e) {
    //writeToLogFile(text: e.toString(), fileName: StackTrace.current.toString(), lineNo: 141);
    return false;
  }
}

String displayNumberWithComma(String number) {
  String replacedNumber = number.replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => "${m[1]},");
  return replacedNumber;
}

double getNumberWithoutComma(String formattedValue) {
  num numericValue = NumberFormat.decimalPattern().parse(formattedValue);
  return double.tryParse(numericValue.toString()) ?? 0.0;
}
