import 'package:bill/common/keys.dart';
import 'package:bill/local_storage/local_storage.dart';
import 'package:bill/theme/custom_text_widgets.dart';
import 'package:bill/theme/elements_screen.dart';
import 'package:bill/ui/components/elements_button.dart';
import 'package:bill/ui/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectWarehouse extends StatefulWidget {
  bool isComingFromLogin;

  SelectWarehouse({super.key, required this.isComingFromLogin});

  @override
  State<SelectWarehouse> createState() => _SelectWarehouseState();
}

class _SelectWarehouseState extends State<SelectWarehouse> {
  String selectedWarehouse = 'Warehouse1';
  List<String> warehouseList = [
    'Warehouse1',
    'Warehouse2',
    'Warehouse3',
    'Warehouse4',
    'Warehouse5'
  ];

  @override
  Widget build(BuildContext context) {
    return screenWithAppBar(
        title: 'Select Warehouse',
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            getHeadingText(text: 'Warehouse'),
            const SizedBox(
              height: 20,
            ),
            Align(alignment: Alignment.center, child: _dropdownButton()),
          ],
        ),
        bottomNavigationBar: _buttonContainer());
  }

  Widget _dropdownButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 15),
      child: SizedBox(
        width: Get.width / 3,
        child: DropdownButton<String>(
          isExpanded: true,
          items: warehouseList.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (val) {
            setState(() {
              // EmployeeData.ApprovalStatus = val!;
              selectedWarehouse = val!;
            });
          },
          borderRadius: BorderRadius.circular(10),
          value: selectedWarehouse,
        ),
      ),
    );
  }

  Widget _buttonContainer() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 13,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: loadingButton(
          isLoading: false,
          btnText: 'Save',
          onPress: _onSave,
        ),
      ),
    );
  }

  _onSave() {
    LocalStorage.setString(key: keyFinancialYear, value: selectedWarehouse);
    if (widget.isComingFromLogin) {
      Get.to(() => const Dashboard());
    } else {
      Navigator.pop(context);
    }
  }
}
