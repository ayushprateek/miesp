import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:litsales/Component/CustomColor.dart';
import 'package:litsales/Component/SnackbarComponent.dart';


class BillingAddressUI extends StatefulWidget {
  static int? TransId, RowId, ID;
  static String? Addres,
      CityName,
      StateName,
      CountryName,
      AddCode,
      CityCode,
      StateCode,
      CountryCode;
  static double? Latitude, Longitude;

  @override
  _BillingAddressUIState createState() => _BillingAddressUIState();
}

class _BillingAddressUIState extends State<BillingAddressUI> {
  TextEditingController TransId = TextEditingController(
      text: BillingAddressUI.TransId == null
          ? ""
          : BillingAddressUI.TransId.toString());
  TextEditingController RowId = TextEditingController(
      text: BillingAddressUI.RowId == null
          ? ""
          : BillingAddressUI.RowId.toString());
  TextEditingController AddCode = TextEditingController(
      text: BillingAddressUI.AddCode == null
          ? ""
          : BillingAddressUI.AddCode.toString());

  TextEditingController CityName =
      TextEditingController(text: BillingAddressUI.CityName);
  TextEditingController CityCode = TextEditingController(
      text: BillingAddressUI.CityCode == null
          ? ""
          : BillingAddressUI.CityCode.toString());
  TextEditingController CountryName =
      TextEditingController(text: BillingAddressUI.CountryName);
  TextEditingController CountryCode = TextEditingController(
      text: BillingAddressUI.CountryCode == null
          ? ""
          : BillingAddressUI.CountryCode.toString());
  TextEditingController StateName =
      TextEditingController(text: BillingAddressUI.StateName);
  TextEditingController StateCode = TextEditingController(
      text: BillingAddressUI.StateCode == null
          ? ""
          : BillingAddressUI.StateCode.toString());
  TextEditingController Addres =
      TextEditingController(text: BillingAddressUI.Addres);
  TextEditingController ID = TextEditingController(
      text: BillingAddressUI.ID == null ? "" : BillingAddressUI.ID.toString());
  TextEditingController Latitude = TextEditingController(
      text: BillingAddressUI.Latitude == null
          ? ""
          : BillingAddressUI.Latitude.toString());
  TextEditingController Longitude = TextEditingController(
      text: BillingAddressUI.Longitude == null
          ? ""
          : BillingAddressUI.Longitude.toString());

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
              //         Padding(
              //           padding: const EdgeInsets.only(bottom: 6.0,left: 8,right: 8,top: 15),
              //           child: Container(
              //             height: MediaQuery.of(context).size.height/16,
              //             child: Row(
              //               children: [
              //                 Expanded(
              //                   child:  TextFormField(
              //                     controller: ID,
              //                     onChanged: (value){
              //                       ShippingAddressUI.ID=int.tryParse(value);
              //                     },
              //                     readOnly: true,
              //                     onTap: (){
              //                       getErrorSnackBar( "Uneditable");
              //                     },
              //                     decoration: new InputDecoration(
              //                       filled: true,
              //                       labelText: 'Address ID',
              //
              //
              //                       //prefixIconConstraints: BoxConstraints(minWidth: 0,minHeight: 0),
              //                       fillColor: HexColor("#E2E2DD"),
              //                       hoverColor: Colors.red,
              //                       focusedBorder: new OutlineInputBorder(
              //                         borderRadius: new BorderRadius.circular(10.0),
              //                         borderSide:
              //                         new BorderSide(color: barColor,),
              //                       ),
              //                       //focusColor:HexColor("#27ab87"),
              //                       // isDense: true,
              //                       hintText: "Address ID",
              //                       // fillColor: Colors.red,
              //
              //                       border: new OutlineInputBorder(
              //                         borderRadius: new BorderRadius.circular(10.0),
              //                         borderSide: new BorderSide(),
              //                       ),
              //                       //fillColor: Colors.green
              //                     ),
              //                     keyboardType: TextInputType.number,
              //                     style: new TextStyle(
              //                       fontFamily: "Poppins",
              //                     ),
              //                   ),
              //                 ),
              //                 IconButton(
              //                   icon: Icon(Icons.select_all,color: barColor,),
              //                   onPressed: (){
              // if(isSelectedAndCancelled()||isSalesQuotationDocClosed()||isSalesQuotationDocClosed())
              // {
              // getErrorSnackBar( "This Document is already cancelled");
              // }
              // else {
              //     Navigator.push(context, MaterialPageRoute(builder: ((context) =>
              //         AddressLookup(false))));
              // }
              //                   },
              //                 )
              //               ],
              //             ),
              //           ),
              //         ),
              // Padding(
              //   padding: const EdgeInsets.only(bottom: 6.0,left: 8,right: 8,top: 15),
              //   child: Container(
              //     height: MediaQuery.of(context).size.height/16,
              //     child: Row(
              //       children: [
              //         Expanded(
              //           child:  TextFormField(
              //             controller: RowId,
              //             onChanged: (value){
              //               ShippingAddressUI.RowId=int.tryParse(value);
              //             },
              //             readOnly: true,
              //             onTap: (){
              //               getErrorSnackBar( "Uneditable");
              //             },
              //             decoration: new InputDecoration(
              //               filled: true,
              //               labelText: 'Row ID',
              //
              //
              //               //prefixIconConstraints: BoxConstraints(minWidth: 0,minHeight: 0),
              //               fillColor: HexColor("#E2E2DD"),
              //               hoverColor: Colors.red,
              //               focusedBorder: new OutlineInputBorder(
              //                 borderRadius: new BorderRadius.circular(10.0),
              //                 borderSide:
              //                 new BorderSide(color: barColor,),
              //               ),
              //               //focusColor:HexColor("#27ab87"),
              //               // isDense: true,
              //               hintText: "Row ID",
              //               // fillColor: Colors.red,
              //
              //               border: new OutlineInputBorder(
              //                 borderRadius: new BorderRadius.circular(10.0),
              //                 borderSide: new BorderSide(),
              //               ),
              //               //fillColor: Colors.green
              //             ),
              //             keyboardType: TextInputType.number,
              //             style: new TextStyle(
              //               fontFamily: "Poppins",
              //             ),
              //           ),
              //         ),
              //         IconButton(
              //           icon: Icon(Icons.select_all,color: Colors.white,),
              //           onPressed:null,
              //         )
              //       ],
              //     ),
              //   ),
              // ),

