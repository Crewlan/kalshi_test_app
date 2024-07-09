import 'package:flutter_test/flutter_test.dart';
import 'package:kalshi_test_app/features/financial/data/models/financial_health_status.dart';
import 'package:kalshi_test_app/features/financial/domain/usecases/calculate_financial_health.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks/financial_mocks.dart';

void main() {
  late CalculateFinancialHealth usecase;
  late MockFinancialRepository mockFinancialRepository;

  setUp(() {
    mockFinancialRepository = MockFinancialRepository();
    usecase = CalculateFinancialHealth(repository: mockFinancialRepository);
  });

  group('CalculateFinancialHealth', () {
    const double annualGrossIncome = 100000;
    const double monthlyCosts = 2000;
    const FinancialHealthStatus expectedStatus = FinancialHealthStatus.healthy;

    test('should return FinancialHealthStatus from the repository', () {
      // Arrange
      when(() => mockFinancialRepository.calculateFinancialHealth(
          annualGrossIncome, monthlyCosts)).thenReturn(expectedStatus);

      // Act
      final result = usecase(annualGrossIncome, monthlyCosts);

      // Assert
      expect(result, expectedStatus);
      verify(() => mockFinancialRepository.calculateFinancialHealth(
          annualGrossIncome, monthlyCosts)).called(1);
      verifyNoMoreInteractions(mockFinancialRepository);
    });
  });
}
