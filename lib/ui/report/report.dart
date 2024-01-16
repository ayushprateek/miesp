import 'dart:convert';
import 'dart:io';

import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:miesp/common/get_formatted_date.dart';
import 'package:miesp/services/service_manager.dart';
import 'package:miesp/theme/custom_text_widgets.dart';
import 'package:miesp/theme/elements_screen.dart';
import 'package:miesp/theme/get_text_field.dart';
import 'package:miesp/ui/components/date_adn_time_popup.dart';
import 'package:miesp/ui/components/elements_button.dart';
import 'package:miesp/ui/components/elements_snackbar.dart';
import 'package:path_provider/path_provider.dart';

class Report extends StatefulWidget {
  const Report({super.key});

  @override
  State<Report> createState() => _ReportState();
}

class _ReportState extends State<Report> {
  TextEditingController _startDate = TextEditingController();
  TextEditingController _endDate = TextEditingController();
  List<List<dynamic>> rowsAsListOfValues = [];
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return screenWithAppBar(
        title: 'Report',
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              getDisabledTextFieldWithoutLookup(
                  controller: _startDate,
                  labelText: 'Start Date',
                  enableLookup: false,
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _startDate.clear();
                        });
                      },
                      icon: Icon(
                        Icons.close,
                        color: Colors.red,
                      )),
                  onTap: () async {
                    DateTime? dateTime =
                        await getDateAndTimePopup(context: context);
                    if (dateTime != null) {
                      _startDate.text = getFormattedDateAndTime(dateTime);
                    }
                  },
                  onChanged: (String date) {
                    _startDate.text = date;
                  }),
              getDisabledTextFieldWithoutLookup(
                  controller: _endDate,
                  labelText: 'End Date',
                  enableLookup: false,
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _endDate.clear();
                        });
                      },
                      icon: Icon(
                        Icons.close,
                        color: Colors.red,
                      )),
                  onTap: () async {
                    DateTime? dateTime =
                        await getDateAndTimePopup(context: context);
                    if (dateTime != null) {
                      _endDate.text = getFormattedDateAndTime(dateTime);
                    }
                  },
                  onChanged: (String date) {
                    _endDate.text = date;
                  }),
              if (_isLoading)
                CircularProgressIndicator()
              else if (rowsAsListOfValues.isNotEmpty)
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    columns: [
                      for (var header in rowsAsListOfValues[0])
                        DataColumn(
                            label: getHeadingText(text: header.toString())),
                    ],
                    rows: [
                      for (var rowData in rowsAsListOfValues.sublist(1))
                        DataRow(
                          cells: [
                            for (var cellData in rowData)
                              DataCell(
                                  getSubHeadingText(text: cellData.toString())),
                          ],
                        ),
                    ],
                  ),
                ),
            ],
          ),
        ),
        bottomNavigationBar: _buttonContainer());
  }

  Widget _buttonContainer() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 13,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: loadingButton(
          isLoading: false,
          btnText: 'View Report',
          onPress: () {
            openFile();
          },
        ),
      ),
    );
  }

  openFile() async {
    if (_startDate.text.isEmpty) {
      getErrorSnackBar('Start Date can not be empty');
      return;
    } else if (_endDate.text.isEmpty) {
      getErrorSnackBar('End Date can not be empty');
      return;
    }
    final url = Uri.parse('${ServiceManager.baseURL}Items/DownloadReport');
    DateTime startDate = getDateAndTimeFromString(_startDate.text);
    DateTime endDate = getDateAndTimeFromString(_endDate.text);
    if (endDate.isBefore(startDate)) {
      getErrorSnackBar('End Date can not be before start date');
      return;
    }
    setState(() {
      _isLoading = true;
    });
    print(startDate.toIso8601String());
    print(endDate.toIso8601String());

    Map<String, dynamic> requestBody = {
      "startDate": startDate.toIso8601String(),
      "endDate": endDate.toIso8601String()
    };

    final response = await http.post(
      url,
      headers: {
        'accept': '*/*',
        'Content-Type': 'application/json',
      },
      body: jsonEncode(requestBody),
    );

    if (response.statusCode == 200) {
      final appDocumentsDirectory = await getApplicationDocumentsDirectory();
      final filePath = '${appDocumentsDirectory.path}/report.csv';
      File(filePath).writeAsBytesSync(response.bodyBytes);
      String fileContents = await File(filePath).readAsString();
      rowsAsListOfValues = const CsvToListConverter().convert(fileContents);
      setState(() {});
    } else {
      getErrorSnackBar('Failed to download file.${response.body}');
    }
    setState(() {
      _isLoading = false;
    });
  }
}
