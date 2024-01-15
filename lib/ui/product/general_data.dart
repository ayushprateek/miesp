import 'package:bill/theme/custom_text_widgets.dart';
import 'package:bill/ui/product/product_details.dart';
import 'package:flutter/material.dart';

class GeneralData extends StatefulWidget {
  @override
  _GeneralDataState createState() => _GeneralDataState();
}

class _GeneralDataState extends State<GeneralData> {
  TextEditingController ItemId = TextEditingController(
      text: SalesQuotationUI.itemDetailModel?.bigintItemId?.toString());
  TextEditingController BarCode =
      TextEditingController(text: SalesQuotationUI.itemDetailModel?.varBarcode);
  TextEditingController ItemNo =
      TextEditingController(text: SalesQuotationUI.itemDetailModel?.varItemNo);
  TextEditingController ItemDescription = TextEditingController(
      text: SalesQuotationUI.itemDetailModel?.varItemDescription);
  TextEditingController UomGroupCode = TextEditingController(
      text: SalesQuotationUI.itemDetailModel?.varUomGroupCode);
  TextEditingController UomGroupName = TextEditingController(
      text: SalesQuotationUI.itemDetailModel?.varUomGroupName);
  TextEditingController UomCode =
      TextEditingController(text: SalesQuotationUI.itemDetailModel?.varUomCode);

