import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:litsales/Component/CustomColor.dart';
import 'package:litsales/Component/GetFormattedDate.dart';
import 'package:litsales/Component/SnackbarComponent.dart';
import 'package:table_calendar/table_calendar.dart';

class GeneralDataUI extends StatefulWidget {
  static bool isSelected = false;
  static String? ID,
      ContactPersonID,
      TransId,
      customerCode,
      // CardCode,
      customerName,
      //CardName,
      RefNo,
      ContactPerson,
      MobileNo,
      PostingDate,
      ValidUntill,
      Currency,
      PaymentTermCode,
      PaymentTermName,
      PaymentTermDays,
      ApprovalStatus,
      DocStatus,
      CurrRate,
      postingAddress;
  static double? TotBDisc, DiscPer, DiscVal, TaxVal, Doctotal;

  @override
  _GeneralDataUIState createState() => _GeneralDataUIState();
}

class _GeneralDataUIState extends State<GeneralDataUI> {
  TextEditingController ID = TextEditingController(text: GeneralDataUI.ID);
  TextEditingController TransId =
      TextEditingController(text: GeneralDataUI.TransId);
  TextEditingController customerCode =
      TextEditingController(text: GeneralDataUI.customerCode);
  TextEditingController customerName =
      TextEditingController(text: GeneralDataUI.customerName);
  TextEditingController RefNo =
      TextEditingController(text: GeneralDataUI.RefNo);
  TextEditingController ContactPersonID =
      TextEditingController(text: GeneralDataUI.ContactPersonID);
  TextEditingController ContactPerson =
      TextEditingController(text: GeneralDataUI.ContactPerson);
  TextEditingController MobileNo =
      TextEditingController(text: GeneralDataUI.MobileNo);
  TextEditingController PostingDate =
      TextEditingController(text: GeneralDataUI.PostingDate);
  TextEditingController ValidUntill =
      TextEditingController(text: GeneralDataUI.ValidUntill);
  TextEditingController Currency =
      TextEditingController(text: GeneralDataUI.Currency);
  TextEditingController CurrRate =
      TextEditingController(text: GeneralDataUI.CurrRate);
  TextEditingController PaymentTermCode =
      TextEditingController(text: GeneralDataUI.PaymentTermCode);
  TextEditingController PaymentTermName =
      TextEditingController(text: GeneralDataUI.PaymentTermName);
  TextEditingController PaymentTermDays =
      TextEditingController(text: GeneralDataUI.PaymentTermDays);

  TextEditingController DocStatus = TextEditingController(
      text: GeneralDataUI.DocStatus == null || GeneralDataUI.DocStatus == ""
          ? "Open"
          : GeneralDataUI.DocStatus);

  // TextEditingController MTransID = TextEditingController(text: GeneralDataUI.MTransID);

  TextEditingController postingAddress =
      TextEditingController(text: GeneralDataUI.postingAddress);

  String? Status = GeneralDataUI.ApprovalStatus == ""
      ? "Pending"
      : GeneralDataUI.ApprovalStatus;
  List<String> status = [];

  @override
  void initState() {
    super.initState();
  }

