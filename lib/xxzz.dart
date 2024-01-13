import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CustomScanner(),
    );
  }
}

class CustomScanner extends StatefulWidget {
  @override
  _CustomScannerState createState() => _CustomScannerState();
}

class _CustomScannerState extends State<CustomScanner> {
  String scannedData = 'Scan a QR Code or Barcode';

  Future<void> scanQRCode() async {
    String scanResult='';
    try {
      scanResult = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666', // Color for the background of the scan page
        'Cancel',   // Text for the button that cancels the scan
        true,       // Whether to show the flash icon
        ScanMode.QR, // The type of code to scan (QR Code or Barcode)
      );
    } catch (e) {
      print('Error during scan: $e');
    }

    if (!mounted) return;

    setState(() {
      scannedData = scanResult ?? 'Scan failed!';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Code Scanner'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              scannedData,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: scanQRCode,
              child: Text('Scan QR Code or Barcode'),
            ),
          ],
        ),
      ),
    );
  }
}
