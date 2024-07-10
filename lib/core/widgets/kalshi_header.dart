import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/app_images.dart';

/// Widget to generate image heade with Kalshi logo
class KalshiHeader extends StatelessWidget {
  /// Create instance
  const KalshiHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30),
        child: SizedBox(
          child: SvgPicture.asset(AppImages.kalshiLogoBlack),
        ),
      ),
    );
  }
}
