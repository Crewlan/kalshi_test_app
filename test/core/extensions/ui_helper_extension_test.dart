import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kalshi_test_app/core/extensions/ui_helper_extension.dart';

void main() {
  testWidgets('Test LayoutHelperBuildContextExtension',
      (WidgetTester tester) async {
    // Build a simple widget that uses the extension
    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (context) {
            // Use the extension inside a Text widget
            return Scaffold(
              body: Center(
                child: Text(
                  'Width: ${context.width}, Height: ${context.height}',
                  textDirection: TextDirection.ltr,
                ),
              ),
            );
          },
        ),
      ),
    );

    // Verify if the width and height are displayed correctly
    expect(find.text('Width: 800.0, Height: 600.0'),
        findsOneWidget); // Update with expected values based on your screen size
  });
}
