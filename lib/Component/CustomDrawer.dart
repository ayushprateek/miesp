import 'package:flutter/material.dart';
import 'package:litsales/Component/CustomColor.dart';
import 'package:litsales/xxzz.dart';

class CustomDrawer extends StatefulWidget {
  static bool hasEnabledLocation = false;

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: barColor,
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(
              'Ayush',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            // currentAccountPicture: ClipRRect(
            //     borderRadius: BorderRadius.circular(15.0),
            //     child: Image.asset(logoPath)),
            // currentAccountPicture: CachedNetworkImage(
            //   imageUrl: "https://www.litpl.com/static/img/user.png",
            //   placeholder: (context, url) =>
            //       CircularProgressIndicator(),
            //   errorWidget: (context, url, error) => Icon(Icons.error),
            // ),
            decoration: new BoxDecoration(
              color: barColor,
            ),
            accountEmail: null,
          ),

          InkWell(
            onTap: () async {
              // Navigator.push(context, MaterialPageRoute(builder: (context)=>TestUploadImage()));
            },
            child: ListTile(
              title: Text(
                'Upload Image',
                style: TextStyle(color: headColor),
              ),
              leading: Icon(Icons.logout, color: Colors.white),
              trailing: Icon(Icons.keyboard_arrow_right, color: Colors.white),
            ),
          ),

          InkWell(
            onTap: () async {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CustomScanner()));
            },
            child: ListTile(
              title: Text(
                'CustomScanner',
                style: TextStyle(color: headColor),
              ),
              leading: Icon(Icons.logout, color: Colors.white),
              trailing: Icon(Icons.keyboard_arrow_right, color: Colors.white),
            ),
          ),

          // InkWell(
          //   onTap: () async {
          //
          //     // print("ACT1 before");
          //     // retrieveACT1(context).then((snapshot) async {
          //     //   snapshot.forEach((element) {
          //     //     print(element.ID);
          //     //   });
          //     //   await dataSyncUpdateACT1("20",{
          //     //     "ID":"20",
          //     //     "TransId":"TransId1",
          //     //     "Competitor":"Competitor1",
          //     //     "ItemCode":"ItemCode1",
          //     //     "ItemName":"ItemName1",
          //     //     "Price":"500091",
          //     //     "Quantity":"20091",
          //     //     "UOM":"abcd1"
          //     //   });
          //     //   print("ACT1 After");
          //     //   snapshot.forEach((element) {
          //     //     print(element.ID);
          //     //   });
          //     // });
          //   },
          //   child: ListTile(
          //     title: Text('Retrieve'),
          //     leading: Icon(Icons.sync, color: barColor,),
          //     trailing: Icon(Icons.keyboard_arrow_right),
          //   ),
          // ),
          // InkWell(
          //   onTap: () async {
          //    Position pos=await  getCurrentLocation();
          //    getErrorSnackBar( pos.longitude.toString()+" "+pos.latitude.toString());
          //    print(pos.longitude.toString());
          //    print(pos.latitude.toString());
          //   },
          //   child: ListTile(
          //     title: Text('get location'),
          //     leading: Icon(Icons.sync, color: barColor,),
          //     trailing: Icon(Icons.keyboard_arrow_right),
          //   ),
          // ),
          // InkWell(
          //   onTap: () async {
          //     Navigator.push(context, MaterialPageRoute(builder: ((context)=>GetUniqueDeviceNumber())));
          //   },
          //   child: ListTile(
          //     title: Text('Get IMEI'),
          //     leading: Icon(Icons.sync, color: barColor,),
          //     trailing: Icon(Icons.keyboard_arrow_right),
          //   ),
          // ),
          // InkWell(
          //   onTap: () async {
          //     Navigator.push(context, MaterialPageRoute(builder: ((context)=>GetMacScreen())));
          //   },
          //   child: ListTile(
          //     title: Text('Get MAC'),
          //     leading: Icon(Icons.sync, color: barColor,),
          //     trailing: Icon(Icons.keyboard_arrow_right),
          //   ),
          // ),
          // InkWell(
          //   onTap: () {
          //     Navigator.push(context, MaterialPageRoute(builder: (context)=>CashReceipt()));
          //   },
          //   child: ListTile(
          //     title: Text('Cash Receipt'),
          //     leading: Icon(FlutterIcons.user_friends_faw5s, color: barColor,),
          //     trailing: Icon(Icons.keyboard_arrow_right),
          //   ),
          // ),
          // InkWell(
          //   onTap: () {
          //     Navigator.push(context, MaterialPageRoute(builder: (context)=>BankingForm()));
          //   },
          //   child: ListTile(
          //     title: Text('Banking Form'),
          //     leading: Icon(FlutterIcons.user_friends_faw5s, color: barColor,),
          //     trailing: Icon(Icons.keyboard_arrow_right),
          //   ),
          // ),
        ],
      ),
    );
  }
}
