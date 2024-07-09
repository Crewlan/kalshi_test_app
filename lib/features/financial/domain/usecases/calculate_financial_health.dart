import '../../data/models/financial_health_status.dart';
import '../repositories/financial_repository.dart';

class CalculateFinancialHealth {
  final FinancialRepository repository;

  CalculateFinancialHealth({required this.repository});

  FinancialHealthStatus call(double annualGrossIncome, double monthlyCosts) {
    return repository.calculateFinancialHealth(annualGrossIncome, monthlyCosts);
  }
}
