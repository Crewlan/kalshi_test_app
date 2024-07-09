import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/app_colors.dart';
import '../utils/app_images.dart';
import '../utils/app_strings.dart';

class StyledGrpdInformationData extends StatelessWidget {
  const StyledGrpdInformationData({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 11),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(AppImages.lock),
          const SizedBox(height: 16),
          const Text(
            AppStrings.lgpdFinancialDataSecurity,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Worksans',
              color: AppColors.blueLight,
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      ),
    );
  }
}
