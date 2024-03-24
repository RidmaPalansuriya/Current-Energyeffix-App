import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:energyeffix_app/Components/CustomDrawer.dart'; // Import your CustomDrawer widget

void main() {
  testWidgets('CustomDrawer widget renders correctly', (WidgetTester tester) async {
    // Build our app and trigger a frame
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        drawer: CustomDrawer(), // Use your CustomDrawer widget here
      ),
    ));

    // Verify that Drawer Header is present
    expect(find.text('Drawer Header'), findsOneWidget);

    // Verify that Item 1 is present
    expect(find.text('Item 1'), findsOneWidget);

    // Verify that Item 2 is present
    expect(find.text('Item 2'), findsOneWidget);
  });
}
