import 'package:flutter/material.dart';

void main() {
  runApp(SettingsPage());
}

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _isDarkTheme = true;
  bool _isLocationSharingEnabled = false;
  bool _isNotificationEnabled = true;
  bool _isShareAccessEnabled = false;
  String _selectedCurrency = 'LKR';
  String _selectedFontSize = 'Medium';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _isDarkTheme ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        backgroundColor: Color(0xFF1D1E33),
        appBar: AppBar(
          title: Text('Settings'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Container(
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSectionTitle('Language'),
                  _buildDivider(),
                  _buildSettingItem('English'),

                  _buildSectionTitle('Theme'),
                  _buildDivider(),
                  _buildToggleSettingItem('Dark Theme', _isDarkTheme),

                  _buildSectionTitle('Smart Meter'),
                  _buildDivider(),
                  _buildSettingItem('Connected'),

                  _buildSectionTitle('Share Location'),
                  _buildDivider(),
                  _buildToggleSettingItem('Share Location', _isLocationSharingEnabled),

                  _buildSectionTitle('Currency'),
                  _buildDivider(),
                  _buildComboBox('Currency', ['LKR', 'USD'], _selectedCurrency),

                  _buildSectionTitle('Font Size'),
                  _buildDivider(),
                  _buildComboBox('Font Size', ['Small', 'Medium', 'Large'], _selectedFontSize),

                  _buildSectionTitle('Notification'),
                  _buildDivider(),
                  _buildToggleSettingItem('Notification', _isNotificationEnabled),

                  _buildSectionTitle('Share Access'),
                  _buildDivider(),
                  _buildToggleSettingItem('Share Access', _isShareAccessEnabled),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(
      color: Colors.grey,
      thickness: 1.0,
    );
  }

  Widget _buildSettingItem(String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Text(
        value,
        style: TextStyle(
          fontSize: 16.0,
        ),
      ),
    );
  }

  Widget _buildToggleSettingItem(String title, bool value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16.0,
          ),
        ),
        Switch(
          value: value,
          onChanged: (newValue) {
            setState(() {
              if (title == 'Dark Theme') {
                _isDarkTheme = newValue;
              } else if (title == 'Share Location') {
                _isLocationSharingEnabled = newValue;
              } else if (title == 'Notification') {
                _isNotificationEnabled = newValue;
              } else if (title == 'Share Access') {
                _isShareAccessEnabled = newValue;
              }
            });
          },
        ),
      ],
    );
  }

  Widget _buildComboBox(String title, List<String> options, String selectedValue) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16.0,
          ),
        ),
        DropdownButton<String>(
          value: selectedValue,
          onChanged: (newValue) {
            setState(() {
              if (title == 'Currency') {
                _selectedCurrency = newValue!;
              } else if (title == 'Font Size') {
                _selectedFontSize = newValue!;
              }
            });
          },
          items: options.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ],
    );
  }
}
