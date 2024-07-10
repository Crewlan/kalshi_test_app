import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/extensions/ui_helper_extension.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/dismiss_keyboard.dart';
import '../cubit/financial_health_cubit.dart';
import 'financial_form_state.dart';

class FinancialScreen extends StatelessWidget {
  FinancialScreen({super.key});

  final _annualIncomeController = TextEditingController();
  final _monthlyCostsController = TextEditingController();

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
                  }
                },
                builder: (context, state) {
                  return FinancialFormState(
                    annualIncomeController: _annualIncomeController,
                    monthlyCostsController: _monthlyCostsController,
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
