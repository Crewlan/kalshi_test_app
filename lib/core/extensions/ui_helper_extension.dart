import 'package:flutter/material.dart';

/// Extension to get height and width based on BuildContext
extension LayoutHelperBuildContextExtension on BuildContext {
  /// Getter of media query
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  /// Getter of Size
  Size get size => mediaQuery.size;

  /// Getter of width
  double get width => size.width;

  /// Getter of height
  double get height => size.height;
}