  void setTextFields() {
    GeneralDataUI.ID = ID.text;
    GeneralDataUI.TransId = TransId.text;
    GeneralDataUI.customerCode = customerCode.text;
    GeneralDataUI.customerName = customerName.text;
    GeneralDataUI.RefNo = RefNo.text;
    GeneralDataUI.ContactPersonID = ContactPersonID.text;
    GeneralDataUI.ContactPerson = ContactPerson.text;
    GeneralDataUI.MobileNo = MobileNo.text;
    GeneralDataUI.PostingDate = PostingDate.text;
    GeneralDataUI.ValidUntill = ValidUntill.text;
    GeneralDataUI.Currency = Currency.text;
    GeneralDataUI.CurrRate = CurrRate.text;
    GeneralDataUI.PaymentTermCode = PaymentTermCode.text;
    GeneralDataUI.PaymentTermName = PaymentTermName.text;
    GeneralDataUI.PaymentTermDays = PaymentTermDays.text;
    GeneralDataUI.ApprovalStatus = Status;
    GeneralDataUI.DocStatus = DocStatus.text;
    // GeneralDataUI.MTransID = MTransID.text;
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
              Padding(
                padding: const EdgeInsets.only(
                    bottom: 6.0, left: 8, right: 8, top: 25),
                child: Container(
                  height: MediaQuery.of(context).size.height / 20,
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: TransId,
                          onChanged: (value) {
                            GeneralDataUI.TransId = value;
                          },
                          decoration: new InputDecoration(
                            labelStyle: GoogleFonts.poppins(
                                fontSize: 14, fontWeight: FontWeight.w500),
                            filled: true,
                            labelText: 'Transaction Id',

                            //prefixIconConstraints: BoxConstraints(minWidth: 0,minHeight: 0),
                            fillColor: HexColor("#F3ECE7"),
                            disabledBorder: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(10.0),
                              borderSide:
                                  new BorderSide(color: barColor, width: 1),
                            ),
                            hoverColor: Colors.red,
                            focusedBorder: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(10.0),
                              borderSide:
                                  new BorderSide(color: barColor, width: 1),
                            ),

                            //focusColor:HexColor("#27ab87"),
                            // isDense: true,
                            hintText: "Transaction Id",
                            // fillColor: Colors.red,

                            // border: new OutlineInputBorder(
                            //   borderRadius: new BorderRadius.circular(10.0),
                            //   borderSide: new BorderSide(
                            //     color: barColor,
                            //     width: 1
                            //   ),
                            // ),
                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(10.0),
                              borderSide:
                                  new BorderSide(color: barColor, width: 1),
                            ),
                            //fillColor: Colors.green
                          ),
                          readOnly: true,
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('Uneditable'),
                              backgroundColor: Colors.red,
                              duration: Duration(seconds: 2),
                            ));
                          },
                          //keyboardType: TextInputType.number,
                          style: new TextStyle(
                            fontFamily: "Poppins",
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        onPressed: null,
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 6.0,
                  left: 8,
                  right: 8,
                ),
                child: Container(
                  height: MediaQuery.of(context).size.height / 20,
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: customerCode,

                          onChanged: (value) {
                            GeneralDataUI.customerCode = value;
                          },
                          decoration: new InputDecoration(
                            labelStyle: GoogleFonts.poppins(
                                fontSize: 14, fontWeight: FontWeight.w500),
                            filled: true,
                            labelText: 'Customer Code',

                            //prefixIconConstraints: BoxConstraints(minWidth: 0,minHeight: 0),
                            fillColor: HexColor("#F3ECE7"),
                            hoverColor: Colors.red,
                            focusedBorder: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(10.0),
                              borderSide:
                                  new BorderSide(color: barColor, width: 1),
                            ),
                            //focusColor:HexColor("#27ab87"),
                            // isDense: true,
                            hintText: "Customer Code",
                            // fillColor: Colors.red,

                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(10.0),
                              borderSide:
                                  new BorderSide(color: barColor, width: 1),
                            ),
                            //fillColor: Colors.green
                          ),
                          readOnly: true,
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('Uneditable'),
                              backgroundColor: Colors.red,
                              duration: Duration(seconds: 2),
                            ));
                          },
                          //keyboardType: TextInputType.number,
                          style: new TextStyle(
                            fontFamily: "Poppins",
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        onPressed: null,
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 6.0,
                  left: 8,
                  right: 8,
                ),
                child: Container(
                  height: MediaQuery.of(context).size.height / 20,
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: customerName,
                          onChanged: (value) {
                            GeneralDataUI.customerName = value;
                          },
                          decoration: new InputDecoration(
                            labelStyle: GoogleFonts.poppins(
                                fontSize: 14, fontWeight: FontWeight.w500),
                            filled: true,
                            labelText: 'Customer Name',

                            //prefixIconConstraints: BoxConstraints(minWidth: 0,minHeight: 0),
                            fillColor: HexColor("#F3ECE7"),
                            hoverColor: Colors.red,
                            focusedBorder: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(10.0),
                              borderSide:
                                  new BorderSide(color: barColor, width: 1),
                            ),
                            //focusColor:HexColor("#27ab87"),
                            // isDense: true,
                            hintText: "Customer Name",
                            // fillColor: Colors.red,

                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(10.0),
                              borderSide:
                                  new BorderSide(color: barColor, width: 1),
                            ),
                            //fillColor: Colors.green
                          ),
                          readOnly: true,
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('Uneditable'),
                              backgroundColor: Colors.red,
                              duration: Duration(seconds: 2),
                            ));
                          },
                          //keyboardType: TextInputType.number,
                          style: new TextStyle(
                            fontFamily: "Poppins",
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        onPressed: null,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 6.0,
                  left: 8,
                  right: 8,
                ),
                child: Container(
                  height: MediaQuery.of(context).size.height / 20,
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: RefNo,
                          onChanged: (value) {
                            GeneralDataUI.RefNo = value;
                          },

                          decoration: new InputDecoration(
                            labelStyle: GoogleFonts.poppins(
                                fontSize: 14, fontWeight: FontWeight.w500),
                            filled: true,
                            labelText: 'Ref No.',

                            //prefixIconConstraints: BoxConstraints(minWidth: 0,minHeight: 0),
                            fillColor: Colors.white,
                            hoverColor: Colors.red,
                            focusedBorder: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(10.0),
                              borderSide:
                                  new BorderSide(color: barColor, width: 1),
                            ),
                            //focusColor:HexColor("#27ab87"),
                            // isDense: true,
                            hintText: "Ref No.",
                            // fillColor: Colors.red,

                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(10.0),
                              borderSide:
                                  new BorderSide(color: barColor, width: 1),
                            ),
                            //fillColor: Colors.green
                          ),

                          //keyboardType: TextInputType.number,
                          style: new TextStyle(
                            fontFamily: "Poppins",
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        onPressed: null,
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 6.0,
                  left: 8,
                  right: 8,
                ),
                child: Container(
                  height: MediaQuery.of(context).size.height / 20,
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: ContactPersonID,
                          onChanged: (value) {
                            GeneralDataUI.ContactPersonID = value;
                          },
                          decoration: new InputDecoration(
                            labelStyle: GoogleFonts.poppins(
                                fontSize: 14, fontWeight: FontWeight.w500),
                            filled: true,
                            labelText: 'Contact Person ID',

                            //prefixIconConstraints: BoxConstraints(minWidth: 0,minHeight: 0),
                            fillColor: HexColor("#F3ECE7"),
                            hoverColor: Colors.red,
                            focusedBorder: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(10.0),
                              borderSide:
                                  new BorderSide(color: barColor, width: 1),
                            ),
                            //focusColor:HexColor("#27ab87"),
                            // isDense: true,
                            hintText: "Contact Person ID",
                            // fillColor: Colors.red,

                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(10.0),
                              borderSide:
                                  new BorderSide(color: barColor, width: 1),
                            ),
                            //fillColor: Colors.green
                          ),
                          readOnly: true,
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('Uneditable'),
                              backgroundColor: Colors.red,
                              duration: Duration(seconds: 2),
                            ));
                          },
                          //keyboardType: TextInputType.number,
                          style: new TextStyle(
                            fontFamily: "Poppins",
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.search,
                          color: barColor,
                        ),
                        onPressed: () {},
                      )
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(
                  bottom: 6.0,
                  left: 8,
                  right: 8,
                ),
                child: Container(
                  height: MediaQuery.of(context).size.height / 20,
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: ContactPerson,
                          onChanged: (value) {
                            GeneralDataUI.ContactPerson = value;
                          },
                          decoration: new InputDecoration(
                            labelStyle: GoogleFonts.poppins(
                                fontSize: 14, fontWeight: FontWeight.w500),
                            filled: true,
                            labelText: 'Contact Person',

                            //prefixIconConstraints: BoxConstraints(minWidth: 0,minHeight: 0),
                            fillColor: HexColor("#F3ECE7"),
                            hoverColor: Colors.red,
                            focusedBorder: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(10.0),
                              borderSide:
                                  new BorderSide(color: barColor, width: 1),
                            ),
                            //focusColor:HexColor("#27ab87"),
                            // isDense: true,
                            hintText: "Contact Person",
                            // fillColor: Colors.red,

                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(10.0),
                              borderSide:
                                  new BorderSide(color: barColor, width: 1),
                            ),
                            //fillColor: Colors.green
                          ),
                          readOnly: true,
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('Uneditable'),
                              backgroundColor: Colors.red,
                              duration: Duration(seconds: 2),
                            ));
                          },
                          //keyboardType: TextInputType.number,
                          style: new TextStyle(
                            fontFamily: "Poppins",
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        onPressed: null,
                      )
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(
                  bottom: 6.0,
                  left: 8,
                  right: 8,
                ),
                child: Container(
                  height: MediaQuery.of(context).size.height / 20,
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: MobileNo,
                          onChanged: (value) {
                            GeneralDataUI.MobileNo = value;
                          },
                          decoration: new InputDecoration(
                            labelStyle: GoogleFonts.poppins(
                                fontSize: 14, fontWeight: FontWeight.w500),
                            filled: true,
                            labelText: 'Mobile No.',

                            //prefixIconConstraints: BoxConstraints(minWidth: 0,minHeight: 0),
                            fillColor: Colors.white,
                            hoverColor: Colors.red,
                            focusedBorder: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(10.0),
                              borderSide:
                                  new BorderSide(color: barColor, width: 1),
                            ),
                            //focusColor:HexColor("#27ab87"),
                            // isDense: true,
                            hintText: "Mobile No.",
                            // fillColor: Colors.red,

                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(10.0),
                              borderSide:
                                  new BorderSide(color: barColor, width: 1),
                            ),
                            //fillColor: Colors.green
                          ),
                          keyboardType: TextInputType.number,
                          style: new TextStyle(
                            fontFamily: "Poppins",
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        onPressed: null,
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 6.0,
                  left: 8,
                  right: 8,
                ),
                child: Container(
                  height: MediaQuery.of(context).size.height / 20,
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: PostingDate,
                          onChanged: (value) {
                            GeneralDataUI.PostingDate = value;
                          },
                          decoration: new InputDecoration(
                            labelStyle: GoogleFonts.poppins(
                                fontSize: 14, fontWeight: FontWeight.w500),
                            filled: true,
                            labelText: 'Posting Date',

                            //prefixIconConstraints: BoxConstraints(minWidth: 0,minHeight: 0),
                            fillColor: Colors.white,
                            hoverColor: Colors.red,
                            focusedBorder: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(10.0),
                              borderSide:
                                  new BorderSide(color: barColor, width: 1),
                            ),
                            //focusColor:HexColor("#27ab87"),
                            // isDense: true,
                            hintText: "Posting Date",
                            // fillColor: Colors.red,

                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(10.0),
                              borderSide:
                                  new BorderSide(color: barColor, width: 1),
                            ),
                            //fillColor: Colors.green
                          ),
                          readOnly: true,
                          onTap: () {},
                          //keyboardType: TextInputType.number,
                          style: new TextStyle(
                            fontFamily: "Poppins",
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        onPressed: null,
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 6.0,
                  left: 8,
                  right: 8,
                ),
                child: Container(
                  height: MediaQuery.of(context).size.height / 20,
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: ValidUntill,
                          onChanged: (value) {
                            GeneralDataUI.ValidUntill = value;
                          },
                          decoration: new InputDecoration(
                            labelStyle: GoogleFonts.poppins(
                                fontSize: 14, fontWeight: FontWeight.w500),
                            filled: true,
                            labelText: 'Valid Untill',

                            //prefixIconConstraints: BoxConstraints(minWidth: 0,minHeight: 0),
                            fillColor: Colors.white,
                            hoverColor: Colors.red,
                            focusedBorder: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(10.0),
                              borderSide:
                                  new BorderSide(color: barColor, width: 1),
                            ),
                            //focusColor:HexColor("#27ab87"),
                            // isDense: true,
                            hintText: "Valid Untill",
                            // fillColor: Colors.red,

                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(10.0),
                              borderSide:
                                  new BorderSide(color: barColor, width: 1),
                            ),
                            //fillColor: Colors.green
                          ),
                          readOnly: true,
                          onTap: () {},
                          //keyboardType: TextInputType.number,
                          style: new TextStyle(
                            fontFamily: "Poppins",
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        onPressed: null,
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 6.0,
                  left: 8,
                  right: 8,
                ),
                child: Container(
                  height: MediaQuery.of(context).size.height / 20,
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: Currency,
                          onChanged: (value) {
                            GeneralDataUI.Currency = value;
                          },
                          decoration: new InputDecoration(
                            labelStyle: GoogleFonts.poppins(
                                fontSize: 14, fontWeight: FontWeight.w500),
                            filled: true,
                            labelText: 'Currency',

                            //prefixIconConstraints: BoxConstraints(minWidth: 0,minHeight: 0),
                            fillColor: HexColor("#F3ECE7"),
                            hoverColor: Colors.red,
                            focusedBorder: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(10.0),
                              borderSide:
                                  new BorderSide(color: barColor, width: 1),
                            ),
                            //focusColor:HexColor("#27ab87"),
                            // isDense: true,
                            hintText: "Currency",
                            // fillColor: Colors.red,

                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(10.0),
                              borderSide:
                                  new BorderSide(color: barColor, width: 1),
                            ),
                            //fillColor: Colors.green
                          ),
                          readOnly: true,
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('Uneditable'),
                              backgroundColor: Colors.red,
                              duration: Duration(seconds: 2),
                            ));
                          },
                          //keyboardType: TextInputType.number,
                          style: new TextStyle(
                            fontFamily: "Poppins",
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        onPressed: null,
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 6.0,
                  left: 8,
                  right: 8,
                ),
                child: Container(
                  height: MediaQuery.of(context).size.height / 20,
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: CurrRate,
                          onChanged: (value) {
                            GeneralDataUI.CurrRate = value;
                          },
                          readOnly: true,
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('Uneditable'),
                              backgroundColor: Colors.red,
                              duration: Duration(seconds: 2),
                            ));
                          },
                          decoration: new InputDecoration(
                            labelStyle: GoogleFonts.poppins(
                                fontSize: 14, fontWeight: FontWeight.w500),
                            filled: true,
                            labelText: 'Currency Rate',

                            //prefixIconConstraints: BoxConstraints(minWidth: 0,minHeight: 0),
                            fillColor: HexColor("F3ECE7"),
                            hoverColor: Colors.red,
                            focusedBorder: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(10.0),
                              borderSide:
                                  new BorderSide(color: barColor, width: 1),
                            ),
                            //focusColor:HexColor("#27ab87"),
                            // isDense: true,
                            hintText: "Currency Rate",
                            // fillColor: Colors.red,

                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(10.0),
                              borderSide:
                                  new BorderSide(color: barColor, width: 1),
                            ),
                            //fillColor: Colors.green
                          ),
                          keyboardType: TextInputType.number,
                          style: new TextStyle(
                            fontFamily: "Poppins",
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        onPressed: null,
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 6.0,
                  left: 8,
                  right: 8,
                ),
                child: Container(
                  height: MediaQuery.of(context).size.height / 20,
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: PaymentTermCode,
                          onChanged: (value) {
                            GeneralDataUI.PaymentTermCode = value;
                          },
                          decoration: new InputDecoration(
                            labelStyle: GoogleFonts.poppins(
                                fontSize: 14, fontWeight: FontWeight.w500),
                            filled: true,
                            labelText: 'Payment Term Code',

                            //prefixIconConstraints: BoxConstraints(minWidth: 0,minHeight: 0),
                            fillColor: HexColor("#F3ECE7"),
                            hoverColor: Colors.red,
                            focusedBorder: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(10.0),
                              borderSide:
                                  new BorderSide(color: barColor, width: 1),
                            ),
                            //focusColor:HexColor("#27ab87"),
                            // isDense: true,
                            hintText: "Payment Term Code",
                            // fillColor: Colors.red,

                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(10.0),
                              borderSide:
                                  new BorderSide(color: barColor, width: 1),
                            ),
                            //fillColor: Colors.green
                          ),
                          readOnly: true,
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('Uneditable'),
                              backgroundColor: Colors.red,
                              duration: Duration(seconds: 2),
                            ));
                          },
                          //keyboardType: TextInputType.number,
                          style: new TextStyle(
                            fontFamily: "Poppins",
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.search,
                          color: barColor,
                        ),
                        onPressed: () {},
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 6.0,
                  left: 8,
                  right: 8,
                ),
                child: Container(
                  height: MediaQuery.of(context).size.height / 20,
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: PaymentTermName,
                          onChanged: (value) {
                            GeneralDataUI.PaymentTermName = value;
                          },
                          decoration: new InputDecoration(
                            labelStyle: GoogleFonts.poppins(
                                fontSize: 14, fontWeight: FontWeight.w500),
                            filled: true,
                            labelText: 'Payment Term Name',

                            //prefixIconConstraints: BoxConstraints(minWidth: 0,minHeight: 0),
                            fillColor: HexColor("#F3ECE7"),
                            hoverColor: Colors.red,
                            focusedBorder: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(10.0),
                              borderSide:
                                  new BorderSide(color: barColor, width: 1),
                            ),
                            //focusColor:HexColor("#27ab87"),
                            // isDense: true,
                            hintText: "Payment Term Name",
                            // fillColor: Colors.red,

                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(10.0),
                              borderSide:
                                  new BorderSide(color: barColor, width: 1),
                            ),
                            //fillColor: Colors.green
                          ),
                          readOnly: true,
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('Uneditable'),
                              backgroundColor: Colors.red,
                              duration: Duration(seconds: 2),
                            ));
                          },
                          //keyboardType: TextInputType.number,
                          style: new TextStyle(
                            fontFamily: "Poppins",
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        onPressed: null,
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 6.0,
                  left: 8,
                  right: 8,
                ),
                child: Container(
                  height: MediaQuery.of(context).size.height / 20,
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: PaymentTermDays,
                          onChanged: (value) {
                            GeneralDataUI.PaymentTermDays = value;
                          },
                          decoration: new InputDecoration(
                            labelStyle: GoogleFonts.poppins(
                                fontSize: 14, fontWeight: FontWeight.w500),
                            filled: true,
                            labelText: 'Payment Term Days',

                            //prefixIconConstraints: BoxConstraints(minWidth: 0,minHeight: 0),
                            fillColor: HexColor("#F3ECE7"),
                            hoverColor: Colors.red,
                            focusedBorder: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(10.0),
                              borderSide:
                                  new BorderSide(color: barColor, width: 1),
                            ),
                            //focusColor:HexColor("#27ab87"),
                            // isDense: true,
                            hintText: "Payment Term Days",
                            // fillColor: Colors.red,

                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(10.0),
                              borderSide: new BorderSide(),
                            ),
                            //fillColor: Colors.green
                          ),
                          readOnly: true,
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('Uneditable'),
                              backgroundColor: Colors.red,
                              duration: Duration(seconds: 2),
                            ));
                          },
                          //keyboardType: TextInputType.number,
                          style: new TextStyle(
                            fontFamily: "Poppins",
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        onPressed: null,
                      )
                    ],
                  ),
                ),
              ),

              // Padding(
              //   padding: const EdgeInsets.only(bottom: 6.0,left: 8,right: 8,),
              //   child: Container(
              //     height: MediaQuery.of(context).size.height/16,
              //     child: Row(
              //       children: [
              //         Expanded(
              //           child: TextFormField(
              //             controller: ApprovalStatus,
              //             onChanged: (value){
              //               GeneralDataUI.ApprovalStatus=value;
              //             },
              //             decoration: new InputDecoration(
              //               filled: true,
              //               labelText: 'Approval Status',
              //
              //
              //               //prefixIconConstraints: BoxConstraints(minWidth: 0,minHeight: 0),
              //               fillColor: HexColor("#F3ECE7"),
              //               hoverColor: Colors.red,
              //               focusedBorder: new OutlineInputBorder(
              //                 borderRadius: new BorderRadius.circular(10.0),
              //                 borderSide:
              //                 new BorderSide(color: barColor,),
              //               ),
              //               //focusColor:HexColor("#27ab87"),
              //               // isDense: true,
              //               hintText: "Approval Status",
              //               // fillColor: Colors.red,
              //
              //               border: new OutlineInputBorder(
              //                 borderRadius: new BorderRadius.circular(10.0),
              //                 borderSide: new BorderSide(),
              //               ),
              //               //fillColor: Colors.green
              //             ),
              //             readOnly: true,
              //             onTap: (){
              //               getErrorSnackBar("Uneditable");
              //             },
              //             //keyboardType: TextInputType.number,
              //             style: new TextStyle(
              //               fontFamily: "Poppins",
              //             ),
              //           ),
              //         ),
              //         IconButton(
              //           icon: Icon(Icons.select_all,color: Colors.white,),
              //           onPressed: null,
              //         )
              //       ],
              //     ),
              //   ),
              // ),

              Padding(
                padding: const EdgeInsets.only(
                  bottom: 6.0,
                  left: 8,
                  right: 8,
                ),
                child: Container(
                  height: MediaQuery.of(context).size.height / 20,
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: DocStatus,
                          onChanged: (value) {
                            GeneralDataUI.DocStatus = value;
                          },
                          decoration: new InputDecoration(
                            labelStyle: GoogleFonts.poppins(
                                fontSize: 14, fontWeight: FontWeight.w500),
                            filled: true,
                            labelText: 'Document Status',

                            //prefixIconConstraints: BoxConstraints(minWidth: 0,minHeight: 0),
                            fillColor: HexColor("#F3ECE7"),
                            hoverColor: Colors.red,
                            focusedBorder: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(10.0),
                              borderSide:
                                  new BorderSide(color: barColor, width: 1),
                            ),
                            //focusColor:HexColor("#27ab87"),
                            // isDense: true,
                            hintText: "Document Status",
                            // fillColor: Colors.red,

                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(10.0),
                              borderSide:
                                  new BorderSide(color: barColor, width: 1),
                            ),
                            //fillColor: Colors.green
                          ),
                          readOnly: true,
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('Uneditable'),
                              backgroundColor: Colors.red,
                              duration: Duration(seconds: 2),
                            ));
                          },
                          //keyboardType: TextInputType.number,
                          style: new TextStyle(
                            fontFamily: "Poppins",
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        onPressed: null,
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 6.0,
                  left: 8,
                  right: 8,
                ),
                child: Container(
                  height: MediaQuery.of(context).size.height / 20,
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: postingAddress,
                          onChanged: (value) {
                            GeneralDataUI.postingAddress = value;
                          },
                          decoration: new InputDecoration(
                            labelStyle: GoogleFonts.poppins(
                                fontSize: 14, fontWeight: FontWeight.w500),
                            filled: true,
                            labelText: 'Posting Address',

                            //prefixIconConstraints: BoxConstraints(minWidth: 0,minHeight: 0),
                            fillColor: HexColor("#F3ECE7"),
                            hoverColor: Colors.red,
                            focusedBorder: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(10.0),
                              borderSide: new BorderSide(
                                color: barColor,
                              ),
                            ),
                            //focusColor:HexColor("#27ab87"),
                            // isDense: true,
                            hintText: "Posting Address",
                            // fillColor: Colors.red,

                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(10.0),
                              borderSide: new BorderSide(),
                            ),
                            //fillColor: Colors.green
                          ),
                          readOnly: true,
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('Uneditable'),
                              backgroundColor: Colors.red,
                              duration: Duration(seconds: 2),
                            ));
                          },
                          //keyboardType: TextInputType.number,
                          style: new TextStyle(
                            fontFamily: "Poppins",
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        onPressed: null,
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 6.0,
                  left: 8,
                  right: 8,
                ),
                child: Container(
                  height: MediaQuery.of(context).size.height / 20,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          child: Text(
                            "Approval Status : ",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: DropdownButton<String>(
                          items: status.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (val) {
                            setState(() {
                              GeneralDataUI.ApprovalStatus = val!;
                              Status = val;
                            });
                          },
                          value: Status,
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        onPressed: null,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void customCalender(BuildContext context, bool isPostingDate) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(26.0))),
            contentPadding: EdgeInsets.only(top: 10.0),

            content: Container(
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: TableCalendar(
                    firstDay: DateTime.utc(2010, 10, 16),
                    lastDay: DateTime.utc(2030, 3, 14),
                    focusedDay: DateTime.now(),
                    onDaySelected: (DateTime dateTime, DateTime dateTime2) {
                      print(dateTime.toIso8601String());
                      setState(() {});
                      if (isPostingDate) {
                        PostingDate.text = getFormattedDate(dateTime);
                        GeneralDataUI.PostingDate = getFormattedDate(dateTime);
                      } else {
                        ValidUntill.text = getFormattedDate(dateTime);
                        GeneralDataUI.ValidUntill = getFormattedDate(dateTime);
                      }
                      if (PostingDate.text.isNotEmpty &&
                          ValidUntill.text.isNotEmpty) {
                        //Calculate Factor
                        DateTime fromDate = getDateFromString(PostingDate.text);
                        DateTime toDate = getDateFromString(ValidUntill.text);
                        if (fromDate.compareTo(toDate) > 0) {
                          PostingDate.clear();
                          ValidUntill.clear();

                          getErrorSnackBar(
                              "Posting Date can not be after Valid Untill");
                        }
                      }
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
            ), //
          );
        });
  }

  void clearTextFields() {
    ID.clear();
    GeneralDataUI.ID = null;
    // ApprovalStatus.clear();GeneralDataUI.ApprovalStatus=null;

    ContactPerson.clear();
    GeneralDataUI.ContactPerson = null;
    customerCode.clear();
    GeneralDataUI.customerCode = null;
    customerName.clear();
    GeneralDataUI.customerName = null;
    ContactPersonID.clear();
    GeneralDataUI.ContactPersonID = null;
    Currency.clear();
    GeneralDataUI.Currency = null;
    CurrRate.clear();
    GeneralDataUI.CurrRate = null;
    DocStatus.clear();
    GeneralDataUI.DocStatus = null;
    MobileNo.clear();
    GeneralDataUI.MobileNo = null;
    PaymentTermCode.clear();
    GeneralDataUI.PaymentTermCode = null;
    PaymentTermDays.clear();
    GeneralDataUI.PaymentTermDays = null;
    PaymentTermName.clear();
    GeneralDataUI.PaymentTermName = null;
    PostingDate.clear();
    GeneralDataUI.PostingDate = null;
    RefNo.clear();
    GeneralDataUI.RefNo = null;
    TransId.clear();
    GeneralDataUI.TransId = null;
    ValidUntill.clear();
    GeneralDataUI.ValidUntill = null;
    GeneralDataUI.ApprovalStatus = "Pending";
    Status = "Pending";
  }
}
