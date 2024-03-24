import 'package:flutter/material.dart';
import 'SignIn.dart';
// Import the Register.dart file

class RegisterSignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1D1E33),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 40),
                Image.asset(
                  'assets/images/energy_effix_logo.png',
                  width: 100,
                  height: 95,
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  'assets/images/energy_effix_logo_text.png',
                  width: 210,
                  height: 22,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 40),
                const Text(
                  'Already have an account?',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, '/sign_in'),
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
                      padding: const EdgeInsets.all(0.1),
                      //primary: Color(0xea19b6d6).withOpacity(1),
                      //onPrimary: Colors.white,
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
                const Text(
                  'Have not an account yet?',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, '/register'),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
                    padding: const EdgeInsets.all(0.1),
                    //primary: Color(0xea19b6d6).withOpacity(1),
                    //onPrimary: Colors.white,
                    minimumSize: const Size(160, 45),
                    maximumSize: const Size(260,45),
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
                        'Register',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          color: Color(0xff1D1E33),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 55),
                Image.asset(
                  'assets/images/Powered by EnergyMinders.png',
                  width: 160,
                  height: 24,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
