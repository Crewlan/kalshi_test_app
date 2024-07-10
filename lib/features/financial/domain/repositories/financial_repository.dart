import '../../data/models/financial_health_status.dart';

/// This class is a domain repository
abstract class FinancialRepository {
  /// This call perform a calculation financial health status
  FinancialHealthStatus calculateFinancialHealth(
    double annualGrossIncome,
    double monthlyCosts,
  );
}
