import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text
        (
          'About EnergyEffix',
          style: TextStyle(color: Colors.white), // Text color
        ),
        backgroundColor: Colors.black, // Background color
        iconTheme: IconThemeData(color: Colors.white), // Icon color
      ),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          color: Colors.black,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Welcome to EnergyEffix,\nwhere innovative solution meets your energy management needs.\n\nAt EnergyEffix,  \nwe believe in transforming the way individuals and businesses approach energy consumption.\n\nOur team, the EnergyMinders, \nis passionate about creating a sustainable future by providing a cutting-edge energy management tool tailored to face the challenges of electricity tariffs.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w400,
                      height: 1.5,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Our Mission\n',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextSpan(
                        text: '"Empower users to take control of their energy consumption, navigate complex electricity tariffs,and make informed decisions for a more sustainable and cost-effective energy future."',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Container(
                  width: 358,
                  height: 51,
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _buildSocialButton(
                        icon: Icons.phone,
                        onTap: () {
                          launch("tel:+94769173010");
                        },
                      ),
                      _buildSocialButton(
                        icon: Icons.email,
                        onTap: () {
                          launch("mailto:ridma.dev@gmail.com");
                        },
                      ),
                      _buildSocialButton(
                        icon: Icons.facebook,
                        onTap: () {
                          // Open Facebook URL
                        },
                      ),
                      _buildSocialButton(
                        icon: Icons.insert_page_break_rounded,
                        onTap: () {
                          // Open Instagram URL
                        },
                      ),
                      _buildSocialButton(
                        icon: Icons.link,
                        onTap: () {
                          // Open LinkedIn URL
                        },
                      ),
                      _buildSocialButton(
                        icon: Icons.gps_off_outlined,
                        onTap: () {
                          // Open YouTube URL
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSocialButton({required IconData icon, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: Icon(
          icon,
          color: Colors.black,
          size: 28,
        ),
      ),
    );
  }
}
