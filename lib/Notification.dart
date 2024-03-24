import 'package:flutter/material.dart';

class Notification extends StatelessWidget {
  final List<String> notifications;

  Notification({required this.notifications});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1D1E33),
      appBar: AppBar(
        title: Text('Notifications'),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: ListView.builder(
            itemCount: notifications.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  notifications[index],
                  style: TextStyle(fontSize: 18),
                ),
                // You can add additional functionality here
              );
            },
          ),
        ),
      ),
    );
  }
}
