import 'package:flutter/widgets.dart';

void dismissKeyboard() {
  FocusManager.instance.primaryFocus?.unfocus();
}
