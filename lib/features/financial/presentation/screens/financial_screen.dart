import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/extensions/ui_helper_extension.dart';
import '../../../../core/routes/routes.dart';
import '../cubit/financial_cubit.dart';
import 'financial_form_state.dart';

class FinancialScreen extends StatelessWidget {
  const FinancialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height,
      child: SafeArea(
        child: Scaffold(
          body: BlocConsumer<FinancialHealthCubit, FinancialHealthState>(
            listener: (context, state) {
              if (state is FinancialReady) {
                Navigator.of(context).pushNamed(Routes.resultsScreen);
              }
            },
            builder: (context, state) {
              if (state is FinancialInitial) {
                return const FinancialFormState();
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
    );
  }
}
