import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';

/// Presents a [FinancialCardInformation]
class FinancialCardInformation extends StatelessWidget {
  const FinancialCardInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
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
    );
  }
}
