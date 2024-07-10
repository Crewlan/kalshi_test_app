import 'package:flutter/widgets.dart';

/// Function to dismiss Keyboard when click on screen
void dismissKeyboard() {
  FocusManager.instance.primaryFocus?.unfocus();
}
