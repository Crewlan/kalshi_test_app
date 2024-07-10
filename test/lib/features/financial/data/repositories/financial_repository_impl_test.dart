import 'package:flutter_test/flutter_test.dart';
import 'package:kalshi_test_app/features/financial/data/models/financial_health_status.dart';
import 'package:kalshi_test_app/features/financial/data/repositories/financial_repository_impl.dart';

void main() {
  late FinancialRepositoryImpl repository;

  setUp(() {
    repository = FinancialRepositoryImpl();
  });
  group('FinancialRepositoryImpl', () {
    test(
        'should return FinancialHealthStatus.healthy when costsPercentage is less than or equal to 25%',
        () {
      // Arrange
      double annualGrossIncome = 1000;
      double monthlyCosts = 10;

      // Act
      final result =
          repository.calculateFinancialHealth(annualGrossIncome, monthlyCosts);

      // Assert
      expect(result, FinancialHealthStatus.healthy);
    });

    test(
        'should return FinancialHealthStatus.medium when costsPercentage is between 25% and 75%',
        () {
      // Arrange
      double annualGrossIncome = 100000;
      double monthlyCosts = 4000;

      // Act
      final result =
          repository.calculateFinancialHealth(annualGrossIncome, monthlyCosts);

      // Assert
      expect(result, FinancialHealthStatus.medium);
    });

    test(
        'should return FinancialHealthStatus.low when costsPercentage is greater than 75%',
        () {
      // Arrange
      double annualGrossIncome = 100000;
      double monthlyCosts = 9000;

      // Act
      final result =
          repository.calculateFinancialHealth(annualGrossIncome, monthlyCosts);

      // Assert
      expect(result, FinancialHealthStatus.low);
    });

    test('should handle edge case where costsPercentage is exactly 25%', () {
      // Arrange
      double annualGrossIncome =
          96000; // 96000 * 0.08 = 7680 -> 96000 - 7680 = 88320 (annual net income)
      double monthlyCosts =
          1840; // 1840 * 12 = 22080 -> 22080 / 88320 * 100 = 25%

      // Act
      final result =
          repository.calculateFinancialHealth(annualGrossIncome, monthlyCosts);

      // Assert
      expect(result, FinancialHealthStatus.healthy);
    });

    test('should handle edge case where costsPercentage is exactly 75%', () {
      // Arrange
      double annualGrossIncome =
          100000; // 100000 * 0.08 = 8000 -> 100000 - 8000 = 92000 (annual net income)
      double monthlyCosts =
          5750; // 5750 * 12 = 69000 -> 69000 / 92000 * 100 = 75%

      // Act
      final result =
          repository.calculateFinancialHealth(annualGrossIncome, monthlyCosts);

      // Assert
      expect(result, FinancialHealthStatus.medium);
    });
  });
}
