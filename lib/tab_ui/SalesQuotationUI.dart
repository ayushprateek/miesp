import 'package:bill/tab_ui/GeneralDataUI.dart';
import 'package:bill/tab_ui/ItemDetailsUI.dart';
import 'package:bill/tab_ui/stock.dart';
import 'package:bill/theme/custom_colors.dart';
import 'package:bill/theme/custom_text_widgets.dart';
import 'package:bill/theme/display_dialogbox.dart';
import 'package:bill/ui/components/back_pressed_warning.dart';
import 'package:bill/ui/components/elements_snackbar.dart';
import 'package:bill/ui/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

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
  }

  final key = GlobalKey<ScaffoldState>();

  _onBackButtonPressed() {
    showBackPressedWarning(onBackPressed: null);
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (bool bb) async {
        await _onBackButtonPressed();
      },
      canPop: false,
      child: DefaultTabController(
        length: 3,
        initialIndex: widget.index,
        child: Scaffold(
          key: key,
          appBar: AppBar(
              elevation: 10.0,
              backgroundColor: appPrimary,
              leading: IconButton(
                onPressed: (){
                  showBackPressedWarning(onBackPressed: null);
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
              bottom: PreferredSize(
                child: Column(
                  children: [
                    TabBar(
                      indicator: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10)),
                          color: Colors.white),
                      labelColor: appPrimary,
                      isScrollable: false,
                      unselectedLabelColor: Colors.white,
                      labelStyle:
                          GoogleFonts.poppins(fontWeight: FontWeight.w500),
                      tabs: [
                        Tab(
                          child: Text("General Data"),
                        ),
                        Tab(
                            child: Text(
                          "Price List",
                        )),
                        Tab(
                            child: Text(
                          "Stock",
                        )),
                      ],
                    ),
                  ],
                ),
                preferredSize: Size.fromHeight(50.0),
              ),
              actions: [
                IconButton(
                  tooltip: 'Cancel Document',
                  icon: Icon(
                    Icons.clear,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    showBackPressedWarning(
                        text: 'Are you sure you want to cancel this document?',
                        onBackPressed: () async {
                          Get.offAll(() => SalesQuotationUI(0));
                          getErrorSnackBar('Document Cancelled');
                        });
                  },
                ),
                IconButton(
                  tooltip: 'Search Document',
                  icon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => SalesQuotationUISearch()));
                  },
                ),
                IconButton(
                  tooltip: "Add New Document",
                  icon: Icon(
                    Icons.add,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    showBackPressedWarning(
                        text:
                            'Your data is not saved. Are you sure you want to create new form?',
                        onBackPressed: () async {
                          Get.offAll(() => SalesQuotationUI(0));
                          getSuccessSnackBar('New Document created');
                        });
                  },
                ),
              ],
              title: getHeadingText(
                  text: "Product Form", color: headColor, fontSize: 20)),
          body: TabBarView(
            children: [
              GeneralDataUI(),
              ItemDetailsUI(),
              Stock(),
            ],
          ),
          // backgroundColor: Colors.transparent,

          // endDrawer: Text('Hii'),
          floatingActionButton: FloatingActionButton(
            backgroundColor: appPrimary,
            tooltip: "Save Data",
            child: getHeadingText(text: "Save", color: Colors.white),
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
            onPressed: () async {
              showLoaderDialog(context, text: 'Saving your data');
              await Future.delayed(Duration(seconds: 3));
              Get.offAll(()=>SalesQuotationUI(0));
              getSuccessSnackBar('Data saved');
            },
          ),
        ),
      ),
    );
  }
}
