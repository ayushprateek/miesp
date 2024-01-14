import 'package:bill/theme/custom_colors.dart';
import 'package:bill/theme/custom_text_widgets.dart';
import 'package:flutter/material.dart';

class ItemDetailsUI extends StatefulWidget {
  @override
  _ItemDetailsUIState createState() => _ItemDetailsUIState();
}

class _ItemDetailsUIState extends State<ItemDetailsUI> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8, bottom: 8),
            child: Container(
              decoration: BoxDecoration(
                  // color: const Color(0XFFC46253),
                  border: Border.all(),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16))),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    ListView.builder(
                      itemCount: 5,
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onDoubleTap: () {},
                          child: Container(
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
                                                            text: 'Price List'),
                                                        getPoppinsTextSpanDetails(
                                                            text: 'LWP'),
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
                                                          text: 'UOM'),
                                                      getPoppinsTextSpanDetails(
                                                          text: 'DRUM'),
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
                                                child: FittedBox(
                                                  fit: BoxFit.contain,
                                                  child: Text.rich(
                                                    TextSpan(
                                                      children: [
                                                        getPoppinsTextSpanHeading(
                                                            text: 'Currency'),
                                                        getPoppinsTextSpanDetails(
                                                            text: 'QR'),
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
                                                child: FittedBox(
                                                  fit: BoxFit.contain,
                                                  child: Text.rich(
                                                    TextSpan(
                                                      children: [
                                                        getPoppinsTextSpanHeading(
                                                            text: 'Price'),
                                                        getPoppinsTextSpanDetails(
                                                            text: '15'),
                                                      ],
                                                    ),
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
                                  // Divider(
                                  //   thickness: 1,
                                  //   color: Colors.black,
                                  // ),
                                  // Padding(
                                  //   padding: const EdgeInsets.only(
                                  //       left: 8.0, right: 16.0),
                                  //   child: Align(
                                  //     alignment: Alignment.centerRight,
                                  //     child: FittedBox(
                                  //       fit: BoxFit.contain,
                                  //       child: Text.rich(
                                  //         TextSpan(
                                  //           children: [
                                  //             getPoppinsTextSpanHeading(
                                  //                 text: 'Total ',
                                  //                 fontSize: 15),
                                  //             getPoppinsTextSpanDetails(
                                  //                 text: '168.0', fontSize: 14),
                                  //           ],
                                  //         ),
                                  //       ),
                                  //     ),
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    Divider(
                      thickness: 2,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ListView.builder(
                      itemCount: 1,
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        //getPoppinsTextSpanHeading(text: 'Item Code'),
                        //getPoppinsTextSpanDetails(text: 'A0001'),

                        return InkWell(
                          onDoubleTap: () {},
                          child: Container(
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
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8.0, right: 20.0, top: 4.0),
                                    child: Row(
                                      children: [
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: FittedBox(
                                            fit: BoxFit.contain,
                                            child: getHeadingText(
                                                text: 'Num Of Items',
                                                fontSize: 14),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(),
                                        ),
                                        Align(
                                          alignment: Alignment.topRight,
                                          child: FittedBox(
                                            fit: BoxFit.contain,
                                            child: getSubHeadingText(
                                                text: '10', fontSize: 14),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8.0, right: 20.0, top: 0.0),
                                    child: Row(
                                      children: [
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: FittedBox(
                                            fit: BoxFit.contain,
                                            child: getHeadingText(
                                                text: 'Total Sum :  ',
                                                fontSize: 14),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(),
                                        ),
                                        Align(
                                          alignment: Alignment.topRight,
                                          child: FittedBox(
                                            fit: BoxFit.contain,
                                            child: getSubHeadingText(
                                                text: '+500.0', fontSize: 14),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8.0, right: 20.0, top: 0.0),
                                    child: Row(
                                      children: [
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: FittedBox(
                                            fit: BoxFit.contain,
                                            child: getHeadingText(
                                                text: 'Total Discount : ',
                                                fontSize: 14),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(),
                                        ),
                                        Align(
                                          alignment: Alignment.topRight,
                                          child: FittedBox(
                                            fit: BoxFit.contain,
                                            child: getSubHeadingText(
                                                text: '-0.0', fontSize: 14),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8.0, right: 20.0, top: 0.0),
                                    child: Row(
                                      children: [
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: FittedBox(
                                            fit: BoxFit.contain,
                                            child: getHeadingText(
                                                text: 'Total Tax : ',
                                                fontSize: 14),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(),
                                        ),
                                        Align(
                                          alignment: Alignment.topRight,
                                          child: FittedBox(
                                            fit: BoxFit.contain,
                                            child: getSubHeadingText(
                                                text: '+0.0', fontSize: 14),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8.0, right: 20.0, top: 0.0),
                                    child: Row(
                                      children: [
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: FittedBox(
                                            fit: BoxFit.contain,
                                            child: getHeadingText(
                                                text: 'Total Price : ',
                                                fontSize: 14),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(),
                                        ),
                                        Align(
                                          alignment: Alignment.topRight,
                                          child: FittedBox(
                                            fit: BoxFit.contain,
                                            child: getSubHeadingText(
                                                text: '500.0', fontSize: 14),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 10,
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
