import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void signIn() {
    // Check if the entered username is "Ridma" and the password is "123"
    if (userNameController.text == "Ridma" && passwordController.text == "123") {
      // Navigate to the home page
      Navigator.pushReplacementNamed(context, '/home');

      // TODO: Add navigation logic to go to the home page.
      // Example: Navigator.pushReplacementNamed(context, '/home');
    } else {
      // Show an error message or handle incorrect credentials accordingly
      print('Incorrect username or password. Please try again later.');

      // For now, let's show a pop-up message
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Incorrect Credentials'),
            content: Text('The entered username or password is incorrect. Please try again later.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the alert dialog
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {

    double deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xff1D1E33),
      appBar: AppBar(
        backgroundColor: Color(0xFF1D1E33), // Set the background color here
        title: null, // Remove default title
        iconTheme: IconThemeData(color: Colors.white), // Set back icon color to white
      ),
      body: SafeArea(
      child: SingleChildScrollView(
      child: Center(
      child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Row with Image and Text
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // EnergyEffix Logo Circle Only
                  Container(
                    margin: EdgeInsets.only(right: 20), // Add right margin if needed
                    child: Image.asset(
                      'assets/images/energy_effix_logo.png',
                      width: 60,
                      height: 59,
                      fit: BoxFit.cover,
                    ),
                  ),
                  // Text "Welcome back to EnergyEffix"
                  Column(
                    children: [
                      Text(
                        'Welcome back to',
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      // EnergyEffix Logo Text Only
                      Image.asset(
                        'assets/images/energy_effix_logo_text.png',
                        width: 130,
                        height: 15,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),



            // User Name input field
            Container(
              width: deviceWidth * 0.9, // 90% of device width,
              height: 90,
              alignment: Alignment.center, // Center align vertically
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 30,
                    child: Container(
                      width: deviceWidth * 0.8, // 80% of device width
                      height: 39,
                      decoration: ShapeDecoration(
                        gradient: LinearGradient(
                          begin: Alignment(0.00, -1.00),
                          end: Alignment(0, 1),
                          colors: [Colors.white, Color(0xEA19B6D6)],
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32),
                        ),
                        shadows: [
                          BoxShadow(
                            color: Color(0x3F000000),
                            blurRadius: 4,
                            offset: Offset(0, 4),
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 17,
                    top: 15,
                    child: SizedBox(
                      width: deviceWidth * 0.8, // 80% of device width
                      height: 69,

                      child: TextField(
                        controller: userNameController,
                        style: TextStyle(
                          color: Color(0xFF1D1E33),

                          // Typing text
                          fontSize: 20,
                          fontFamily: 'Days One',
                          fontWeight: FontWeight.w400,
                        ),
                        decoration: InputDecoration(
                          // Placeholder Text
                          hintText: 'User Name',
                          hintStyle: TextStyle(
                            color: Color(0xFF1D1E33),
                            fontSize: 20,
                            fontFamily: 'Days One',
                            fontWeight: FontWeight.w400,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 17,
                    top: 0,
                    child: SizedBox(
                      width: deviceWidth * 0.8, // 80% of device width
                      height: 19,
                      child: Text(
                        'Username/Email Address',
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Password input field
            Container(
              width: deviceWidth * 0.9, // 90% of device width
              height: 84,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 30,
                    child: Container(
                      width: deviceWidth * 0.8, // 80% of device width
                      height: 39,
                      decoration: ShapeDecoration(
                        gradient: LinearGradient(
                          begin: Alignment(0.00, -1.00),
                          end: Alignment(0, 1),
                          colors: [Colors.white, Color(0xEA19B6D6)],
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32),
                        ),
                        shadows: [
                          BoxShadow(
                            color: Color(0x3F000000),
                            blurRadius: 4,
                            offset: Offset(0, 4),
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 17,
                    top: 15,
                    child: SizedBox(
                      width: deviceWidth * 0.8, // 80% of device width
                      height: 69,
                      child: TextField(
                        controller: passwordController,
                        obscureText: true,
                        style: TextStyle(
                          color: Color(0xFF1D1E33),
                          fontSize: 14,
                          fontFamily: 'Days One',
                          fontWeight: FontWeight.w400,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Password',
                          hintStyle: TextStyle(
                            color: Color(0xFF1D1E33),
                            fontSize: 14,
                            fontFamily: 'Days One',
                            fontWeight: FontWeight.w400,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 17,
                    top: 0,
                    child: SizedBox(
                      width: deviceWidth * 0.8, // 80% of device width
                      height: 19,
                      child: Text(
                        'Password',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'Days One',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),


            ),

            const SizedBox(height: 5),

            // Row for Registration Text and Button
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Have not an account yet?',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                // Transparent Background Button "Register"
                TextButton(
                  onPressed: () {
                    // Navigate to the registration page when the button is pressed
                    Navigator.pushReplacementNamed(context, '/register');
                    // Example: Navigator.pushReplacementNamed(context, '/registration');
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    padding: EdgeInsets.zero,
                  ),
                  child: Text(
                    'Register',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),


            // Sign In button
            // ElevatedButton(
            //   onPressed: signIn,
            //   style: ElevatedButton.styleFrom(
            //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
            //     padding: const EdgeInsets.all(0.1),
            //     primary: Color(0xEA19B6D6).withOpacity(1),
            //     onPrimary: Colors.white,
            //     minimumSize: const Size(292, 45),
            //   ),
            //   child: Ink(
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(24),
            //       gradient: LinearGradient(
            //         begin: Alignment.topLeft,
            //         end: Alignment.bottomRight,
            //         colors: [
            //           Color(0xEA19B6D6).withOpacity(1),
            //           Colors.white,
            //         ],
            //       ),
            //     ),
            //     child: Center(
            //       child: Text(
            //         'Sign In',
            //         style: TextStyle(
            //           fontSize: 24,
            //           fontWeight: FontWeight.w900,
            //           color: Color(0xff1D1E33),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),

            //const SizedBox(height: 20),


            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/analytics'), // Redirect to Sign In page
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
                  padding: const EdgeInsets.all(0.1),
                  //primary: Color(0xea19b6d6).withOpacity(1),
                  //onPrimary: Colors.white,
                  backgroundColor: Color(0xea19b6d6).withOpacity(1), // Use backgroundColor
                  foregroundColor: Colors.white, // Use foregroundColor
                  minimumSize: const Size(160, 45),
                  maximumSize: const Size(260,45)
              ),
              child: Ink(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xea19b6d6).withOpacity(1),
                      Colors.white,
                    ],
                  ),
                ),
                child: Center(
                  child: Text(
                    'Sign In',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      color: Color(0xff1D1E33),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),

            // Existing UI code...

          ],
        ),
      ),
      ),
      ),
    );
  }
}
