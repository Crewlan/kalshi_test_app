import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/dismiss_keyboard.dart';
import '../../../../core/widgets/kalshi_header.dart';
import '../../../../core/widgets/styled_button.dart';
import '../../../../core/widgets/styled_financial_header.dart';
import '../../../../core/widgets/styled_gdpr_information_data.dart';
import '../../../../core/widgets/styled_icon_card.dart';
import '../../../../core/widgets/styled_text_form_field.dart';
import '../../../../injection_container.dart';
import '../cubit/financial_health_cubit.dart';
import '../widgets/financial_card_information.dart';

/// Presents a [FinancialFormState]
class FinancialFormState extends StatefulWidget {
  /// Takes [annualIncomeController] and [monthlyCostsController] to construct this widget
  const FinancialFormState({
    super.key,
    required this.annualIncomeController,
    required this.monthlyCostsController,
  });

  final TextEditingController annualIncomeController;
  final TextEditingController monthlyCostsController;

  @override
  State<FinancialFormState> createState() => _FinancialFormStateState();
}

class _FinancialFormStateState extends State<FinancialFormState> {
  final _formKey = GlobalKey<FormState>();

  final _cubit = sl<FinancialHealthCubit>();

  /// Function to validate forms
  String? _validateNumber(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.financialFormValidationIfIsNull;
    }
    final number = double.tryParse(value);
    if (number == null) {
      return AppStrings.financialFormValidationNumber;
    }
    if (number <= 0) {
      return AppStrings.financialFormValidationMoreThanZero;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => dismissKeyboard(),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const KalshiHeader(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 24),
                  const StyledFinancialRichText(
                    firstLabel: AppStrings.financialFormTitleInitial,
                    secondlabel: AppStrings.financialFormTitleFinal,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 24),
                    padding: const EdgeInsets.all(16),
                    decoration: const BoxDecoration(
                      color: AppColors.lightest,
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.boxShadow,
                          offset: Offset(0, 2),
                          blurRadius: 12,
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: Form(
                      key: _formKey,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const StyledIconCard(),
                          const FinancialCardInformation(),
                          const Text(
                            AppStrings.annualIncome,
                            style: TextStyle(
                              fontFamily: 'Worksans',
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: AppColors.blueDarkest,
                            ),
                          ),
                          const SizedBox(height: 7),
                          StyledTextFormField(
                            controller: widget.annualIncomeController,
                            validator: _validateNumber,
                            keyboardType: TextInputType.number,
                            enableBorderColor: AppColors.grayLightest,
                            prefixIcon: SvgPicture.asset(
                              AppImages.dollarSign,
                              width: 24,
                              height: 24,
                            ),
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            AppStrings.monthlyCosts,
                            style: TextStyle(
                              fontFamily: 'Worksans',
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: AppColors.blueDarkest,
                            ),
                          ),
                          const SizedBox(height: 7),
                          StyledTextFormField(
                            controller: widget.monthlyCostsController,
                            validator: _validateNumber,
                            keyboardType: TextInputType.number,
                            enableBorderColor: AppColors.grayLightest,
                            prefixIcon: SvgPicture.asset(
                              AppImages.dollarSign,
                              width: 24,
                              height: 24,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            child: StyledButton(
                              text: AppStrings.financialScreenButtonLabel,
                              action: () {
                                if (_formKey.currentState!.validate()) {
                                  var annualIncome = double.parse(
                                      widget.annualIncomeController.text);

                                  var montlyCosts = double.parse(
                                      widget.monthlyCostsController.text);

                                  _cubit.calculateFinancialWellness(
                                    annualIncome: annualIncome,
                                    montlyCosts: montlyCosts,
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        AppStrings.financialScreenSnackbarLabel,
                                      ),
                                    ),
                                  );
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  const StyledGdprInformationData(),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
