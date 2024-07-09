import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kalshi_test_app/core/routes/routes.dart';

class AppRouter {
  Route generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case Routes.calculator:
      case Routes.results:
      default:
        return CupertinoPageRoute(
          settings: const RouteSettings(name: 'error_default'),
          builder: (context) => const Scaffold(
            body: Center(
              child: Text('Error'),
            ),
          ),
        );
    }
  }
}
