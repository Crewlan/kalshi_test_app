import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/kalshi_header.dart';
import '../../../../core/widgets/styled_button.dart';
import '../../../../core/widgets/styled_grpd_information_data.dart';
import '../../../../core/widgets/styled_text_form_field.dart';

class FinancialFormState extends StatefulWidget {
  const FinancialFormState({super.key});

  @override
  State<FinancialFormState> createState() => _FinancialFormStateState();
}

class _FinancialFormStateState extends State<FinancialFormState> {
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
                RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    text: AppStrings.financialFormTitleInitial,
                    style: TextStyle(
                      fontFamily: 'Worksans',
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: AppColors.blue,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: AppStrings.financialFormTitleFinal,
                        style: TextStyle(
                            fontFamily: 'Worksans',
                            fontWeight: FontWeight.w600,
                            fontSize: 20),
                      ),
                    ],
                  ),
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
                      ]),
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
                      const Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          child: Column(
                            children: [
                              Text(
                                AppStrings.financialCardFormTitle,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'Rubik',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20,
                                  color: AppColors.blueDarkest,
                                ),
                              ),
                              Text(
                                AppStrings.financialCardFormSubtitle,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'Worksans',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: AppColors.blueLight,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Text(
                        'Annual income',
                        style: TextStyle(
                          fontFamily: 'Worksans',
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: AppColors.blueDarkest,
                        ),
                      ),
                      const SizedBox(height: 7),
                      StyledTextFormField(
                        enableBorderColor: AppColors.grayLightest,
                        prefixIcon: SvgPicture.asset(
                          AppImages.dollarSign,
                          width: 24,
                          height: 24,
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Monthly Costs',
                        style: TextStyle(
                          fontFamily: 'Worksans',
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: AppColors.blueDarkest,
                        ),
                      ),
                      const SizedBox(height: 7),
                      StyledTextFormField(
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
                          action: () {},
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                const StyledGrpdInformationData(),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
