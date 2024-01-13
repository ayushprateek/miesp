import 'package:bill/theme/custom_colors.dart';
import 'package:bill/theme/custom_text_widgets.dart';
import 'package:flutter/material.dart';

class Stock extends StatefulWidget {
  @override
  _StockState createState() => _StockState();
}

class _StockState extends State<Stock> {
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
                      itemCount: 3,
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
                                                  text: 'Warehouse Code'),
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
                                                text: 'Stock'),
                                            getPoppinsTextSpanDetails(
                                                text: '10'),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
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
                      height: MediaQuery.of(context).size.height / 12,
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
