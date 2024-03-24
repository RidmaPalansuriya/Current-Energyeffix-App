// import 'package:flutter/material.dart';

// class CustomBottomNavigation extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       height: 51,
//       padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//       decoration: ShapeDecoration(
//         color: Color(0xFF3A3737),
//         shape: RoundedRectangleBorder(
//           side: BorderSide(
//             width: 1,
//             color: Colors.black.withOpacity(0.15),
//           ),
//           borderRadius: BorderRadius.circular(30),
//         ),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           _buildNavItem(icon: Icons.home, label: 'Home'),
//           _buildNavItem(icon: Icons.analytics, label: 'Analytics'),
//           _buildNavItem(icon: Icons.emoji_events, label: 'Goal'),
//           _buildNavItem(icon: Icons.receipt, label: 'My Bill'),
//           _buildNavItem(icon: Icons.settings, label: 'Settings'),
//         ],
//       ),
//     );
//   }

//   Widget _buildNavItem({required IconData icon, required String label}) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Stack(
//           children: [
//             Container(
//               width: 45,
//               height: 45,
//               decoration: ShapeDecoration(
//                 color: Color(0xFF3A3737),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//               ),
//             ),
//             Positioned(
//               left: 16,
//               top: 4,
//               child: Icon(
//                 icon,
//                 size: 24,
//                 color: Colors.white,
//               ),
//             ),
//           ],
//         ),
//         SizedBox(height: 4),
//         Text(
//           label,
//           style: TextStyle(
//             color: Color(0xFF979797),
//             fontSize: 12,
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//       ],
//     );
//   }
// }

// // How to use
// // CustomBottomNavigation(),
