import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:litsales/Component/CustomColor.dart';
import 'package:litsales/Component/CustomFont.dart';

import 'package:litsales/main.dart';
import 'package:litsales/ui/BillingAddressUI.dart';
import 'package:litsales/ui/GeneralDataUI.dart';
import 'package:litsales/ui/ItemDetailsUI.dart';
import 'package:litsales/ui/Search.dart';
import 'package:litsales/ui/ShippingAddressUI.dart';

class SalesQuotationUI extends StatefulWidget {

  int index = 0;

  SalesQuotationUI(int index) {
    this.index = index;
  }

  @override
  _SalesQuotationUIState createState() => _SalesQuotationUIState();
}

class _SalesQuotationUIState extends State<SalesQuotationUI> {


  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {});
  }

  final key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      initialIndex: widget.index,
      child: Scaffold(
        key: key,
        appBar: AppBar(
            elevation: 10.0,
            backgroundColor: barColor,
            bottom: PreferredSize(
              child: Column(
                children: [
                  TabBar(
                    indicator: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10)),
                        color: Colors.white),
                    labelColor: barColor,
                    isScrollable: true,
                    unselectedLabelColor: Colors.white,
                    labelStyle:
                        GoogleFonts.poppins(fontWeight: FontWeight.w500),
                    tabs: [
                      Tab(
                        child: Text("General Data"),
                      ),
                      Tab(
                          child: Text(
                        "Item Details",
                      )),
                      Tab(
                          child: Text(
                        "Shipping Address",
                      )),
                      Tab(
                          child: Text(
                        "Billing Address",
                      )),
                    ],
                  ),
                ],
              ),
              preferredSize: Size.fromHeight(50.0),
            ),
            actions: [
              // IconButton(
              //   icon: Icon(
              //     Icons.screenshot,
              //     color: Colors.white,
              //   ),
              //   onPressed: () async {
              //     // SalesQuotationUI.screenshots.clear();
              //     String? path = await captureScreenshot(
              //         context: _globalKey.currentContext);
              //     if (path != '' && path!=null) {
              //       Future.delayed(Duration(seconds: 1), () {
              //         SalesQuotationUI.screenshots.add(path);
              //         setState(() {});
              //       });
              //     }
              //   },
              // ),
              IconButton(
                icon: Icon(
                  Icons.clear,
                  color: Colors.white,
                ),
                onPressed: () {
                                 },
              ),
              IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SalesQuotationUISearch()));
                },
              ),
              IconButton(
                tooltip: "Add New Document",
                icon: Icon(
                  Icons.add,
                  color: Colors.black,
                ),
                onPressed: () {},
              ),
            ],
            title: getHeadingText(
                text: "Sales Quotation", color: headColor, fontSize: 20)),
        body: TabBarView(
          children: [
            GeneralDataUI(),
            ItemDetailsUI(),
            ShippingAddressUI(),
            BillingAddressUI(),
          ],
        ),
        // backgroundColor: Colors.transparent,

        // endDrawer: Text('Hii'),
        floatingActionButton: FloatingActionButton(
          backgroundColor: barColor,
          tooltip: "Save Data",
          child: getPoppinsText(text: "Save", color: Colors.white),
          // onPressed: () {
          //   // entry?.remove();
          //   // entry=null;
          //   entry = OverlayEntry(
          //       builder: (context) => Positioned(
          //         left: offset.dx,
          //         top:offset.dy,
          //         child: GestureDetector(
          //           onPanUpdate: (details){
          //             setState(() {
          //               offset+=details.delta;
          //               entry?.markNeedsBuild();
          //             });
          //
          //           },
          //           child: ElevatedButton(
          //               onPressed: () {
          //                 getErrorSnackBar('Pressed');
          //               }, child: Text('Screen Shots')),
          //         ),
          //       ));
          //   final overlay = Overlay.of(context);
          //   overlay.insert(entry!);
          // },
          onPressed: () {

          },
        ),
      ),
    );
  }
}
