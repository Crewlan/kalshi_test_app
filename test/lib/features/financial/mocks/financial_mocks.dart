import 'package:kalshi_test_app/features/financial/domain/repositories/financial_repository.dart';
import 'package:kalshi_test_app/features/financial/domain/usecases/calculate_financial_health.dart';
import 'package:kalshi_test_app/features/financial/presentation/cubit/financial_health_cubit.dart';
import 'package:mocktail/mocktail.dart';

class MockCalculateFinancialHealth extends Mock
    implements CalculateFinancialHealth {}

class MockFinancialRepository extends Mock implements FinancialRepository {}

class MockFinancialHealthCubit extends Mock implements FinancialHealthCubit {}