              // Padding(
              //   padding: const EdgeInsets.only(bottom: 6.0,left: 8,right: 8,),
              //   child: Container(
              //     height: MediaQuery.of(context).size.height/16,
              //     child: Row(
              //       children: [
              //         Expanded(
              //           child:  TextFormField(
              //             controller: TransId,
              //             onChanged: (value){
              //               ShippingAddressUI.TransId=int.tryParse(value);
              //             },
              //             readOnly: true,
              //             onTap: (){
              //               getErrorSnackBar( "Uneditable");
              //             },
              //             decoration: new InputDecoration(
              //               filled: true,
              //               labelText: 'Transaction ID',
              //
              //
              //               //prefixIconConstraints: BoxConstraints(minWidth: 0,minHeight: 0),
              //               fillColor: HexColor("#E2E2DD"),
              //               hoverColor: Colors.red,
              //               focusedBorder: new OutlineInputBorder(
              //                 borderRadius: new BorderRadius.circular(10.0),
              //                 borderSide:
              //                 new BorderSide(color: barColor,),
              //               ),
              //               //focusColor:HexColor("#27ab87"),
              //               // isDense: true,
              //               hintText: "Transaction ID",
              //               // fillColor: Colors.red,
              //
              //               border: new OutlineInputBorder(
              //                 borderRadius: new BorderRadius.circular(10.0),
              //                 borderSide: new BorderSide(),
              //               ),
              //               //fillColor: Colors.green
              //             ),
              //             keyboardType: TextInputType.number,
              //             style: new TextStyle(
              //               fontFamily: "Poppins",
              //             ),
              //           ),
              //         ),
              //         IconButton(
              //           icon: Icon(Icons.select_all,color: Colors.white,),
              //           onPressed:null,
              //         )
              //       ],
              //     ),
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.only(
                    bottom: 6.0, left: 8, right: 8, top: 25),
                child: Container(
                  height: MediaQuery.of(context).size.height / 20,
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: AddCode,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Select Address';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            BillingAddressUI.AddCode = value;
                          },
                          readOnly: true,
                          onTap: () {
                            getErrorSnackBar("Uneditable");
                          },
                          decoration: new InputDecoration(
                            labelStyle: GoogleFonts.poppins(
                                fontSize: 14, fontWeight: FontWeight.w500),
                            filled: true,
                            labelText: 'Address Code',

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
                            hintText: "Address Code",
                            // fillColor: Colors.red,

                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(10.0),
                              borderSide: new BorderSide(),
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
                          color: barColor,
                        ),
                        onPressed: () {
                        },
                      )
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(bottom: 6.0, left: 8, right: 8),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: Addres,
                        onChanged: (value) {
                          BillingAddressUI.Addres = value;
                        },
                        readOnly: true,
                        onTap: () {

                        },
                        decoration: new InputDecoration(
                          labelStyle: GoogleFonts.poppins(
                              fontSize: 14, fontWeight: FontWeight.w500),
                          filled: true,
                          labelText: 'Address',
                          //prefixIconConstraints: BoxConstraints(minWidth: 0,minHeight: 0),
                          fillColor:HexColor("F3ECE7"),
                          hoverColor: Colors.red,
                          focusedBorder: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(10.0),
                            borderSide: new BorderSide(
                              color: barColor,
                            ),
                          ),
                          //focusColor:HexColor("#27ab87"),
                          // isDense: true,
                          hintText: "Address",
                          // fillColor: Colors.red,

                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(10.0),
                            borderSide: new BorderSide(),
                          ),
                          //fillColor: Colors.green
                        ),
                        maxLines: 5,
                        //keyboardType: TextInputType.number,
                        style: new TextStyle(
                          fontFamily: "Poppins",
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.location_on,
                        color: barColor,
                      ),
                      onPressed: () {

                      },
                    )
                  ],
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
                          controller: CityName,
                          onChanged: (value) {
                            BillingAddressUI.CityName = value;
                          },
                          decoration: new InputDecoration(
                            labelStyle: GoogleFonts.poppins(
                                fontSize: 14, fontWeight: FontWeight.w500),
                            filled: true,
                            labelText: 'City',

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
                            hintText: "City",
                            // fillColor: Colors.red,

                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(10.0),
                              borderSide: new BorderSide(),
                            ),
                            //fillColor: Colors.green
                          ),
                          readOnly: true,
                          onTap: () {
                            getErrorSnackBar("Uneditable");
                          },
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
                          controller: StateName,
                          onChanged: (value) {
                            BillingAddressUI.StateName = value;
                          },
                          decoration: new InputDecoration(
                            labelStyle: GoogleFonts.poppins(
                                fontSize: 14, fontWeight: FontWeight.w500),
                            filled: true,
                            labelText: 'State',

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
                            hintText: "State",
                            // fillColor: Colors.red,

                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(10.0),
                              borderSide: new BorderSide(),
                            ),
                            //fillColor: Colors.green
                          ),
                          readOnly: true,
                          onTap: () {
                            getErrorSnackBar("Uneditable");
                          },
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
              // Padding(
              //   padding: const EdgeInsets.only(bottom: 6.0,left: 8,right: 8,),
              //   child: Container(
              //     height: MediaQuery.of(context).size.height/16,
              //     child: Row(
              //       children: [
              //         Expanded(
              //           child:  TextFormField(
              //             controller: CountryCode,
              //             onChanged: (value){
              //               ShippingAddressUI.CountryCode=value;
              //             },
              //             decoration: new InputDecoration(
              //               filled: true,
              //               labelText: 'Country Code',
              //
              //
              //               //prefixIconConstraints: BoxConstraints(minWidth: 0,minHeight: 0),
              //               fillColor: HexColor("#E2E2DD"),
              //               hoverColor: Colors.red,
              //               focusedBorder: new OutlineInputBorder(
              //                 borderRadius: new BorderRadius.circular(10.0),
              //                 borderSide:
              //                 new BorderSide(color: barColor,),
              //               ),
              //               //focusColor:HexColor("#27ab87"),
              //               // isDense: true,
              //               hintText: "Country Code",
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
              //             keyboardType: TextInputType.number,
              //             style: new TextStyle(
              //               fontFamily: "Poppins",
              //             ),
              //           ),
              //         ),
              //         IconButton(
              //           icon: Icon(Icons.select_all,color: Colors.white,), onPressed: () {  },
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
                          controller: CountryName,
                          onChanged: (value) {
                            BillingAddressUI.CountryName = value;
                          },
                          decoration: new InputDecoration(
                            labelStyle: GoogleFonts.poppins(
                                fontSize: 14, fontWeight: FontWeight.w500),
                            filled: true,
                            labelText: 'Country',

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
                            hintText: "Country",
                            // fillColor: Colors.red,

                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(10.0),
                              borderSide: new BorderSide(),
                            ),

                            //fillColor: Colors.green
                          ),
                          readOnly: true,
                          onTap: () {
                            getErrorSnackBar("Uneditable");
                          },
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
              SizedBox(
                height: 20,
              )
              // Row(
              //   children: [
              //     Align(
              //       alignment: Alignment.centerRight,
              //       child: Container(
              //         width: MediaQuery.of(context).size.width/2,
              //         child: Padding(
              //           padding: const EdgeInsets.only(bottom: 6.0,left: 8,right: 8,),
              //           child: Material(
              //             borderRadius: BorderRadius.circular(10.0),
              //             color: barColor,
              //             elevation: 0.0,
              //             child: MaterialButton(
              //               onPressed: () async {
              //                 clearTextFields();
              //               },
              //               minWidth: MediaQuery.of(context).size.width,
              //               child: Text(
              //                 "Clear",
              //                 textAlign: TextAlign.center,
              //                 style: TextStyle(
              //                     color: Colors.white,
              //                     fontWeight: FontWeight.bold,
              //                     fontSize: 20.0),
              //               ),
              //             ),
              //           ),
              //         ),
              //       ),
              //     ),
              //     Align(
              //       alignment: Alignment.centerRight,
              //       child: Container(
              //         width: MediaQuery.of(context).size.width/2,
              //         child: Padding(
              //           padding: const EdgeInsets.only(bottom: 6.0,left: 8,right: 8,),
              //           child: Material(
              //             borderRadius: BorderRadius.circular(10.0),
              //             color: barColor,
              //             elevation: 0.0,
              //             child: MaterialButton(
              //               onPressed: () async {
              //
              //                 Map<String, dynamic> map = {
              //                   "ID": 1,
              //                   "RowId": RowId.text,
              //                   "AddCode": AddCode.text,
              //                   "Addres": Addres.text,
              //                   "CityCode": CityCode.text,
              //                   "CityName": CityName.text,
              //                   "CountryCode": CountryCode.text,
              //                   "CountryName": CountryName.text,
              //                   "Latitude": double.parse(Latitude.text),
              //                   "Longitude": double.parse(Longitude.text),
              //                   "StateCode": StateCode.text,
              //                   "StateName": StateName.text,
              //
              //                 };
              //                 final Database db = await initializeDB();
              //                 if(isSelectedAndCancelled()||isDocClosed())
              //                 {
              //                   getErrorSnackBar( "This Document is already cancelled");
              //                 }
              //                 else
              //                 if(isSelectedButNotCancelled())
              //                 {
              //                   await db.update(DBName.DB3, map, where: 'MtransId = ?', whereArgs: [GeneralData.MTransID]);
              //                   getSuccessSnackBar("Data Updated");
              //
              //                 }
              //                 else {
              //
              //                   await db.insert(DBName.DB3, map);
              //
              //                   getSuccessSnackBar("Data Added");
              //                   clearTextFields();
              //                 }
              //               },
              //               minWidth: MediaQuery.of(context).size.width,
              //               child: Text(
              //                 "Save",
              //                 textAlign: TextAlign.center,
              //                 style: TextStyle(
              //                     color: Colors.white,
              //                     fontWeight: FontWeight.bold,
              //                     fontSize: 20.0),
              //               ),
              //             ),
              //           ),
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }

  void clearTextFields() {
    BillingAddressUI.TransId = 0;
    TransId.clear();
    BillingAddressUI.RowId = 0;
    RowId.clear();
    BillingAddressUI.AddCode = "";
    AddCode.clear();
    BillingAddressUI.CityName = "";
    CityName.clear();
    BillingAddressUI.CityCode = "";
    CityCode.clear();
    BillingAddressUI.CountryName = "";
    CountryName.clear();
    BillingAddressUI.CountryCode = "";
    CountryCode.clear();
    BillingAddressUI.StateName = "";
    StateName.clear();
    BillingAddressUI.StateCode = "";
    StateCode.clear();
    BillingAddressUI.Addres = "";
    Addres.clear();
    BillingAddressUI.ID = 0;
    ID.clear();
    BillingAddressUI.Latitude = 0.0;
    Latitude.clear();
    BillingAddressUI.Longitude = 0.0;
    Longitude.clear();
  }
}
