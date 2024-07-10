import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:kalshi_test_app/core/utils/app_colors.dart';
import 'package:kalshi_test_app/core/utils/app_strings.dart';
import 'package:kalshi_test_app/core/widgets/styled_gdpr_information_data.dart';

void main() {
  testWidgets('StyledGdprInformationData widget test',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: StyledGdprInformationData(),
        ),
      ),
    );

    expect(find.byType(SvgPicture), findsOneWidget);

    expect(find.text(AppStrings.lgpdFinancialDataSecurity), findsOneWidget);

    final textWidget =
        tester.widget<Text>(find.text(AppStrings.lgpdFinancialDataSecurity));
    expect(textWidget.style!.fontFamily, 'Worksans');
    expect(textWidget.style!.color, AppColors.blueLight);
    expect(textWidget.style!.fontWeight, FontWeight.w400);
  });
}
