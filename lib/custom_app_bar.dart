// custom_app_bar.dart
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String pageTitle;
  final VoidCallback? onBackPress;

  const CustomAppBar({
    Key? key,
    required this.pageTitle,
    this.onBackPress, required String title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 100,
      backgroundColor: Color(0xff0071aa),
      leading: IconButton(
        onPressed: () {
          if (onBackPress != null) {
            onBackPress!();
          } else {
            //ScaffoldMessenger.of(context).openDrawer(); // Updated line
          }
        },
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
                onPressed: () {
                  if (onBackPress != null) {
                    onBackPress!();
                  }
                },
                icon: Icon(Icons.arrow_back_ios_new_rounded),
                color: Colors.white,
                tooltip: "Back Button",
                iconSize: 35,
              ),
              Text(
                pageTitle,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
