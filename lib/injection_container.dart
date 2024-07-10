import 'package:get_it/get_it.dart';

import 'features/financial/data/repositories/financial_repository_impl.dart';
import 'features/financial/domain/repositories/financial_repository.dart';
import 'features/financial/domain/usecases/calculate_financial_health.dart';
import 'features/financial/presentation/cubit/financial_health_cubit.dart';

/// Create a GetIt instance
final sl = GetIt.instance;

/// Register dependencies
Future<void> init() async {
  sl.registerLazySingleton<FinancialRepository>(
    () => FinancialRepositoryImpl(),
  );

  sl.registerLazySingleton<CalculateFinancialHealth>(
    () => CalculateFinancialHealth(repository: sl()),
  );

  sl.registerLazySingleton<FinancialHealthCubit>(
    () => FinancialHealthCubit(calculateFinancialHealth: sl()),
  );

  await sl.allReady();
}
