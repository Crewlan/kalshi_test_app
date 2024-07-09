import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kalshi_test_app/core/widgets/kalshi_header.dart';

void main() {
  testWidgets('KalshiHeader widget test', (WidgetTester tester) async {
    await tester.pumpWidget(const KalshiHeader());

    expect(find.byType(KalshiHeader), findsOneWidget);

    expect(find.byType(SvgPicture), findsOneWidget);

    final widgetKey = GlobalKey();

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (context) => SvgPicture.asset(
              'assets/images/kalshi_logo_black.svg',
              key: widgetKey,
            ),
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.byKey(widgetKey), findsOneWidget);
  });
}
