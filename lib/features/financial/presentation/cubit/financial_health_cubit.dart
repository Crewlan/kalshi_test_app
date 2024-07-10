import 'package:equatable/equatable.dart';

import '../../../../core/cubit/kalshi_cubit.dart';
import '../../data/models/financial_health_status.dart';
import '../../domain/usecases/calculate_financial_health.dart';

part 'financial_health_state.dart';

class FinancialHealthCubit extends KalshiCubit<FinancialHealthState> {
  final CalculateFinancialHealth calculateFinancialHealth;

  FinancialHealthCubit({required this.calculateFinancialHealth})
      : super(const FinancialInitial());

  void calculateFinancialWellness({
    required double annualIncome,
    required double montlyCosts,
  }) {
    emit(const FinancialLoading());

    var resultFinancialHealth = calculateFinancialHealth(
      annualIncome,
      montlyCosts,
    );

    emit(FinancialReady(
      financialHealthStatus: resultFinancialHealth,
    ));
  }
}
