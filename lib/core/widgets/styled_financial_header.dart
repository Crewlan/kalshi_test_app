import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

/// Widget to generate a rich text using two labels with parameters
class StyledFinancialRichText extends StatelessWidget {
  final String firstLabel;
  final String secondlabel;
  final Color colorLabel;
  final double firstLabelfontSize;
  final double secondLabelFontSize;

  const StyledFinancialRichText({
    super.key,
    required this.firstLabel,
    required this.secondlabel,
    this.colorLabel = AppColors.blue,
    this.firstLabelfontSize = 18,
    this.secondLabelFontSize = 20,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: firstLabel,
        style: TextStyle(
          fontFamily: 'Worksans',
          fontWeight: FontWeight.w400,
          fontSize: firstLabelfontSize,
          color: colorLabel,
        ),
        children: <TextSpan>[
          TextSpan(
            text: secondlabel,
            style: TextStyle(
              fontFamily: 'Worksans',
              fontWeight: FontWeight.w600,
              fontSize: secondLabelFontSize,
            ),
          ),
        ],
      ),
    );
  }
}
