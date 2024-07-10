import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalshi_test_app/injection_container.dart';

import '../../../../core/extensions/ui_helper_extension.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/dismiss_keyboard.dart';
import '../cubit/financial_health_cubit.dart';
import 'financial_form_state.dart';

/// This class extends StatelessWidget
///
/// It listens to [FinancialHealthState] to render the proper UI
class FinancialScreen extends StatelessWidget {
  FinancialScreen({super.key});

  final _annualIncomeController = TextEditingController();
  final _monthlyCostsController = TextEditingController();
  final _cubit = sl<FinancialHealthCubit>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => dismissKeyboard(),
      child: PopScope(
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
                    _monthlyCostsController.clear();
                    _annualIncomeController.clear();
                    _cubit.reload();
                  }
                },
                builder: (context, state) {
                  if (state is FinancialInitial) {
                    return FinancialFormState(
                      annualIncomeController: _annualIncomeController,
                      monthlyCostsController: _monthlyCostsController,
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
