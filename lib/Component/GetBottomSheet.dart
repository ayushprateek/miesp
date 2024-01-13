import 'package:flutter/material.dart';

Widget getBottomSheet(
    String name, String image, double Latitude, double Longitude) {
  String location = "";
  // getAddress(Latitude,Longitude).then((value){
  //   print(value.location);
  //   location=value.location;
  // });
  return Stack(
    children: <Widget>[
      Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.blueAccent,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(
                      name,
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    location != null
                        ? Text('location',
                            style: TextStyle(color: Colors.white, fontSize: 14))
                        : Text(""),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: <Widget>[
                SizedBox(
                  width: 20,
                ),
                Icon(
                  Icons.map,
                  color: Colors.blue,
                ),
                SizedBox(
                  width: 20,
                ),
                Text(Latitude.toString() + " " + Longitude.toString())
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Material(
              elevation: 0.0,
              color: Colors.white,
              child: MaterialButton(
                onPressed: () {
                  print("Calling...");
                },
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.call,
                      color: Colors.blue,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text("Call " + name)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Align(
          alignment: Alignment.topRight,
          child: Container(
            color: Colors.red,
            height: 0,
          ),
        ),
      )
    ],
  );
}
