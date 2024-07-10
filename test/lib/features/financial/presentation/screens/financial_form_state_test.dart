import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:kalshi_test_app/features/financial/presentation/screens/financial_form_state.dart';
import 'package:mocktail/mocktail.dart';
import 'package:kalshi_test_app/core/utils/app_strings.dart';
import 'package:kalshi_test_app/core/widgets/kalshi_header.dart';
import 'package:kalshi_test_app/core/widgets/styled_button.dart';
import 'package:kalshi_test_app/core/widgets/styled_financial_header.dart';
import 'package:kalshi_test_app/core/widgets/styled_gdpr_information_data.dart';
import 'package:kalshi_test_app/core/widgets/styled_icon_card.dart';
import 'package:kalshi_test_app/core/widgets/styled_text_form_field.dart';
import 'package:kalshi_test_app/features/financial/presentation/cubit/financial_health_cubit.dart';
import 'package:kalshi_test_app/features/financial/presentation/widgets/financial_card_information.dart';

class MockFinancialHealthCubit extends Mock implements FinancialHealthCubit {}

void main() {
  late MockFinancialHealthCubit mockFinancialHealthCubit;

  final getIt = GetIt.instance;

  setUp(() {
    mockFinancialHealthCubit = MockFinancialHealthCubit();
    getIt.registerFactory<FinancialHealthCubit>(() => mockFinancialHealthCubit);
  });

  tearDown(() {
    getIt.reset();
  });

  testWidgets('FinancialFormState renders correctly',
      (WidgetTester tester) async {
    final TextEditingController annualIncomeController =
        TextEditingController();
    final TextEditingController monthlyCostsController =
        TextEditingController();

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: FinancialFormState(
            annualIncomeController: annualIncomeController,
            monthlyCostsController: monthlyCostsController,
          ),
        ),
      ),
    );

    // Verify the KalshiHeader is present
    expect(find.byType(KalshiHeader), findsOneWidget);

    // Verify the StyledFinancialRichText is present
    expect(find.byType(StyledFinancialRichText), findsOneWidget);

    // Verify the StyledIconCard is present
    expect(find.byType(StyledIconCard), findsOneWidget);

    // Verify the FinancialCardInformation is present
    expect(find.byType(FinancialCardInformation), findsOneWidget);

    // Verify the StyledTextFormFields are present
    expect(find.byType(StyledTextFormField), findsNWidgets(2));

    // Verify the StyledButton is present
    expect(find.byType(StyledButton), findsOneWidget);

    // Verify the StyledGdprInformationData is present
    expect(find.byType(StyledGdprInformationData), findsOneWidget);

    // Verify the dollar sign icons are present
    expect(find.byType(SvgPicture), findsNWidgets(5));

    // Verify the form validation
    final button = find.byType(StyledButton);
    await tester.tap(button);
    await tester.pump();

    // Verify the SnackBar shows up when form is invalid
    expect(find.text(AppStrings.financialScreenSnackbarLabel), findsOneWidget);

    // Fill the form with valid data
    await tester.enterText(find.byType(StyledTextFormField).at(0), '100000');
    await tester.enterText(find.byType(StyledTextFormField).at(1), '2000');
    await tester.tap(button);
    await tester.pump();

    // Verify calculateFinancialWellness is called
    verify(() => mockFinancialHealthCubit.calculateFinancialWellness(
          annualIncome: 100000,
          montlyCosts: 2000,
        )).called(1);
  });
}
