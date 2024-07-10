import '../../domain/repositories/financial_repository.dart';
import '../models/financial_health_status.dart';

/// Class to calculate and return a enum based on math calculation
class FinancialRepositoryImpl implements FinancialRepository {
  @override
  FinancialHealthStatus calculateFinancialHealth(
    double annualGrossIncome,
    double monthlyCosts,
  ) {
    double annualNetIncome = annualGrossIncome - (annualGrossIncome * 0.08);
    double annualCosts = monthlyCosts * 12;
    double costsPercentage = (annualCosts / annualNetIncome) * 100;

    if (costsPercentage <= 25) {
      return FinancialHealthStatus.healthy;
    } else if (costsPercentage <= 75) {
      return FinancialHealthStatus.medium;
    } else {
      return FinancialHealthStatus.low;
    }
  }
}