  //------
  TextEditingController UomName =
      TextEditingController(text: SalesQuotationUI.itemDetailModel?.varUomName);
  TextEditingController ForeignName = TextEditingController(
      text: SalesQuotationUI.itemDetailModel?.varForeignName);
  TextEditingController ItemCategory = TextEditingController(
      text: SalesQuotationUI.itemDetailModel?.varItemCategory);
  TextEditingController BrandName = TextEditingController(
      text: SalesQuotationUI.itemDetailModel?.varBrandName);
  TextEditingController GroupName = TextEditingController(
      text: SalesQuotationUI.itemDetailModel?.varGroupName);
  TextEditingController ItemImage = TextEditingController(
      text: SalesQuotationUI.itemDetailModel?.varItemImage);
  TextEditingController LastMonthSalesQty = TextEditingController(
      text: SalesQuotationUI.itemDetailModel?.decLastMonthSalesQty
          ?.toStringAsFixed(2));
  TextEditingController Last90DaysSalesQty = TextEditingController(
      text: SalesQuotationUI.itemDetailModel?.decLast90DaysSalesQty
          ?.toStringAsFixed(2));
  TextEditingController LastSellingPrice = TextEditingController(
      text: SalesQuotationUI.itemDetailModel?.decLastSellingPrice
          ?.toStringAsFixed(2));
  TextEditingController OpenOrders = TextEditingController(
      text: SalesQuotationUI.itemDetailModel?.intOpenOrders?.toString());
  TextEditingController OpenInvoice = TextEditingController(
      text: SalesQuotationUI.itemDetailModel?.intOpenInvoice?.toString());
  TextEditingController Ordered = TextEditingController(
      text: SalesQuotationUI.itemDetailModel?.intOrdered?.toString());
  TextEditingController Committed = TextEditingController(
      text: SalesQuotationUI.itemDetailModel?.intCommitted?.toString());
  TextEditingController ItemCost = TextEditingController(
      text: SalesQuotationUI.itemDetailModel?.decItemCost?.toStringAsFixed(2));

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 8.0, right: 8, bottom: 8, top: 30),
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
                  Container(
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
                    margin:
                        EdgeInsets.only(left: 15.0, right: 15.0, bottom: 10),
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(

                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0, right: 8.0, top: 4.0),
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text.rich(
                                          TextSpan(
                                            children: [
                                              getPoppinsTextSpanHeading(
                                                  text: 'Item ID'),
                                              getPoppinsTextSpanDetails(
                                                  text: SalesQuotationUI
                                                          .itemDetailModel
                                                          ?.bigintItemId
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
                                          left: 8.0, right: 8.0, top: 4.0),
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text.rich(
                                          TextSpan(

                                            children: [
                                              getPoppinsTextSpanHeading(
                                                  text: 'Bar Code'),
                                              getPoppinsTextSpanDetails(
                                                  text: SalesQuotationUI
                                                          .itemDetailModel
                                                          ?.varBarcode ??
                                                      ''),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0, right: 8.0, top: 4.0),
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text.rich(
                                          TextSpan(
                                            children: [
                                              getPoppinsTextSpanHeading(
                                                  text: 'Item No'),
                                              getPoppinsTextSpanDetails(
                                                  text: SalesQuotationUI
                                                          .itemDetailModel
                                                          ?.varItemNo ??
                                                      ''),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0, right: 8.0, top: 4.0),
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text.rich(
                                          TextSpan(
                                            children: [
                                              getPoppinsTextSpanHeading(
                                                  text: 'Item Description'),
                                              getPoppinsTextSpanDetails(
                                                  text: SalesQuotationUI
                                                          .itemDetailModel
                                                          ?.varItemDescription ??
                                                      ''),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0, right: 8.0, top: 4.0),
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text.rich(
                                          TextSpan(
                                            children: [
                                              getPoppinsTextSpanHeading(
                                                  text: 'UOM Group Code'),
                                              getPoppinsTextSpanDetails(
                                                  text: SalesQuotationUI
                                                          .itemDetailModel
                                                          ?.varUomGroupCode ??
                                                      ''),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0, right: 8.0, top: 4.0),
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text.rich(
                                          TextSpan(
                                            children: [
                                              getPoppinsTextSpanHeading(
                                                  text: 'UOM Group Name'),
                                              getPoppinsTextSpanDetails(
                                                  text: SalesQuotationUI
                                                          .itemDetailModel
                                                          ?.varUomGroupName ??
                                                      ''),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0, right: 8.0, top: 4.0),
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text.rich(
                                          TextSpan(
                                            children: [
                                              getPoppinsTextSpanHeading(
                                                  text: 'UOM Code'),
                                              getPoppinsTextSpanDetails(
                                                  text: SalesQuotationUI
                                                          .itemDetailModel
                                                          ?.varUomCode ??
                                                      ''),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0, right: 8.0, top: 4.0),
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text.rich(
                                          TextSpan(
                                            children: [
                                              getPoppinsTextSpanHeading(
                                                  text: 'UOM Name'),
                                              getPoppinsTextSpanDetails(
                                                  text: SalesQuotationUI
                                                          .itemDetailModel
                                                          ?.varUomName ??
                                                      ''),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0, right: 8.0, top: 4.0),
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text.rich(
                                          TextSpan(
                                            children: [
                                              getPoppinsTextSpanHeading(
                                                  text: 'Foreign Name'),
                                              getPoppinsTextSpanDetails(
                                                  text: SalesQuotationUI
                                                          .itemDetailModel
                                                          ?.varForeignName ??
                                                      ''),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0, right: 8.0, top: 4.0),
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text.rich(
                                          TextSpan(
                                            children: [
                                              getPoppinsTextSpanHeading(
                                                  text: 'Item Category'),
                                              getPoppinsTextSpanDetails(
                                                  text: SalesQuotationUI
                                                          .itemDetailModel
                                                          ?.varItemCategory ??
                                                      ''),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0, right: 8.0, top: 4.0),
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text.rich(
                                          TextSpan(
                                            children: [
                                              getPoppinsTextSpanHeading(
                                                  text: 'Brand Name'),
                                              getPoppinsTextSpanDetails(
                                                  text: SalesQuotationUI
                                                      .itemDetailModel
                                                      ?.varBrandName ??
                                                      ''),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0, right: 8.0, top: 4.0),
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text.rich(
                                          TextSpan(
                                            children: [
                                              getPoppinsTextSpanHeading(
                                                  text: 'Group Name'),
                                              getPoppinsTextSpanDetails(
                                                  text: SalesQuotationUI
                                                      .itemDetailModel
                                                      ?.varGroupName ??
                                                      ''),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0, right: 8.0, top: 4.0),
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text.rich(
                                          TextSpan(
                                            children: [
                                              getPoppinsTextSpanHeading(
                                                  text: 'Item Image'),
                                              getPoppinsTextSpanDetails(
                                                  text: SalesQuotationUI
                                                      .itemDetailModel
                                                      ?.varItemImage ??
                                                      ''),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0, right: 8.0, top: 4.0),
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text.rich(
                                          TextSpan(
                                            children: [
                                              getPoppinsTextSpanHeading(
                                                  text: 'Last Month Sales Qty'),
                                              getPoppinsTextSpanDetails(
                                                  text: SalesQuotationUI
                                                      .itemDetailModel
                                                      ?.decLastMonthSalesQty
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
                                          left: 8.0, right: 8.0, top: 4.0),
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text.rich(
                                          TextSpan(
                                            children: [
                                              getPoppinsTextSpanHeading(
                                                  text:
                                                  'Last 90 Day sSales Qty'),
                                              getPoppinsTextSpanDetails(
                                                  text: SalesQuotationUI
                                                      .itemDetailModel
                                                      ?.decLast90DaysSalesQty
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
                                          left: 8.0, right: 8.0, top: 4.0),
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text.rich(
                                          TextSpan(
                                            children: [
                                              getPoppinsTextSpanHeading(
                                                  text: 'Last Selling Price'),
                                              getPoppinsTextSpanDetails(
                                                  text: SalesQuotationUI
                                                      .itemDetailModel
                                                      ?.decLastSellingPrice
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
                                          left: 8.0, right: 8.0, top: 4.0),
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text.rich(
                                          TextSpan(
                                            children: [
                                              getPoppinsTextSpanHeading(
                                                  text: 'Open Orders'),
                                              getPoppinsTextSpanDetails(
                                                  text: SalesQuotationUI
                                                      .itemDetailModel
                                                      ?.intOpenOrders
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
                                          left: 8.0, right: 8.0, top: 4.0),
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text.rich(
                                          TextSpan(
                                            children: [
                                              getPoppinsTextSpanHeading(
                                                  text: 'Open Invoice'),
                                              getPoppinsTextSpanDetails(
                                                  text: SalesQuotationUI
                                                      .itemDetailModel
                                                      ?.intOpenInvoice
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
                                          left: 8.0, right: 8.0, top: 4.0),
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text.rich(
                                          TextSpan(
                                            children: [
                                              getPoppinsTextSpanHeading(
                                                  text: 'Ordered'),
                                              getPoppinsTextSpanDetails(
                                                  text: SalesQuotationUI
                                                      .itemDetailModel
                                                      ?.intOrdered
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
                                          left: 8.0, right: 8.0, top: 4.0),
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text.rich(
                                          TextSpan(
                                            children: [
                                              getPoppinsTextSpanHeading(
                                                  text: 'Committed'),
                                              getPoppinsTextSpanDetails(
                                                  text: SalesQuotationUI
                                                      .itemDetailModel
                                                      ?.intCommitted
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
                                          left: 8.0, right: 8.0, top: 4.0),
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text.rich(
                                          TextSpan(
                                            children: [
                                              getPoppinsTextSpanHeading(
                                                  text: 'Item Cost'),
                                              getPoppinsTextSpanDetails(
                                                  text: SalesQuotationUI
                                                      .itemDetailModel
                                                      ?.decItemCost
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

                            ],
                          ),
                        ],
                      ),
                    ),
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
    );
  }
}
