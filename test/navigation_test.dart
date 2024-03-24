import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:energyeffix_app/LeaderBoard.dart'; // Import your LeaderboardPage widget

void main() {
  testWidgets('LeaderboardPage renders correctly', (WidgetTester tester) async {
    // Build our app and trigger a frame
    await tester.pumpWidget(
      MaterialApp(
        home: LeaderboardPage(),
      ),
    );

    // Verify that the app bar is present
    expect(find.byType(AppBar), findsOneWidget);

    // Verify that the top section with first, second, and third placeholders is present
    expect(find.byType(Container), findsNWidgets(3));

    // Verify that the my rank section is not present when myDetails is null
    expect(find.byType(Container), findsNWidgets(2));

    // Verify that the leaderboard table is present
    expect(find.byType(DataTable), findsOneWidget);

    // You can add more specific tests for other widgets and properties if needed
  });
}
