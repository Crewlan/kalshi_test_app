import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'core/routes/router.dart';
import 'core/routes/routes.dart';
import 'core/utils/app_colors.dart';
import 'core/utils/app_strings.dart';

/// This class extends StatefulWidget
///
/// It build a application and set a configurations
class KalshiApp extends StatelessWidget {
  KalshiApp({super.key});

  final _router = AppRouter();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return MaterialApp(
      title: AppStrings.title,
      themeMode: ThemeMode.light,
      onGenerateRoute: _router.generateRoutes,
      initialRoute: Routes.financialHealth,
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context)
              .copyWith(textScaler: const TextScaler.linear(1.0)),
          child: child!,
        );
      },
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.backgroundColor,
      ),
      navigatorObservers: [
        HeroController(),
      ],
    );
  }
}
