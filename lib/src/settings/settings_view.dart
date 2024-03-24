import 'package:flutter/material.dart';
import 'settings_controller.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key, required this.controller}) : super(key: key);

  static const routeName = '/settings';

  final SettingsController controller;

  @override
  Widget build(BuildContext context) {
    // Check if the device is in landscape mode
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Color(0xff0071aa),
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(Icons.menu),
          color: Colors.white,
          tooltip: "Top Navigation Bar Menu",
          iconSize: 45,
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                // Navigator.pushNamed(context, EeHome.routeName);
              },
              child: Image.asset(
                'assets/images/energy_effix_logo_full_h.png',
                width: 150,
                height: 40,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: null,
            icon: Icon(Icons.add_alert),
            color: Colors.white,
            tooltip: "Top Navigation Bar Notification Button",
            iconSize: 33,
          ),
          IconButton(
            onPressed: null,
            icon: Icon(Icons.account_circle),
            color: Colors.white,
            tooltip: "Top Navigation Bar Profile Icon",
            iconSize: 35,
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(40),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: null,
                  icon: Icon(Icons.arrow_back_ios_new_rounded),
                  color: Colors.white,
                  tooltip: "Back Button",
                  iconSize: 35,
                ),
                DropdownButton<ThemeMode>(
                  value: controller.themeMode,
                  onChanged: controller.updateThemeMode,
                  items: const [
                    DropdownMenuItem(
                      value: ThemeMode.system,
                      child: Text('System Theme'),
                    ),
                    DropdownMenuItem(
                      value: ThemeMode.light,
                      child: Text('Light Theme'),
                    ),
                    DropdownMenuItem(
                      value: ThemeMode.dark,
                      child: Text('Dark Theme'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: isLandscape
          ? SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: RotatedBox(
          quarterTurns: 3,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              // Replace this container with the actual body content.
            ),
          ),
        ),
      )
          : SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Container(
            // Replace this container with the actual body content.
          ),
        ),
      ),
    );
  }
}
