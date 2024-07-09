part of 'financial_cubit.dart';

enum FinancialStatus { initial, loading, ready }

abstract class FinancialHealthState extends Equatable {
  final FinancialStatus status;
  const FinancialHealthState({required this.status});

  @override
  List<Object> get props => [];
}

class FinancialInitial extends FinancialHealthState {
  const FinancialInitial({required super.status});
}

class FinancialLoading extends FinancialHealthState {
  const FinancialLoading({required super.status});
}

class FinancialReady extends FinancialHealthState {
  final FinancialHealthStatus financialHealthStatus;

  const FinancialReady({
    required this.financialHealthStatus,
    required super.status,
  });
}
