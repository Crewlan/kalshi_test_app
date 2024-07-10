import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/app_colors.dart';
import '../utils/app_images.dart';

/// Widget to generate a icon with a rounded container
class StyledIconCard extends StatelessWidget {
  const StyledIconCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
          color: AppColors.darkest,
          shape: BoxShape.circle,
        ),
        child: SvgPicture.asset(AppImages.selectAnIcon),
      ),
    );
  }
}
