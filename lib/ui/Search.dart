import 'package:flutter/material.dart';

class SalesQuotationUISearch extends StatefulWidget {
  const SalesQuotationUISearch({Key? key}) : super(key: key);

  @override
  State<SalesQuotationUISearch> createState() => _SalesQuotationUISearchState();
}

class _SalesQuotationUISearchState extends State<SalesQuotationUISearch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SalesQuotationUISearch'),
      ),
      body: Center(
        child: Text('Hello'),
      ),
    );
  }
}
