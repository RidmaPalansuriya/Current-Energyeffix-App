import 'package:flutter/material.dart';

import 'Components/CustomAppBar.dart';
import 'Components/CustomDrawer.dart';
import 'Components/myNavBar.dart';


class Bill extends StatelessWidget {
  final String month;
  final int unitsUsed;
  final double usageAmount;
  final double totalAmount;

  Bill({
    required this.month,
    required this.unitsUsed,
    required this.usageAmount,
    required this.totalAmount,
  });

    @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: TextTheme(
          bodyText1: TextStyle(color: Colors.white), // Setting default text color to white
        ),
      ),
      home: Scaffold(
        backgroundColor: Color(0xFF1D1E33),
        appBar: CustomAppBar(
          appBar: AppBar(
            toolbarHeight: 120,
          ),
          title: "My Bill",
        ),
        drawer: CustomDrawer(),
        body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Month of $month Bill',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Table(
                  border: TableBorder.all(width: 2),
                  columnWidths: {
                    0: FlexColumnWidth(),
                    1: FlexColumnWidth(),
                    2: FlexColumnWidth(),
                    3: FlexColumnWidth(),
                    4: FlexColumnWidth(),
                    5: FlexColumnWidth(),
                  },
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  children: [
                    TableRow(children: [
                      TableCell(child: Center(child: Text('1-30', style: TextStyle(fontSize: 10)))),
                      TableCell(child: Center(child: Text('31-60', style: TextStyle(fontSize: 10)))),
                      TableCell(child: Center(child: Text('61-90', style: TextStyle(fontSize: 10)))),
                      TableCell(child: Center(child: Text('91-120', style: TextStyle(fontSize: 10)))),
                      TableCell(child: Center(child: Text('121-180', style: TextStyle(fontSize: 10)))),
                      TableCell(child: Center(child: Text('180<', style: TextStyle(fontSize: 10)))),
                    ]),
                    TableRow(children: [
                      TableCell(child: Center(child: Text('LKR 8', style: TextStyle(fontSize: 11)))),
                      TableCell(child: Center(child: Text('LKR 20', style: TextStyle(fontSize: 11)))),
                      TableCell(child: Center(child: Text('LKR 30', style: TextStyle(fontSize: 11)))),
                      TableCell(child: Center(child: Text('LKR 50' , style: TextStyle(fontSize: 11)))),
                      TableCell(child: Center(child: Text('LKR 50', style: TextStyle(fontSize: 11)))),
                      TableCell(child: Center(child: Text('LKR 75' , style: TextStyle(fontSize: 11)))),
                    ]),
                  ],
                ),
                SizedBox(height: 50),
                Table(
                  border: TableBorder.all(width: 2),
                  columnWidths: {0: FlexColumnWidth(), 1: FlexColumnWidth()},
                  children: [
                    TableRow(children: [
                      TableCell(child: Text('Total Units Used', textAlign: TextAlign.left)),
                      TableCell(
                          child: Text('$unitsUsed', textAlign: TextAlign.right)),
                    ]),
                    TableRow(children: [
                      TableCell(child: Text('Usage Amount', textAlign: TextAlign.left)),
                      TableCell(
                          child: Text('LKR $usageAmount', textAlign: TextAlign.right)),
                    ]),
                    TableRow(children: [
                      TableCell(child: Text('Fixed Charges', textAlign: TextAlign.left)),
                      TableCell(
                          child: Text('LKR 500', textAlign: TextAlign.right)),
                    ]),
                    TableRow(children: [
                      TableCell(child: Text('Tax-VAT', textAlign: TextAlign.left)),
                      TableCell(child: Text('18%', textAlign: TextAlign.right)),
                    ]),
                    TableRow(children: [
                      TableCell(child: Text('Total Amount', textAlign: TextAlign.left)),
                      TableCell(
                          child: Text('LKR $totalAmount', textAlign: TextAlign.right)),
                    ]),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      )
    );
  }
}