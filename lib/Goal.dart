import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:energyeffix_app/Components/CustomAppBar.dart';
import 'package:energyeffix_app/Components/CustomDrawer.dart';
import 'CustomGoal.dart';
import 'LeaderBoard.dart';
import 'goal.dart';

class Goal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1D1E33),
      appBar: CustomAppBar(appBar: AppBar(
        toolbarHeight: 120,
      ), title: "Goal     "),
      drawer: CustomDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //CarouselSlider
              Container(
                height: 200,
                color: Colors.transparent,
                child: CarouselSlider(
                  items: [
                    Image.asset('assets/images/1.jpg'),
                    Image.asset('assets/images/2.jpg'),
                    Image.asset('assets/images/3.jpg'),
                    Image.asset('assets/images/4.jpg'),
                    Image.asset('assets/images/5.jpg'),
                  ],
                  options: CarouselOptions(
                    autoPlay: true,
                    aspectRatio: 2.0,
                    enlargeCenterPage: true,
                  ),
                ),
              ),

              // 4 Buttons
              Container(
                //color: const Color.fromARGB(28, 33, 149, 243),
                child: Column(
                  children: [
                    buildButtonRow(context, [
                      buildButton(
                        context,
                        'Our Champs',
                        LeaderboardPage(),
                      ),
                      buildButton(
                        context,
                        'My Rewards',
                        MyRewardsPage(),
                      ),
                    ]),
                    buildButtonRow(context, [
                      buildButton(
                        context,
                        'Energy Saving Tips',
                        EnergySavingTipsPage(),
                      ),
                      buildButton(
                        context,
                        'View My Badges',
                        ViewMyBadgesPage(),
                      ),
                    ]),
                  ],
                ),
              ),
              SizedBox(height: 10),

              // Horizontally scrollable row of daily challenge cards
              Container(
                height: 250, // Adjust height
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    buildDailyChallengeCard(
                                context,
                                'Daily Challenge 1',
                                100,
                                'This is a placeholder description for Daily Challenge 1. Participate to earn points and rewards!', // Placeholder description
                                'assets/GS 1.gif' // Placeholder image path
                              ),
                    buildDailyChallengeCard(
                                context,
                                'Daily Challenge 2',
                                100,
                                'This is a placeholder description for Daily Challenge 1. Participate to earn points and rewards!', // Placeholder description
                                'assets/GS 1.gif' // Placeholder image path
                              ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CustomGoal()),
          );
        },
        icon: Icon(Icons.add, color: Colors.white),
        label: Text('Create a Customized Goal', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget buildButtonRow(BuildContext context, List<Widget> buttons) {
    return Wrap(
      spacing: MediaQuery.of(context).size.width * 0.1,
      runSpacing: 1,
      children: buttons,
    );
  }

  Widget buildButton(BuildContext context, String text, Widget page) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
        },
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.blue,
          padding: EdgeInsets.symmetric(vertical: 10.0),
          minimumSize: Size(MediaQuery.of(context).size.width * 0.5, 0),
        ),
        child: Text(
          text,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

//   Widget buildDailyChallengeCard(
//     BuildContext context,
//     //String imagePath,
//     String title,
//     int points)
//     {
//     return Container(
//       margin: EdgeInsets.symmetric(horizontal: 10.0),
//       width: MediaQuery.of(context).size.width * 0.6, // Adjust card width
//       decoration: BoxDecoration(
//         color: Color.fromARGB(76, 31, 31, 32),
//         borderRadius: BorderRadius.circular(10.0),
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           // Image of the goal
//           // Image.asset(
//           //   imagePath,
//           //   height: 100,
//           //   width: 100, // Adjust image height
//           // ),
//           SizedBox(height: 10),
//           // Title of the goal
//           Text(
//             title,
//             style: TextStyle(fontWeight: FontWeight.bold),
//           ),
//           SizedBox(height: 5),
//           // Points received
//           Text(
//             'Points: $points',
//             style: TextStyle(color: const Color.fromARGB(255, 199, 199, 199)),
//           ),
//           SizedBox(height: 10),
//           // View more button
//           ElevatedButton(
//             onPressed: () {
//               // Implement functionality to view more details
//             },
//             style: ElevatedButton.styleFrom(
//               foregroundColor: Colors.white, backgroundColor: Colors.black,
//             ),
//             child: Text('View More'),
//           ),
//         ],
//       ),
//     );
//   }

Widget buildDailyChallengeCard(
    BuildContext context,
    String title,
    int points,
    String description, // Add a description parameter for each challenge
    String imagePath // Add imagePath parameter to display the challenge image
    ) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 10.0),
    width: MediaQuery.of(context).size.width * 0.6, // Adjust card width
    decoration: BoxDecoration(
      color: Color.fromARGB(76, 31, 31, 32),
      borderRadius: BorderRadius.circular(10.0),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 10),
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Text(
          'Points: $points',
          style: TextStyle(color: const Color.fromARGB(255, 199, 199, 199)),
        ),
        SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            showOverlay(context, imagePath, title, points, description);
          },
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white, backgroundColor: Colors.black,
          ),
          child: Text('View More'),
        ),
      ],
    ),
  );
}

void showOverlay(BuildContext context, String imagePath, String title, int points, String description) {
  OverlayEntry overlayEntry; // Declare the overlayEntry variable.

  // Method to create the OverlayEntry
  OverlayEntry createOverlayEntry() {
    return OverlayEntry(
      builder: (context) => Positioned(
        top: MediaQuery.of(context).size.height * 0.2,
        left: MediaQuery.of(context).size.width * 0.1,
        child: Material(
          color: Colors.transparent,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.6,
            padding: EdgeInsets.all(20),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
                  ],
                ),
                Text('Points: $points', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(height: 20),
                Image.asset(imagePath, width: MediaQuery.of(context).size.width * 0.7),
                Expanded(
                  child: Text(description, style: TextStyle(fontSize: 16)),
                ),
                ElevatedButton(
                  onPressed: () {
                    //overlayEntry.remove(); // Use the overlayEntry variable after it's fully declared.
                    showSubscriptionPopup(context);
                  },
                  child: Text('Subscribe'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  overlayEntry = createOverlayEntry(); // Initialize the overlayEntry variable.
  Overlay.of(context)!.insert(overlayEntry); // Display the OverlayEntry.
}

void showSubscriptionPopup(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Subscription'),
        content: Text('You have successfully subscribed to the personalized goal.'),
        actions: <Widget>[
          TextButton(
            child: Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}


}
class MyRewardsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Rewards'),
      ),
      body: Center(
        child: Text('My Rewards Page'),
      ),
    );
  }
}

class EnergySavingTipsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Energy Saving Tips'),
      ),
      body: Center(
        child: Text('Energy Saving Tips Page'),
      ),
    );
  }
}

class ViewMyBadgesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View My Badges'),
      ),
      body: Center(
        child: Text('View My Badges Page'),
      ),
    );
  }
}
