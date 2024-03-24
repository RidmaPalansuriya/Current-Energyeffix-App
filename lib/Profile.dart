import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  final int userID;
  final String emailAddress;
  final String contactNumber;
  final int points;

  Profile({
    required this.userID,
    required this.emailAddress,
    required this.contactNumber,
    required this.points,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1D1E33),
      appBar: AppBar(
        title: Text('My Profile'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Picture placeholder
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/profile_placeholder.png'), // Placeholder image
              ),
              SizedBox(height: 16.0),
              // Display user ID
              Text('User ID: $userID'),
              SizedBox(height: 8.0),
              // Display email address
              Text('Email Address: $emailAddress'),
              SizedBox(height: 8.0),
              // Display phone number
              Text('Phone Number: $contactNumber'),
              SizedBox(height: 8.0),
              // Display points
              Text('Points: $points'),
            ],
          ),
        ),
      ),
    );
  }
}
