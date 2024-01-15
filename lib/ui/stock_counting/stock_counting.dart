import 'package:bill/common/app_functions.dart';
import 'package:bill/models/stock_counting_detail_model.dart';
import 'package:bill/models/uom_model.dart';
import 'package:bill/services/service_manager.dart';
import 'package:bill/theme/custom_text_widgets.dart';
import 'package:bill/theme/elements_screen.dart';
import 'package:bill/theme/get_text_field.dart';
import 'package:bill/ui/components/elements_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StockCounting extends StatefulWidget {
  const StockCounting({super.key});

  @override
  State<StockCounting> createState() => _StockCountingState();
}

class _StockCountingState extends State<StockCounting> {
  final TextEditingController _deviceNumber = TextEditingController();
  final TextEditingController _rackNo = TextEditingController();
  List<StockCountingDetailModel> items = [];
  List<UomModel> uomList = [];
  Set<String> uomNameList = {};

  @override
  void initState() {
    super.initState();
    loadUomData();
  }

  loadUomData() async {
    if (await ServiceManager.isInternetAvailable()) {
      ServiceManager.getUOMList(onSuccess: onUomSuccess, onError: onUomError);
    }
  }

  onUomSuccess(List<UomModel> uomList) {
    this.uomList = uomList;
    for (UomModel uom in uomList) {
      if (uom.varUomName != null && uom.varUomName != '') {
        this.uomNameList.add(uom.varUomName!);
      }
    }
    getInfo();
  }

  String getUOMCode({required String UOMName}) {
    String code = '';
    for (UomModel uom in uomList) {
      if (uom.varUomName == UOMName) {
        code = uom.varUomCode!;
        break;
      }
    }
    return code;
  }

  onUomError() {}

  getInfo() async {
    _deviceNumber.text = (await getDeviceId()) ?? '';
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return screenWithAppBar(
        title: 'Stock Counting',
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 8.0, right: 8, bottom: 8, top: 30),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16))),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      getDisabledTextField(
                          controller: _deviceNumber,
                          labelText: 'Device Number'),
                      getTextField(
                          controller: _rackNo, labelText: 'Rack Number'),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: Get.width / 3,
                            child: loadingButton(
                                isLoading: false,
                                btnText: '+ Add Item(Scan)',
                                onPress: () async {
                                  if (await ServiceManager
                                      .isInternetAvailable()) {
                                    String barCode = '4301';
                                    ServiceManager.getStockCountingDetail(
                                        barCode: barCode,
                                        onSuccess: onSuccess,
                                        onError: onError);
                                  }
                                  // scanQRCode(onSuccess: (String barCode) async {
                                  //   if (!mounted) return;
                                  //   if (await ServiceManager
                                  //       .isInternetAvailable()) {
                                  //     ServiceManager.getItemDetails(
                                  //         barCode: barCode,
                                  //         onSuccess: onSuccess,
                                  //         onError: onError);
                                  //   }
                                  // });
                                }),
                          ),
                        ),
                      ),
                      ListView.builder(
                        itemCount: items.length,
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          StockCountingDetailModel stockCountingDetail =
                              items[index];
                          return Container(
                            decoration: new BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(16.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 4.0,
                                  offset: const Offset(2.0, 2.0),
                                ),
                              ],
                            ),
                            margin: EdgeInsets.only(
                                left: 15.0, right: 15.0, bottom: 10),
                            width: MediaQuery.of(context).size.width,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0,
                                                  right: 8.0,
                                                  top: 4.0),
                                              child: Align(
                                                alignment: Alignment.topLeft,
                                                child: FittedBox(
                                                  fit: BoxFit.contain,
                                                  child: Text.rich(
                                                    TextSpan(
                                                      children: [
                                                        getPoppinsTextSpanHeading(
                                                            text: 'Item Code'),
                                                        getPoppinsTextSpanDetails(
                                                            text: stockCountingDetail
                                                                    .varItemNo ??
                                                                ''),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0,
                                                  right: 8.0,
                                                  top: 4.0),
                                              child: Align(
                                                alignment: Alignment.topLeft,
                                                child: Text.rich(
                                                  TextSpan(
                                                    children: [
                                                      getPoppinsTextSpanHeading(
                                                          text:
                                                              'Item Description'),
                                                      getPoppinsTextSpanDetails(
                                                          text: stockCountingDetail
                                                                  .varItemDescription ??
                                                              ''),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0,
                                                  right: 8.0,
                                                  top: 4.0),
                                              child: Align(
                                                alignment: Alignment.topLeft,
                                                child: Text.rich(
                                                  TextSpan(
                                                    children: [
                                                      getPoppinsTextSpanHeading(
                                                          text: 'In Stock'),
                                                      getPoppinsTextSpanDetails(
                                                          text: stockCountingDetail
                                                                  .decInStock
                                                                  ?.toStringAsFixed(
                                                                      2) ??
                                                              ''),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0,
                                                  right: 8.0,
                                                  top: 4.0),
                                              child: Align(
                                                alignment: Alignment.topLeft,
                                                child: Text.rich(
                                                  TextSpan(
                                                    children: [
                                                      getPoppinsTextSpanHeading(
                                                          text: 'Quantity'),
                                                      getPoppinsTextSpanDetails(
                                                          text: stockCountingDetail
                                                                  .decQuantity
                                                                  ?.toStringAsFixed(
                                                                      2) ??
                                                              ''),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        flex: 8,
                                      ),
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0,
                                                  right: 8.0,
                                                  top: 4.0),
                                              child: Align(
                                                alignment: Alignment.topLeft,
                                                child: Text.rich(
                                                  TextSpan(
                                                    children: [
                                                      getPoppinsTextSpanHeading(
                                                          text: 'UOM Code'),
                                                      getPoppinsTextSpanDetails(
                                                          text: stockCountingDetail
                                                                  .varUomCode ??
                                                              ''),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 8.0, left: 8, right: 20),
                                              child: FittedBox(
                                                child: Row(
                                                  children: [
                                                    getHeadingText(
                                                        text: 'UOM: '),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 8.0),
                                                      child: DropdownButton<
                                                          String>(
                                                        value:
                                                            '${stockCountingDetail.varUomName}',
                                                        onChanged:
                                                            (String? newValue) {
                                                          stockCountingDetail
                                                                  .varUomName =
                                                              newValue;
                                                          stockCountingDetail
                                                                  .varUomCode =
                                                              getUOMCode(
                                                                  UOMName:
                                                                      newValue!);

                                                          setState(() {});
                                                        },
                                                        items: uomNameList.map<
                                                            DropdownMenuItem<
                                                                String>>((String
                                                            value) {
                                                          return DropdownMenuItem<
                                                              String>(
                                                            value: value,
                                                            child: FittedBox(
                                                                child: Text(
                                                                    value)),
                                                          );
                                                        }).toList(),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        flex: 8,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  onSuccess(StockCountingDetailModel itemDetailModel) {
    print(itemDetailModel.toJson());
    setState(() {
      items.add(itemDetailModel);
    });
  }

  onError() {}
}
