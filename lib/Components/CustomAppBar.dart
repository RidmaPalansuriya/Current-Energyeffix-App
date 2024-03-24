import 'package:energyeffix_app/Profile.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final AppBar appBar;
  final String title;

  const CustomAppBar({required this.appBar, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 500, // This should be the height of your app bar
      backgroundColor: Color(0xff0071aa),
      leading: IconButton(
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
        icon: Icon(Icons.menu),
        color: Colors.white,
        tooltip: "Top Navigation Bar Menu",
        iconSize: 35,
      ),
      title: GestureDetector(
        onTap: () {
          // Add functionality to navigate to home page
        },
        child: Image.asset(
          'assets/images/energy_effix_logo_full_h.png',
          width: 150,
          height: 40,
          fit: BoxFit.cover,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.pushNamed(
              context,
              '/profile',
              arguments: Profile(
                userID: 123456,
                emailAddress: 'example@example.com',
                contactNumber: '123-456-7890',
                points: 200,
              ),
            );
          },
          icon: Icon(Icons.account_circle),
          color: Colors.white,
          tooltip: "Top Navigation Bar Profile Icon",
          iconSize: 25,
        ),
        IconButton(
          onPressed: () {
            // Add functionality for the notification button
          },
          icon: Icon(Icons.add_alert),
          color: Colors.white,
          tooltip: "Top Navigation Bar Notification Button",
          iconSize: 25,
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
                onPressed: () {
                  Navigator.of(context).pop(); // This line pops the current route
                },
                icon: Icon(Icons.arrow_back_ios_new_rounded),
                color: Colors.white,
                tooltip: "Back Button",
                iconSize: 14,
              ),
              Container(
                margin: EdgeInsets.only(right: 180.0),
                child: Text(
                  title,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontFamily: 'Days One',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize =>
      new Size.fromHeight(appBar.preferredSize.height);
}
