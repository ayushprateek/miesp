import 'package:bill/theme/get_text_field.dart';
import 'package:bill/ui/product/SalesQuotationUI.dart';
import 'package:flutter/material.dart';

class GeneralDataUI extends StatefulWidget {
  @override
  _GeneralDataUIState createState() => _GeneralDataUIState();
}

class _GeneralDataUIState extends State<GeneralDataUI> {
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
                  // color: const Color(0XFFC46253),
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
                      controller: BarCode,
                      labelText: 'BarCode',
                      onChanged: (val) {
                        SalesQuotationUI.itemDetailModel?.varBarcode = val;
                      }),
                  getDisabledTextField(
                      controller: ItemNo,
                      labelText: 'Item No',
                      onChanged: (val) {
                        SalesQuotationUI.itemDetailModel?.varItemNo = val;
                      }),
                  getDisabledTextField(
                      controller: ItemDescription,
                      labelText: 'Item Description',
                      onChanged: (val) {
                        SalesQuotationUI.itemDetailModel?.varItemDescription =
                            val;
                      }),
                  getDisabledTextField(
                      controller: UomGroupCode,
                      labelText: 'Uom Group Code',
                      onChanged: (val) {
                        SalesQuotationUI.itemDetailModel?.varUomCode = val;
                      }),
                  getDisabledTextField(
                      controller: UomGroupName,
                      labelText: 'Uom Group Name',
                      onChanged: (val) {
                        SalesQuotationUI.itemDetailModel?.varUomGroupName = val;
                      }),
                  getDisabledTextField(
                      controller: UomCode,
                      labelText: 'Uom Code',
                      onChanged: (val) {
                        SalesQuotationUI.itemDetailModel?.varUomCode = val;
                      }),
                  getDisabledTextField(
                      controller: UomName,
                      labelText: 'Uom Name',
                      onChanged: (val) {
                        SalesQuotationUI.itemDetailModel?.varUomName = val;
                      }),
                  getDisabledTextField(
                      controller: ForeignName,
                      labelText: 'Foreign Name',
                      onChanged: (val) {
                        SalesQuotationUI.itemDetailModel?.varForeignName = val;
                      }),
                  getDisabledTextField(
                      controller: ItemCategory,
                      labelText: 'Item Category',
                      onChanged: (val) {
                        SalesQuotationUI.itemDetailModel?.varItemCategory = val;
                      }),
                  getDisabledTextField(
                      controller: ItemCategory,
                      labelText: 'Item Category',
                      onChanged: (val) {
                        SalesQuotationUI.itemDetailModel?.varItemCategory = val;
                      }),
                  getDisabledTextField(
                      controller: BrandName,
                      labelText: 'Brand Name',
                      onChanged: (val) {
                        SalesQuotationUI.itemDetailModel?.varBrandName = val;
                      }),
                  getDisabledTextField(
                      controller: GroupName,
                      labelText: 'Group Name',
                      onChanged: (val) {
                        SalesQuotationUI.itemDetailModel?.varGroupName = val;
                      }),
                  getDisabledTextField(
                      controller: ItemImage,
                      labelText: 'Item Image',
                      onChanged: (val) {
                        SalesQuotationUI.itemDetailModel?.varItemImage = val;
                      }),
                  getDisabledTextField(
                      controller: LastMonthSalesQty,
                      labelText: 'Last Month Sales Qty',
                      onChanged: (val) {
                        SalesQuotationUI.itemDetailModel?.decLastMonthSalesQty =
                            double.tryParse(val) ??
                                SalesQuotationUI
                                    .itemDetailModel?.decLastMonthSalesQty;
                      }),
                  getDisabledTextField(
                      controller: Last90DaysSalesQty,
                      labelText: 'Last 90 Days Sales Qty',
                      onChanged: (val) {
                        SalesQuotationUI
                                .itemDetailModel?.decLast90DaysSalesQty =
                            double.tryParse(val) ??
                                SalesQuotationUI
                                    .itemDetailModel?.decLast90DaysSalesQty;
                      }),
                  getDisabledTextField(
                      controller: LastSellingPrice,
                      labelText: 'Last Selling Price',
                      onChanged: (val) {
                        SalesQuotationUI.itemDetailModel?.decLastSellingPrice =
                            double.tryParse(val) ??
                                SalesQuotationUI
                                    .itemDetailModel?.decLastSellingPrice;
                      }),
                  getDisabledTextField(
                      controller: OpenOrders,
                      labelText: 'Open Orders',
                      onChanged: (val) {
                        SalesQuotationUI.itemDetailModel?.intOpenOrders =
                            int.tryParse(val) ??
                                SalesQuotationUI.itemDetailModel?.intOpenOrders;
                      }),
                  getDisabledTextField(
                      controller: OpenInvoice,
                      labelText: 'Open Invoice',
                      onChanged: (val) {
                        SalesQuotationUI.itemDetailModel?.intOpenInvoice =
                            int.tryParse(val) ??
                                SalesQuotationUI
                                    .itemDetailModel?.intOpenInvoice;
                      }),
                  getDisabledTextField(
                      controller: Ordered,
                      labelText: 'Ordered',
                      onChanged: (val) {
                        SalesQuotationUI.itemDetailModel?.intOrdered =
                            int.tryParse(val) ??
                                SalesQuotationUI.itemDetailModel?.intOrdered;
                      }),
                  getDisabledTextField(
                      controller: Committed,
                      labelText: 'Committed',
                      onChanged: (val) {
                        SalesQuotationUI.itemDetailModel?.intCommitted =
                            int.tryParse(val) ??
                                SalesQuotationUI.itemDetailModel?.intCommitted;
                      }),
                  getDisabledTextField(
                      controller: ItemCost,
                      labelText: 'Item Cost',
                      onChanged: (val) {
                        SalesQuotationUI.itemDetailModel?.decItemCost =
                            double.tryParse(val) ??
                                SalesQuotationUI.itemDetailModel?.decItemCost;
                      }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
