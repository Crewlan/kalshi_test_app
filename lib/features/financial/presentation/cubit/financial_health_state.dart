part of 'financial_health_cubit.dart';

/// This class models [ChangeCreditCardCubit] states
abstract class FinancialHealthState extends Equatable {
  const FinancialHealthState();

  @override
  List<Object> get props => [];
}

/// This class models [FinancialHealthState] initial state
class FinancialInitial extends FinancialHealthState {
  const FinancialInitial();
}

/// This class models [FinancialHealthState] loading state
class FinancialLoading extends FinancialHealthState {
  const FinancialLoading();
}

/// This class models [FinancialHealthState] ready state
class FinancialReady extends FinancialHealthState {
  /// The FinancialHealthStatus fetched
  final FinancialHealthStatus financialHealthStatus;

  /// Takes [FinancialHealthStatus] to construct this state
  const FinancialReady({
    required this.financialHealthStatus,
  });
}
