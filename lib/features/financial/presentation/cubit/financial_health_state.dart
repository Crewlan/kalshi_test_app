part of 'financial_health_cubit.dart';

enum FinancialStatus { initial, loading, ready }

abstract class FinancialHealthState extends Equatable {
  const FinancialHealthState();

  @override
  List<Object> get props => [];
}

class FinancialInitial extends FinancialHealthState {
  const FinancialInitial();
}

class FinancialLoading extends FinancialHealthState {
  const FinancialLoading();
}

class FinancialReady extends FinancialHealthState {
  final FinancialHealthStatus financialHealthStatus;

  const FinancialReady({
    required this.financialHealthStatus,
  });
}

class FinancialValid extends FinancialHealthState {
  const FinancialValid();
}

class FinancialError extends FinancialHealthState {
  final String message;
  const FinancialError({required this.message});
}
