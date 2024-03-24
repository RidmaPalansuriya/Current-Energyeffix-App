import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:energyeffix_app/home.dart';


void main() {
  testWidgets('Home widget renders correctly', (WidgetTester tester) async {
    // Build our app and trigger a frame
    await tester.pumpWidget(MaterialApp(
      home: Home(),
    ));

    // Verify that the 'Analytics' button is present
    expect(find.text('Analytics'), findsOneWidget);

    // Verify that the 'Bill' button is present
    expect(find.text('Bill'), findsOneWidget);

    // Verify that the 'Goal' button is present
    expect(find.text('Goal'), findsOneWidget);

    // Verify that the 'Device' button is present
    expect(find.text('Device'), findsOneWidget);
  });


}


