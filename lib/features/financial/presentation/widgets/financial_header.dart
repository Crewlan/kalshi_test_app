import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';

class FinancialHeader extends StatelessWidget {
  const FinancialHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
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
    );
  }
}
