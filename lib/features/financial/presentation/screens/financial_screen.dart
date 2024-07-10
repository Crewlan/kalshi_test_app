import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalshi_test_app/core/utils/app_colors.dart';

import '../../../../core/extensions/ui_helper_extension.dart';
import '../../../../core/routes/routes.dart';
import '../cubit/financial_health_cubit.dart';
import 'financial_form_state.dart';

class FinancialScreen extends StatelessWidget {
  const FinancialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: SizedBox(
        height: context.height,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: AppColors.lightest,
            body: BlocConsumer<FinancialHealthCubit, FinancialHealthState>(
              listener: (context, state) {
                if (state is FinancialReady) {
                  Navigator.of(context).pushNamed(
                    Routes.resultsScreen,
                    arguments: state.financialHealthStatus,
                  );
                }
              },
              builder: (context, state) {
                return const FinancialFormState();
              },
            ),
          ),
        ),
      ),
    );
  }
}
