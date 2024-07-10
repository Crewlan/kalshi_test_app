import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/financial/data/models/financial_health_status.dart';
import '../../features/financial_results/presentation/screen/financial_result_screen.dart';

import '../../features/financial/presentation/cubit/financial_health_cubit.dart';
import '../../features/financial/presentation/screens/financial_screen.dart';
import '../../injection_container.dart';
import 'routes.dart';

class AppRouter {
  Route generateRoutes(RouteSettings settings) {
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
      default:
        return CupertinoPageRoute(
          settings: const RouteSettings(name: 'error_default'),
          builder: (context) => const Scaffold(
            body: Center(
              child: Text('Error'),
            ),
          ),
        );
    }
  }
}
