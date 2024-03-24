import 'package:flutter/material.dart';

class Help extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help'),
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(20.0),
          children: [
            _customListTile(
              title: 'Frequently Asked Questions (FAQs)',
              routeName: '/faq',
              context: context,
              iconData: Icons.help,
            ),
            SizedBox(height: 10),
            _customListTile(
              title: 'Getting Started',
              routeName: '/getting_started',
              context: context,
              iconData: Icons.play_arrow,
            ),
            SizedBox(height: 10),
            _customListTile(
              title: 'Technical Support',
              routeName: '/technical_support',
              context: context,
              iconData: Icons.support,
            ),
            SizedBox(height: 10),
            _customListTile(
              title: 'Video Tutorials',
              routeName: '/video_tutorials',
              context: context,
              iconData: Icons.video_library,
            ),
            SizedBox(height: 10),
            _customListTile(
              title: 'Terms of Services and Privacy Policy',
              routeName: '/terms_privacy',
              context: context,
              iconData: Icons.policy,
            ),
            SizedBox(height: 10),
            _customListTile(
              title: 'Help Center',
              routeName: '/help_center',
              context: context,
              iconData: Icons.help_center,
            ),
            SizedBox(height: 10),
            _customListTile(
              title: 'Accessibility Information',
              routeName: '/accessibility',
              context: context,
              iconData: Icons.accessibility_new,
            ),
          ],
        ),
      ),
    );
  }

  Widget _customListTile({
    required String title,
    required String routeName,
    required BuildContext context,
    required IconData iconData,
  }) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 29, 30, 51),
        borderRadius: BorderRadius.all(Radius.circular(20)),
        border: Border(
          top: BorderSide(
            color: Color(0xFF0EC6EC),
            width: 1,
          ),
          bottom: BorderSide(
            color: Color(0xFF0EC6EC),
            width: 1,
          ),
        ),
      ),
      child: ListTile(
        leading: Icon(
          iconData,
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        title: Text(
          title,
          style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
        onTap: () {
          Navigator.of(context).pushNamed(routeName);
        },
      ),
    );
  }
}
