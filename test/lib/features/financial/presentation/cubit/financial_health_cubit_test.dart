import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kalshi_test_app/features/financial/data/models/financial_health_status.dart';
import 'package:kalshi_test_app/features/financial/presentation/cubit/financial_health_cubit.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks/financial_mocks.dart';

void main() {
  late FinancialHealthCubit financialHealthCubit;
  late MockCalculateFinancialHealth mockCalculateFinancialHealth;

  setUp(() {
    mockCalculateFinancialHealth = MockCalculateFinancialHealth();
    financialHealthCubit = FinancialHealthCubit(
        calculateFinancialHealth: mockCalculateFinancialHealth);
  });

  tearDown(() {
    financialHealthCubit.close();
  });

  group('FinancialHealthCubit', () {
    const double annualIncome = 100000;
    const double monthlyCosts = 2000;
    const FinancialHealthStatus financialHealthStatus =
        FinancialHealthStatus.healthy;

    blocTest<FinancialHealthCubit, FinancialHealthState>(
      'emits [FinancialLoading, FinancialReady] when calculateFinancialWellness is called',
      build: () {
        when(() => mockCalculateFinancialHealth(annualIncome, monthlyCosts))
            .thenReturn(financialHealthStatus);
        return financialHealthCubit;
      },
      act: (cubit) => cubit.calculateFinancialWellness(
        annualIncome: annualIncome,
        montlyCosts: monthlyCosts,
      ),
      expect: () => [
        const FinancialLoading(),
        const FinancialReady(financialHealthStatus: financialHealthStatus),
      ],
    );
  });
}
