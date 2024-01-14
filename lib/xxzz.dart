import 'package:bill/models/item_details_model.dart';
import 'package:bill/services/service_manager.dart';
import 'package:bill/theme/custom_text_widgets.dart';
import 'package:bill/theme/elements_screen.dart';
import 'package:bill/ui/components/elements_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';
class CustomScanner extends StatefulWidget {
  @override
  _CustomScannerState createState() => _CustomScannerState();
}

class _CustomScannerState extends State<CustomScanner> {
  String scannedData = 'Scan a QR Code or Barcode';

  // Future<void> scanQRCode() async {
  //   String scanResult='';
  //   try {
  //     scanResult = await FlutterBarcodeScanner.scanBarcode(
  //       '#ff6666', // Color for the background of the scan page
  //       'Cancel',   // Text for the button that cancels the scan
  //       true,       // Whether to show the flash icon
  //       ScanMode.QR, // The type of code to scan (QR Code or Barcode)
  //     );
  //   } catch (e) {
  //     print('Error during scan: $e');
  //   }
  //
  //   if (!mounted) return;
  //
  //   setState(() {
  //     scannedData = scanResult ?? 'Scan failed!';
  //   });
  // }
  onSuccess(ItemDetailModel itemDetailModel){
    print(itemDetailModel.toJson());

  }
  onError(){}
  Future<void> scanQRCode() async {
    if(await ServiceManager.isInternetAvailable())
      {
       ServiceManager.getItemDetails(barCode: '43001', onSuccess: onSuccess, onError: onError);
      }
  }

  @override
  Widget build(BuildContext context) {

    return screenWithAppBar(
      title: 'Scan Bar/QR Code',
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if(scannedData!='Scan a QR Code or Barcode')
            getHeadingText(text: 'Scanned text--> $scannedData'),
            const SizedBox(height: 20,),
            SizedBox(
              width: Get.width/4,
                child: loadingButton(isLoading: false, btnText: 'Scan', onPress: scanQRCode)),
          ],
        ),
      )
    );
  }
}
