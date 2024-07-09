import 'package:get_it/get_it.dart';

import 'features/financial/data/repositories/financial_repository_impl.dart';
import 'features/financial/domain/repositories/financial_repository.dart';
import 'features/financial/domain/usecases/calculate_financial_health.dart';
import 'features/financial/presentation/cubit/financial_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerLazySingleton<FinancialRepository>(
    () => FinancialRepositoryImpl(),
  );

  sl.registerLazySingleton(
    () => CalculateFinancialHealth(repository: sl()),
  );

  sl.registerLazySingleton(
    () => FinancialHealthCubit(calculateFinancialHealth: sl()),
  );

  await sl.allReady();
}
