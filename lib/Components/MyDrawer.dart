import 'package:energyeffix_app/Analytics.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  final String userName;
  final String userId;
  final int points;

  const MyDrawer({required this.userName, required this.userId, required this.points});

  @override
  Widget build(BuildContext context) {
    // Calculate the width of the drawer to be 60% of the device width
    final double drawerWidth = MediaQuery.of(context).size.width * 0.6;

    return Drawer(
      child: Container(
        width: drawerWidth,
        height: 838,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(0.00, -1.00),
            end: Alignment(0, 1),
            colors: [Color(0xFF111111), Color(0x22434343), Color(0x00434343), Color(0x22434343), Color(0xFF171717)],
          ),
          borderRadius: BorderRadius.only(topRight: Radius.circular(drawerWidth * 0.2)), // Adjust the radius accordingly
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50),
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage('assets/images/1.jpg'), // Replace with user profile picture
            ),
            SizedBox(height: 10),
            Text(
              userName,
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            Text(
              'ID: $userId',
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
            Text(
              'Points: $points',
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  _buildDrawerButton(
                    icon: Icons.analytics,
                    text: 'Analytics',
                    routeName: '/analytics',
                    context: context,
                  ),
                  _buildDrawerButton(icon: Icons.analytics, text: 'Analytics', routeName:'/analytics', context: context),
                  //_buildDrawerButton(icon: Icons.history, text: 'View History'),
                  _buildDrawerButton(icon: Icons.input, text: 'Manual Input', routeName: '/manualentry', context: context),
                  _buildDrawerButton(icon: Icons.device_hub, text: 'Add Device', routeName: '/device', context: context),
                  _buildDrawerButton(icon: Icons.receipt, text: 'My Bill', routeName: '/bill', context: context),
                  _buildDrawerButton(icon: Icons.emoji_events, text: 'Goal', routeName: '/goal', context: context),
                  _buildDrawerButton(icon: Icons.emoji_events, text: 'Create Challenge', routeName: '/customgoal', context: context),
                  _buildDrawerButton(icon: Icons.leaderboard, text: 'Leaderboard', routeName: '/leaderboard', context: context),
                  //_buildDrawerButton(icon: Icons.card_giftcard, text: 'My Rewards'),
                  //_buildDrawerButton(icon: Icons.notifications, text: 'Notifications'),
                  _buildDrawerButton(icon: Icons.settings, text: 'Settings', routeName: '/settings', context: context),
                  _buildDrawerButton(icon: Icons.help, text: 'Help', routeName: '/help', context: context),
                  _buildDrawerButton(icon: Icons.info, text: 'About Us', routeName: '/about', context: context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerButton({required IconData icon, required String text, required String routeName, required BuildContext context}) {
    return Builder(
      builder: (BuildContext context) {
        final double drawerWidth = MediaQuery.of(context).size.width * 0.6; // 60% of device width
        final double buttonWidth = drawerWidth - 50; // Adjusted width for the button

        return GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(routeName);
          },
          child: Container(
            width: buttonWidth,
            height: 60,
            margin: EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment(0.00, -1.00),
                end: Alignment(0, 1),
                colors: [Color(0xFF434343), Color(0x22434343), Color(0x00434343), Color(0x22434343), Color(0xFF434343)],
              ),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              boxShadow: [
                BoxShadow(
                  color: Color(0x3F000000),
                  blurRadius: 4,
                  offset: Offset(0, 4),
                  spreadRadius: 0,
                )
              ],
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 20),
                  child: Icon(
                    icon,
                    color: Colors.white,
                  ),
                ),
                Text(
                  text,
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
