// import 'package:energyeffix_app/Analytics.dart';
// import 'package:energyeffix_app/Bill.dart';
// import 'package:energyeffix_app/Goal.dart';
// import 'package:energyeffix_app/Home.dart';
// import 'package:flutter/material.dart';
// import 'package:curved_navigation_bar/curved_navigation_bar.dart';

// class MyNavBar extends StatefulWidget {
//   @override
//   _MyNavBarState createState() => _MyNavBarState();
// }

// class _MyNavBarState extends State<MyNavBar> {
//   int _pageIndex = 0;


//   void _onSwipe(DragUpdateDetails details) {
//   // Determine swipe direction for left or right swipe
//   if (details.primaryDelta < -10) { // Swiped Left
//     setState(() {
//       _pageIndex = _pageIndex < 4 ? _pageIndex + 1 : 4;
//     });
//   } else if (details.primaryDelta > 10) { // Swiped Right
//     setState(() {
//       _pageIndex = _pageIndex > 0 ? _pageIndex - 1 : 0;
//     });
//   }
// }


//   @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     body: GestureDetector(
//       onHorizontalDragUpdate: _onSwipe,
//       child: _getPage(_pageIndex),
//     ),
//       body: _getPage(_pageIndex),
//       bottomNavigationBar: CurvedNavigationBar(
//         index: _pageIndex,
//         height: 56,
//         color: Colors.transparent,
//         buttonBackgroundColor: Color(0xff1D1E33),
//         backgroundColor: Color(0xff0071aa),
//         animationCurve: Curves.easeInOut,
//         animationDuration: Duration(milliseconds: 400),
//         items: <Widget>[
//           Icon(Icons.home_rounded, size: 26, color: Colors.white),
//           Icon(Icons.analytics, size: 26, color: Colors.white),
//           Icon(Icons.star, size: 26, color: Colors.white),
//           Icon(Icons.attach_money_rounded, size: 26, color: Colors.white),
//           Icon(Icons.devices, size: 26, color: Colors.white),
//         ],
//         onTap: (index) {
//           setState(() {
//             _pageIndex = index;
//           });
//         },
//       ),
//     );
//   }

//   Widget _getPage(int index) {
//     switch (index) {
//       case 0:
//         return Home();
//       case 1:
//         return Analytics();
//       case 2:
//         return Goal();
//       case 3:
//         return Bill(month: 'March', unitsUsed: 100,  usageAmount: 800, totalAmount: 1000, );
//       case 4:
//         return Goal();
//       default:
//         return Home();
//     }
//   }
// }


import 'package:energyeffix_app/Analytics.dart';
import 'package:energyeffix_app/Bill.dart';
import 'package:energyeffix_app/Devices.dart';
import 'package:energyeffix_app/Goal.dart';
import 'package:energyeffix_app/Home.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class MyNavBar extends StatefulWidget {
  @override
  _MyNavBarState createState() => _MyNavBarState();
}

class _MyNavBarState extends State<MyNavBar> {
  int _pageIndex = 0;

  void _onSwipe(DragUpdateDetails details) {
    if (details.primaryDelta! < -10) {
      setState(() {
        _pageIndex = _pageIndex < 4 ? _pageIndex + 1 : 4;
      });
    } else if (details.primaryDelta! > 10) {
      setState(() {
        _pageIndex = _pageIndex > 0 ? _pageIndex - 1 : 0;
      });
    }
  }

  Widget _getPage(int index) {
    switch (index) {
      case 0:
        return Home();
      case 1:
        return Analytics();
      case 2:
        return Goal();
      case 3:
        return Bill(month: 'March', unitsUsed: 100, usageAmount: 800, totalAmount: 1000);
      case 4:
        return Devices();
      default:
        return Home();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Add the GestureDetector here and wrap the body
      body: GestureDetector(
        onHorizontalDragUpdate: _onSwipe,
        child: _getPage(_pageIndex),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: _pageIndex,
        height: 56,
        color: Colors.transparent,
        buttonBackgroundColor: Color(0xff1D1E33),
        backgroundColor: Color(0xff0071aa),
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 400),
        items: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.home_rounded, size: 26, color: Colors.white),
              Text('Home', style: TextStyle(color: Colors.white)),
            ],
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.analytics, size: 26, color: Colors.white),
              Text('Analytics', style: TextStyle(color: Colors.white)),
            ],
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.star, size: 26, color: Colors.white),
              Text('Goal', style: TextStyle(color: Colors.white)),
            ],
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.attach_money_rounded, size: 26, color: Colors.white),
              Text('Bill', style: TextStyle(color: Colors.white)),
            ],
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.devices, size: 26, color: Colors.white),
              Text('Devices', style: TextStyle(color: Colors.white)),
            ],
          ),
          // Icon(Icons.home_rounded, size: 26, color: Colors.white),
          // Icon(Icons.analytics, size: 26, color: Colors.white),
          // Icon(Icons.star, size: 26, color: Colors.white),
          // Icon(Icons.attach_money_rounded, size: 26, color: Colors.white),
          // Icon(Icons.devices, size: 26, color: Colors.white),
        ],
        onTap: (index) {
          setState(() {
            _pageIndex = index;
          });
        },
      ),
    );
  }
}
