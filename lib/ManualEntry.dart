import 'package:flutter/material.dart';

import 'Components/CustomAppBar.dart';
import 'Components/CustomDrawer.dart';

class ManualEntry extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1D1E33),
      appBar: CustomAppBar(appBar: AppBar(
        toolbarHeight: 120,
      ), title: "Manual Input"),
      drawer: CustomDrawer(),
      body: ManualReadingPage(),
    );
  }
}

class ManualReadingPage extends StatefulWidget {
  @override
  _ManualReadingPageState createState() => _ManualReadingPageState();
}

class _ManualReadingPageState extends State<ManualReadingPage> {
  DateTime _meterReadingDate = DateTime.now();
  TimeOfDay _meterReadingTime = TimeOfDay.now();
  int? _manualReadUnits;
  bool _isSaved = false;

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Add Manual Reading',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0),
            Container(
              padding: EdgeInsets.all(20.0),
              margin: EdgeInsets.symmetric(vertical: 20.0),
              color: Colors.grey[200],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Meter Reading Date',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  GestureDetector(
                    onTap: () {
                      showDatePicker(
                        context: context,
                        initialDate: _meterReadingDate,
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                      ).then((pickedDate) {
                        if (pickedDate != null) {
                          setState(() {
                            _meterReadingDate = pickedDate;
                          });
                        }
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Text(
                        '${_meterReadingDate.year}-${_meterReadingDate.month}-${_meterReadingDate.day}',
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    'Meter Reading Time',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  GestureDetector(
                    onTap: () {
                      showTimePicker(
                        context: context,
                        initialTime: _meterReadingTime,
                      ).then((pickedTime) {
                        if (pickedTime != null) {
                          setState(() {
                            _meterReadingTime = pickedTime;
                          });
                        }
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Text(
                        '${_meterReadingTime.hour}:${_meterReadingTime.minute}',
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  TextField(
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        _manualReadUnits = int.tryParse(value);
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Meter Value',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Save button logic
                    // Assuming saving to database here
                    setState(() {
                      _isSaved = true;
                    });
                  },
                  child: Text('Save'),
                ),
                SizedBox(width: 10.0),
                ElevatedButton(
                  onPressed: _isSaved
                      ? () {
                          // Analyze button logic
                          // Show overlay screen dialog box
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Analysis Dialog'),
                                content: Text('Previous meter readings and history graph'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('Close'),
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      : null,
                  child: Text('Analyze'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
