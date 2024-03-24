import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:energyeffix_app/custom_app_bar.dart';

void main() {
  testWidgets('CustomAppBar renders correctly', (WidgetTester tester) async {

   

    // Verify that the menu icon is present
    expect(find.byIcon(Icons.menu), findsOneWidget);

    // Verify that the notification icon is present
    expect(find.byIcon(Icons.add_alert), findsOneWidget);

    // Verify that the profile icon is present
    expect(find.byIcon(Icons.account_circle), findsOneWidget);

    // Verify that the title text is present
    expect(find.text('Test Title'), findsOneWidget);

    // You can add more specific tests for other widgets and properties if needed
  });
}
