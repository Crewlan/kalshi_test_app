import 'package:flutter/material.dart';
import 'package:kalshi_test_app/core/widgets/styled_financial_header.dart';
import 'package:kalshi_test_app/features/financial/data/models/financial_health_status.dart';
import 'package:kalshi_test_app/features/financial_results/presentation/widgets/health_status_bar.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';

class FinancialResultCardInformation extends StatelessWidget {
  const FinancialResultCardInformation({super.key, required this.status});

  final FinancialHealthStatus status;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          children: [
            Text(
              titleByStatus(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: 'Rubik',
                fontWeight: FontWeight.w500,
                fontSize: 20,
                color: AppColors.blueDarkest,
              ),
            ),
            Center(
              child: HealthStatusBar(
                status: status,
              ),
            ),
            StyledFinancialRichText(
              firstLabel: AppStrings.financialResultsBody,
              secondlabel: subtitleByStatus(),
              colorLabel: AppColors.grayMedium,
              firstLabelfontSize: 14,
              secondLabelFontSize: 14,
            )
          ],
        ),
      ),
    );
  }

  String titleByStatus() {
    switch (status) {
      case FinancialHealthStatus.healthy:
        return AppStrings.financialResultsTitleCardHealth;
      case FinancialHealthStatus.medium:
        return AppStrings.financialResultsTitleCardMedium;
      case FinancialHealthStatus.low:
        return AppStrings.financialResultsTitleCardLow;
    }
  }

  String subtitleByStatus() {
    switch (status) {
      case FinancialHealthStatus.healthy:
        return AppStrings.financialResultsSubtitleCardHealth;
      case FinancialHealthStatus.medium:
        return AppStrings.financialResultsSubtitleCardMedium;
      case FinancialHealthStatus.low:
        return AppStrings.financialResultsSubtitleCardLow;
    }
  }
}
