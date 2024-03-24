import 'package:flutter/material.dart';
import 'package:energyeffix_app/src/Register_SignIn.dart';
import 'package:lottie/lottie.dart';

class LoadingPage extends StatefulWidget {
  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    );

    _controller.forward();

    // Navigate to RegisterSignInPage after 8 seconds
    Future.delayed(Duration(milliseconds: 6500), () {
      Navigator.pushReplacementNamed(context, '/register_signin');
    });
  }

  @override
  Widget build(BuildContext context) {
    double maxHeight = MediaQuery.of(context).size.height;
    //double maxWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xff1D1E33),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FadeTransition(
                  opacity: _controller,
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    //width: MediaQuery.of(context).size.width,
                    constraints: BoxConstraints(maxHeight: maxHeight),
                    child: Lottie.asset('assets/images/EnergyEffix Splash  Screen.json'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
