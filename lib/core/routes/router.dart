import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/financial/data/models/financial_health_status.dart';
import '../../features/financial/presentation/cubit/financial_health_cubit.dart';
import '../../features/financial/presentation/screens/financial_screen.dart';
import '../../features/financial_results/presentation/screen/financial_result_screen.dart';
import '../../injection_container.dart';
import '../utils/app_strings.dart';
import '../widgets/styled_button.dart';
import 'routes.dart';

/// Class to generate [AppRouter] based on app routes
class AppRouter {
  /// Function to generate Routes using CupertinoPageRouter
  Route generateRoutes(RouteSettings settings) {
    /// Blocs
    final financialHealthCubit = sl<FinancialHealthCubit>();

    switch (settings.name) {
      case Routes.financialHealth:
        return CupertinoPageRoute(
          builder: (context) => BlocProvider.value(
            value: financialHealthCubit,
            child: FinancialScreen(),
          ),
        );
      case Routes.resultsScreen:
        return CupertinoPageRoute(
          builder: (context) => FinancialResultScreen.withArgs(
            FinancialResultScreenParams(
              financialHealthStatus:
                  settings.arguments as FinancialHealthStatus,
            ),
          ),
        );

      /// Default Screen if not find routes
      default:
        return CupertinoPageRoute(
          settings: const RouteSettings(name: 'error_default'),
          builder: (context) => Scaffold(
            body: Column(
              children: [
                const Center(
                  child: Text(AppStrings.defaultScreenTitleLabel),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: StyledButton(
                      text: AppStrings.defaultScreenButtonLabel,
                      action: () => Navigator.of(context)
                          .pushNamed(Routes.financialHealth),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
    }
  }
}
