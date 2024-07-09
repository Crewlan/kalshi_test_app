import '../../data/models/financial_health_status.dart';

abstract class FinancialRepository {
  FinancialHealthStatus calculateFinancialHealth(
    double annualGrossIncome,
    double monthlyCosts,
  );
}
