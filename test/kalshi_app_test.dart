import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kalshi_test_app/core/routes/routes.dart';
import 'package:kalshi_test_app/core/utils/app_colors.dart';
import 'package:kalshi_test_app/kalshi_app.dart';

void main() {
  testWidgets('KalshiApp renders correctly', (WidgetTester tester) async {
    // Build the KalshiApp widget.
    await tester.pumpWidget(KalshiApp());

    // Verify if the MaterialApp is present.
    expect(find.byType(MaterialApp), findsOneWidget);

    // Verify if the initial route is set to Routes.calculator.
    final materialApp = tester.widget<MaterialApp>(find.byType(MaterialApp));
    expect(materialApp.initialRoute, Routes.calculator);

    // Verify if the Scaffold background color is set correctly.
    expect(
        materialApp.theme?.scaffoldBackgroundColor, AppColors.backgroundColor);

    // Verify if the debugShowCheckedModeBanner is set to false.
    expect(materialApp.debugShowCheckedModeBanner, isFalse);
  });
}
