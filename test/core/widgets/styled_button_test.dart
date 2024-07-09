import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kalshi_test_app/core/widgets/styled_button.dart';

void main() {
  testWidgets('StyledButton widget test', (WidgetTester tester) async {
    bool buttonPressed = false;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: StyledButton(
            text: 'Press Me',
            action: () {
              buttonPressed = true;
            },
          ),
        ),
      ),
    );

    expect(find.byType(StyledButton), findsOneWidget);

    expect(find.text('Press Me'), findsOneWidget);

    expect(buttonPressed, isFalse);

    await tester.tap(find.text('Press Me'));
    await tester.pump();

    expect(buttonPressed, isTrue);
  });
}
