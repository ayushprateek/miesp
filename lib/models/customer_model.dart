import 'dart:convert';

import 'package:litsales/Component/CustomLocalStorage.dart';
import 'package:litsales/Component/ObjectKeys.dart';

class Customer {
  int? id;
  String? firstName;
  String? middleName;
  String? code;
  String? lastName;
  String? mobile;
  String? email;
  bool? active;
  bool hasCreated;
  bool hasUpdated;
  String? createdBy;
  String? updatedBy;
  DateTime? createDate;
  DateTime? updateDate;

  Customer({
    this.id,
    this.code,
    this.firstName,
    this.middleName,
    this.lastName,
    this.email,
    this.mobile,
    this.active,
    this.createDate,
    this.updateDate,
    this.createdBy,
    this.updatedBy,
    this.hasCreated = false,
    this.hasUpdated = false,
  });

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        id: int.tryParse(json['ID'].toString()) ?? 0,
        firstName: json['FirstName'],
        code: json['Code'],
        lastName: json['LastName'],
        mobile: json['Mobile'],
        email: json['Email'],
        createdBy: json['CreatedBy'],
        updatedBy: json['UpdatedBy'],
        middleName: json['MiddleName'],
        active: json['Active'] is bool ? json['Active'] : json['Active'] == 1,
        hasCreated: json['HasCreated'] is bool
            ? json['HasCreated']
            : json['HasCreated'] == 1,
        hasUpdated: json['HasUpdated'] is bool
            ? json['HasUpdated']
            : json['HasUpdated'] == 1,
        createDate: DateTime.tryParse(json['CreateDate'].toString()),
        updateDate: DateTime.tryParse(json['UpdateDate'].toString()),
      );

  Map<String, dynamic> toJson() => {
        'ID': id,
        'Code': code,
        'FirstName': firstName,
        'MiddleName': middleName,
        'LastName': lastName,
        'Mobile': mobile,
        'Email': email,
        'CreatedBy': createdBy,
        'UpdatedBy': updatedBy,
        'Active': active,
        'HasCreated': hasCreated == true ? 1 : 0,
        'HasUpdated': hasUpdated == true ? 1 : 0,
        'CreateDate': createDate?.toIso8601String(),
        'UpdateDate': updateDate?.toIso8601String(),
      };

  static Customer getCustomer() {
    String customerString = LocalStorage.getString(key: keyObjUser) ?? '';
    return Customer.fromJson(jsonDecode(customerString));
  }

  static void setCustomer(String value) {
    LocalStorage.setString(key: keyObjUser, value: value);
  }
}

List<Customer> customerFromJson(String str) =>
    List<Customer>.from(json.decode(str).map((x) => Customer.fromJson(x)));

String customerToJson(List<Customer> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
