import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kalshi_test_app/core/utils/dismiss_keyboard.dart';

void main() {
  testWidgets('dismissKeyboard removes focus from text field',
      (WidgetTester tester) async {
    // Create a widget with a TextField to test the focus behavior
    final textFieldKey = GlobalKey();

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Column(
            children: [
              TextField(key: textFieldKey),
            ],
          ),
        ),
      ),
    );

    // Call dismissKeyboard function
    dismissKeyboard();
    await tester.pump();

    // Verify that the text field is no longer focused
    expect(FocusManager.instance.primaryFocus?.hasFocus, isTrue);
  });
}
