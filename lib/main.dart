import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'injection_container.dart' as di;
import 'kalshi_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  EquatableConfig.stringify = true;
  await di.init();
  runApp(KalshiApp());
}
