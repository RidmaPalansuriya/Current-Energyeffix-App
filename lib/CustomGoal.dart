import 'package:flutter/material.dart';
import 'package:energyeffix_app/Components/CustomAppBar.dart';
import 'package:energyeffix_app/Components/CustomDrawer.dart';

class CustomGoal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Challenge Creation Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChallengeCreationPage(),
    );
  }
}

class ChallengeCreationPage extends StatefulWidget {
  @override
  _ChallengeCreationPageState createState() => _ChallengeCreationPageState();
}

  class _ChallengeCreationPageState extends State<ChallengeCreationPage> {
  late int _targetUnit = 0; // Initialize with a default value
  String _goalPeriod = '';
  String _selectedAlertPercentage = '';
  final List<String> alertPercentageOptions = ['25%', '50%', '75%', '90%'];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBar: AppBar(
        toolbarHeight: 120,
      ), title: "Custom Goal"),
      drawer: CustomDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: Color(0x3F000000),
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Absolute Target (Units)',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10.0),
                TextField(
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      _targetUnit = int.tryParse(value)!;
                    });
                  },
                  decoration: InputDecoration(
                    labelText: 'Enter Target Units',
                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),
                SizedBox(height: 20.0),
                Text(
                  'Time Frame',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10.0),
                Wrap(
                  spacing: 10.0,
                  children: [
                    ChoiceChip(
                      backgroundColor: Colors.blue,
                      selectedColor: Colors.red,
                      label: Text('Daily'),
                      selected: _goalPeriod == 'Daily',
                      onSelected: (selected) {
                        setState(() {
                          _goalPeriod = selected ? 'Daily' : '';
                        });
                      },
                    ),
                    ChoiceChip(
                      backgroundColor: Colors.blue,
                      selectedColor: Colors.red,
                      label: Text('Weekly'),
                      selected: _goalPeriod == 'Weekly',
                      onSelected: (selected) {
                        setState(() {
                          _goalPeriod = selected ? 'Weekly' : '';
                        });
                      },
                    ),
                    ChoiceChip(
                      backgroundColor: Colors.blue,
                      selectedColor: Colors.red,
                      label: Text('Monthly'),
                      selected: _goalPeriod == 'Monthly',
                      onSelected: (selected) {
                        setState(() {
                          _goalPeriod = selected ? 'Monthly' : '';
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Text(
                  'Set Alert Notification',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10.0),
                Wrap(
                  spacing: 10.0,
                  children: alertPercentageOptions.map((option) {
                    return ChoiceChip(
                      label: Text(option),
                      backgroundColor: Colors.blue,
                      selectedColor: Colors.red, // Setting the border color
                      //borderWidth: 1,
                      selected: _selectedAlertPercentage == option,
                      onSelected: (selected) {
                        setState(() {
                          _selectedAlertPercentage = selected ? option : '';
                        });
                      },
                    );
                  }).toList(),
                ),
                SizedBox(height: 20.0),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton(
                    onPressed: () {
                      // Save challenge logic (to be implemented)
                      _showSubscriptionMessage();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                    child: Text('Save Challenge'),
                  ),
                ),
                SizedBox(height: 20.0),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showSubscriptionMessage() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Subscription Success'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('You are successfully subscribed to your custom challenge.'),
              SizedBox(height: 10.0),
              Text('Time Frame: $_goalPeriod'),
              Text('Target Units: $_targetUnit'),
              Text('Alert Percentage: $_selectedAlertPercentage'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
