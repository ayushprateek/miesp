import 'package:bill/models/warehouse_model.dart';
import 'package:bill/services/service_manager.dart';
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
  String selectedWarehouse = '';
  Set<String> warehouseList = {};
  String loadingText = 'Loading warehouses...';

  @override
  void initState() {
    super.initState();
    loadWarehouseData();
  }

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
            if (warehouseList.isEmpty)
              Align(
                  alignment: Alignment.center,
                  child: getSubHeadingText(text: loadingText))
            else
              Align(alignment: Alignment.center, child: _dropdownButton()),
          ],
        ),
        bottomNavigationBar: _buttonContainer());
  }

  Widget _dropdownButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 15, right: 20),
      child: SizedBox(
        width: Get.width / 1.2,
        child: FittedBox(
          child: DropdownButton<String>(
            value: selectedWarehouse,
            onChanged: (String? newValue) {
              setState(() {
                selectedWarehouse = newValue!;
              });
            },
            items: warehouseList.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: FittedBox(child: Text(value)),
              );
            }).toList(),
          ),
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

  loadWarehouseData() async {
    if (await ServiceManager.isInternetAvailable()) {
      ServiceManager.getWarehouseList(onSuccess: onSuccess, onError: onError);
    }
  }

  onSuccess(List<WarehouseModel> warehouseList) {
    if (warehouseList.isNotEmpty) {
      if (widget.isComingFromLogin) {
        WarehouseModel warehouse = warehouseList[0];
        selectedWarehouse =
            '${warehouse.warehouseCode}-->${warehouse.warehouseName}';
      } else {
        WarehouseModel warehouse = WarehouseModel.getSelectedWarehouse();
        selectedWarehouse =
            '${warehouse.warehouseCode}-->${warehouse.warehouseName}';
      }
    }
    for (WarehouseModel warehouse in warehouseList) {
      this
          .warehouseList
          .add('${warehouse.warehouseCode}-->${warehouse.warehouseName}');
    }
    setState(() {});
  }

  onError() {
    loadingText = 'Error loading warehouses';
  }

  _onSave() async {
    List l = selectedWarehouse.split('-->');
    WarehouseModel warehouseModel = WarehouseModel(
      warehouseCode: l[0],
      warehouseName: l[1],
    );
    WarehouseModel.setSelectedWarehouse(warehouseModel: warehouseModel);

    if (widget.isComingFromLogin) {
      Get.to(() => const Dashboard());
    } else {
      Navigator.pop(context);
    }
  }
}
