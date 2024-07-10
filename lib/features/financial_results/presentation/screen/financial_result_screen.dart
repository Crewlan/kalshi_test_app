import 'package:flutter/material.dart';

import '../../../../core/extensions/ui_helper_extension.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/kalshi_header.dart';
import '../../../../core/widgets/styled_button.dart';
import '../../../../core/widgets/styled_financial_header.dart';
import '../../../../core/widgets/styled_gdpr_information_data.dart';
import '../../../../core/widgets/styled_icon_card.dart';
import '../../../financial/data/models/financial_health_status.dart';
import '../widgets/financial_result_card_information.dart';

/// This class represents a arguments
class FinancialResultScreenParams {
  final FinancialHealthStatus financialHealthStatus;

  FinancialResultScreenParams({required this.financialHealthStatus});
}

/// This class extends StatelessWidget
///
/// It receive a FinancialHealthStatus on parameters to build a custom UI
class FinancialResultScreen extends StatelessWidget {
  static FinancialResultScreen withArgs(FinancialResultScreenParams args) =>
      FinancialResultScreen(
        financialHealthStatus: args.financialHealthStatus,
      );

  const FinancialResultScreen({super.key, required this.financialHealthStatus});

  final FinancialHealthStatus financialHealthStatus;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: SizedBox(
        height: context.height,
        child: SafeArea(
          child: Scaffold(
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: AppColors.lightest,
                    child: const KalshiHeader(),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 24),
                          child: StyledFinancialRichText(
                            firstLabel: AppStrings.financialResultsTitleInitial,
                            secondlabel: AppStrings.financialResultsTitleFinal,
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
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const StyledIconCard(),
                              FinancialResultCardInformation(
                                status: financialHealthStatus,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16),
                                child: StyledButton(
                                  text: AppStrings.financialResultsButtonLabel,
                                  backgroundColor: Colors.transparent,
                                  outlineColor: AppColors.blue,
                                  textColor: AppColors.blue,
                                  action: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ),
                            ],
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
          ),
        ),
      ),
    );
  }
}
