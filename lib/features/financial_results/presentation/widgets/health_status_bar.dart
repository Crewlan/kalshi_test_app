import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../financial/data/models/financial_health_status.dart';

class HealthStatusBar extends StatelessWidget {
  final FinancialHealthStatus status;

  const HealthStatusBar({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double totalWidth = constraints.maxWidth;
        double containerWidth = totalWidth / 3;

        List<Widget> buildContainers(FinancialHealthStatus status) {
          switch (status) {
            case FinancialHealthStatus.healthy:
              return [
                buildContainer(
                  containerWidth,
                  AppColors.green,
                ),
                buildContainer(
                  containerWidth,
                  AppColors.green,
                ),
                buildContainer(
                  containerWidth,
                  AppColors.green,
                ),
              ];
            case FinancialHealthStatus.medium:
              return [
                buildContainer(
                  containerWidth,
                  AppColors.yellow,
                ),
                buildContainer(
                  containerWidth,
                  AppColors.yellow,
                ),
                buildContainer(
                  containerWidth,
                  Colors.transparent,
                ),
              ];
            case FinancialHealthStatus.low:
              return [
                buildContainer(
                  containerWidth,
                  AppColors.red,
                ),
                buildContainer(
                  containerWidth,
                  Colors.transparent,
                ),
                buildContainer(
                  containerWidth,
                  Colors.transparent,
                ),
              ];
          }
        }

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: SizedBox(
            width: totalWidth,
            height: 16,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  left: 2 * containerWidth -
                      10, // Adjust this value to ensure borders overlap correctly
                  child: buildContainers(status)[2],
                ),
                Positioned(
                  left: containerWidth -
                      2, // Adjust this value to ensure borders overlap correctly
                  child: buildContainers(status)[1],
                ),
                Positioned(
                  left: 10,
                  child: buildContainers(status)[0],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildContainer(double width, Color color) {
    return Center(
      child: Container(
        width: width,
        height: 16,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            width: 2,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
