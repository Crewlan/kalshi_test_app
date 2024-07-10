import 'package:equatable/equatable.dart';

import '../../../../core/cubit/kalshi_cubit.dart';
import '../../data/models/financial_health_status.dart';
import '../../domain/usecases/calculate_financial_health.dart';

part 'financial_health_state.dart';

/// This class is the Business Logic Component for FinancialHealthCubit
///
/// It extends Cubit and emits [FinancialHealthCubit]'s to every action
/// performed by the user
class FinancialHealthCubit extends KalshiCubit<FinancialHealthState> {
  /// Provide a [FinancialHealthCubit] instance
  FinancialHealthCubit({required this.calculateFinancialHealth})
      : super(const FinancialInitial());

  final CalculateFinancialHealth calculateFinancialHealth;

  /// Action to CalculateFinancialWellness
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

  /// Reload the current state to initial state
  void reload() => emit(const FinancialInitial());
}
