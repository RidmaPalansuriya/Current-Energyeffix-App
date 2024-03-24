import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class OnboardingData {
  final Color backgroundColor;
  final String welcomeText;
  final String lottiePath;
  final String descriptionText;

  OnboardingData({
    required this.backgroundColor,
    required this.welcomeText,
    required this.lottiePath,
    required this.descriptionText,
  });
}

class GetStartedScreen extends StatefulWidget {
  @override
  _GetStartedScreenState createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  List<OnboardingData> onboardingData = [
    OnboardingData(
      backgroundColor: Colors.black,
      welcomeText: 'Welcome to \nEnergyEffix',
      lottiePath: 'assets/images/GS1.json',
      descriptionText: 'Your Smart \nElectricity Management Solution!',
    ),
    OnboardingData(
      backgroundColor: Colors.black,
      welcomeText: 'Add Your \nSmart Meter',
      lottiePath: 'assets/images/GS2.json',
      descriptionText: 'by Scanning The QR Code.',
    ),
    OnboardingData(
      backgroundColor: Colors.black,
      welcomeText: 'Explore Your \nElectricity Consumption',
      lottiePath: 'assets/images/GS3.json',
      descriptionText: 'by getting \nReal-Time Electricity Usage Insights.',
    ),

    OnboardingData(
      backgroundColor: Colors.black,
      welcomeText: 'Predict Your \n Monthly Bill',
      lottiePath: 'assets/images/GS4.json',
      descriptionText: 'by Analyzing \nElectricity Usage Patterns and History.',
    ),

    OnboardingData(
      backgroundColor: Colors.black,
      welcomeText: 'Customize your \nEnergy Saving Plan',
      lottiePath: 'assets/images/GS5.json',
      descriptionText: 'and get Notifications.',
    ),

  ];

  Widget buildDot(int index) {
    return GestureDetector(
      onTap: () {
        _pageController.animateToPage(
          index,
          duration: Duration(milliseconds: 500),
          curve: Curves.ease,
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 6),
        height: 10,
        width: 10,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: _currentPage == index ? Colors.blue : Colors.grey,
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Get Started'),
        backgroundColor: Colors.black,
        actions: [
          TextButton(
            onPressed: () {
              // Skip the onboarding process and redirect to the analytics page
              Navigator.pushReplacementNamed(context, '/mydrawer');
            },
            style: TextButton.styleFrom(
              side: BorderSide(color: Colors.blue, width: 1),
            ),
            child: Text(
              'Skip',
              style: TextStyle(color: Colors.blue),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              itemCount: onboardingData.length,
              itemBuilder: (context, index) {
                return buildOnboardingScreen(onboardingData[index]);
              },
            ),
          ),
          Container(
            color: Colors.black,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: _currentPage > 0
                      ? () => _pageController.previousPage(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.ease,
                  )
                      : null,
                  style: ElevatedButton.styleFrom(
                    //backgroundColor: onboardingData[_currentPage].backgroundColor,
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                    shadowColor: Color(0x3F000000),
                    elevation: 4,
                  ),
                  child: Text(
                    'Back',
                    style: TextStyle(color: Colors.white),
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    onboardingData.length,
                        (index) => buildDot(index),
                  ),
                ),


                ElevatedButton(
                  onPressed: () {
                    // Navigate to the next page
                    if (_currentPage < onboardingData.length - 1) {
                      _pageController.nextPage(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.ease,
                      );
                    } else {
                      // Handle navigation after reaching the last page
                      Navigator.pushReplacementNamed(context, '/analytics');
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    // backgroundColor: onboardingData[_currentPage].backgroundColor,
                    backgroundColor: Colors.blue,


                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                    shadowColor: Color(0xDDFF0000),
                    elevation: 4,
                  ),
                  child: Text(
                    _currentPage < onboardingData.length - 1 ? 'Next' : 'Finish',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          ),
        ],
      ),
    );

  }

  Widget buildOnboardingScreen(OnboardingData data) {
    return Container(
      color: data.backgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: data.welcomeText,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontFamily: 'Days One',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ],
            ),
          ),
          Lottie.asset(
            data.lottiePath,
            width: 200.0, // Adjust the width as needed
            height: 200.0, // Adjust the height as needed
          ),
          SizedBox(
            width: 263,
            height: 97.28,
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: data.descriptionText,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'Days One',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
