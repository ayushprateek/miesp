import 'package:litsales/Component/CustomLocalStorage.dart';
import 'package:litsales/Component/ObjectKeys.dart';

String getCredentials() {
  return LocalStorage.getString(key: keyCredentials) ?? '';
}

setCredentials({required String credentials}) {
  LocalStorage.setString(key: keyCredentials, value: credentials);
  if (credentials == '') {
    setLogInTime(dateTime: null);
  } else {
    setLogInTime(dateTime: DateTime.now());
  }
}

setLogInTime({required DateTime? dateTime}) {
  LocalStorage.setString(
      key: keyLoginDate, value: dateTime?.toIso8601String() ?? '');
}

DateTime? getLogInTime() {
  String str = LocalStorage.getString(key: keyLoginDate)?.toString() ?? '';
  return DateTime.tryParse(str);
}
