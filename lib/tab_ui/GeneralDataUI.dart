import 'package:bill/common/get_formatted_date.dart';
import 'package:bill/theme/custom_colors.dart';
import 'package:bill/theme/get_text_field.dart';
import 'package:bill/ui/components/elements_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:table_calendar/table_calendar.dart';

class GeneralDataUI extends StatefulWidget {

  @override
  _GeneralDataUIState createState() => _GeneralDataUIState();
}

class _GeneralDataUIState extends State<GeneralDataUI> {

  TextEditingController BarCode = TextEditingController();
  TextEditingController ItemCode = TextEditingController();
  TextEditingController ItemName = TextEditingController();
  TextEditingController ItemGroup = TextEditingController();
  TextEditingController UOMGroup = TextEditingController();
  TextEditingController ItemCategory = TextEditingController();


  @override
  void initState() {
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8, bottom: 8, top: 20),
        child: Container(
          decoration: BoxDecoration(
              // color: const Color(0XFFC46253),
              border: Border.all(),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16), topRight: Radius.circular(16))),
          child: Column(
            children: [
              const SizedBox(height: 25,),
              getDisabledTextField(controller: BarCode,labelText: 'BarCode',),
              getDisabledTextField(controller: ItemCode,labelText: 'Item Code',),
              getDisabledTextField(controller: ItemName,labelText: 'Item Name',),
              getDisabledTextField(controller: ItemGroup,labelText: 'Item Group',),
              getDisabledTextField(controller: UOMGroup,labelText: 'UOM Group',),
              getDisabledTextField(controller: ItemCategory,labelText: 'Item Category',),

            ],
          ),
        ),
      ),
    );
  }


}
