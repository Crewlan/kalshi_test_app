import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kalshi_test_app/core/utils/app_strings.dart';
import 'package:kalshi_test_app/features/financial/presentation/cubit/financial_health_cubit.dart';
import 'package:kalshi_test_app/injection_container.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/widgets/kalshi_header.dart';
import '../../../../core/widgets/styled_button.dart';
import '../../../../core/widgets/styled_gdpr_information_data.dart';
import '../../../../core/widgets/styled_text_form_field.dart';
import '../widgets/financial_card_information.dart';
import '../widgets/financial_header.dart';

class FinancialFormState extends StatefulWidget {
  const FinancialFormState({super.key});

  @override
  State<FinancialFormState> createState() => _FinancialFormStateState();
}

class _FinancialFormStateState extends State<FinancialFormState> {
  final _formKey = GlobalKey<FormState>();
  final _annualIncomeController = TextEditingController();
  final _monthlyCostsController = TextEditingController();
  final _cubit = sl<FinancialHealthCubit>();

  @override
  void dispose() {
    _annualIncomeController.dispose();
    _monthlyCostsController.dispose();
    super.dispose();
  }

  String? _validateNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    final number = double.tryParse(value);
    if (number == null) {
      return 'Please enter a valid number';
    }
    if (number <= 0) {
      return 'Value must be greater than zero';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const KalshiHeader(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 24),
                const FinancialHeader(),
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
                        Center(
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: const BoxDecoration(
                              color: AppColors.darkest,
                              shape: BoxShape.circle,
                            ),
                            child: SvgPicture.asset(AppImages.selectAnIcon),
                          ),
                        ),
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
                          controller: _annualIncomeController,
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
                          controller: _monthlyCostsController,
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
                            text: 'Continue',
                            action: () {
                              if (_formKey.currentState!.validate()) {
                                var annualIncome =
                                    double.parse(_annualIncomeController.text);

                                var montlyCosts =
                                    double.parse(_monthlyCostsController.text);

                                _cubit.calculateFinancialWellness(
                                  annualIncome: annualIncome,
                                  montlyCosts: montlyCosts,
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content:
                                          Text('Please correct the errors')),
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
    );
  }
}
