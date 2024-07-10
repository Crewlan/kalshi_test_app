import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:kalshi_test_app/features/financial/data/repositories/financial_repository_impl.dart';
import 'package:kalshi_test_app/features/financial/domain/repositories/financial_repository.dart';
import 'package:kalshi_test_app/features/financial/domain/usecases/calculate_financial_health.dart';
import 'package:kalshi_test_app/features/financial/presentation/cubit/financial_health_cubit.dart';
import 'package:kalshi_test_app/injection_container.dart';

void main() {
  setUpAll(() async {
    await init();
  });

  tearDownAll(() {
    GetIt.instance.reset();
  });

  test('should register all dependencies', () async {
    // Verify FinancialRepository is registered correctly
    final financialRepository = sl<FinancialRepository>();
    expect(financialRepository, isA<FinancialRepositoryImpl>());

    // Verify CalculateFinancialHealth is registered correctly
    final calculateFinancialHealth = sl<CalculateFinancialHealth>();
    expect(calculateFinancialHealth, isA<CalculateFinancialHealth>());

    // Verify FinancialHealthCubit is registered correctly
    final financialHealthCubit = sl<FinancialHealthCubit>();
    expect(financialHealthCubit, isA<FinancialHealthCubit>());
  });
}
