import 'package:flutter/material.dart';

import '../extensions/ui_helper_extension.dart';
import '../utils/app_colors.dart';

class StyledButton extends StatelessWidget {
  final String? text;
  final Function? action;
  final bool enabled;
  final bool usesInfinityWidth;
  final bool wrapContentWidth;
  final Color textColor;
  final Color backgroundColor;
  final Color outlineColor;
  final double fontSize;
  final double borderRadius;
  final TextAlign? textAlign;
  final TextStyle? textStyle;
  final Color? shadowColor;

  const StyledButton({
    super.key,
    this.text,
    this.action,
    this.enabled = true,
    this.usesInfinityWidth = false,
    this.textColor = AppColors.lightest,
    this.backgroundColor = AppColors.blue,
    this.outlineColor = Colors.transparent,
    this.wrapContentWidth = false,
    this.fontSize = 16,
    this.borderRadius = 32,
    this.textAlign,
    this.textStyle,
    this.shadowColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: shadowColor != null
                ? shadowColor!.withOpacity(0.24)
                : Colors.transparent,
            offset: const Offset(0, 10),
            blurRadius: 30,
            spreadRadius: 0,
          )
        ],
      ),
      height: 60,
      width: wrapContentWidth
          ? null
          : usesInfinityWidth
              ? double.infinity
              : context.height * 1 - 64,
      child: TextButton(
        onPressed: _buttonAction() as void Function()?,
        style: TextButton.styleFrom(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(borderRadius))),
          side: BorderSide(color: outlineColor, width: 2),
          foregroundColor: textColor,
          backgroundColor:
              _buttonAction() != null ? backgroundColor : AppColors.blue,
          textStyle: textStyle ??
              TextStyle(
                fontFamily: 'Worksans',
                color: enabled ? textColor : AppColors.lightest,
                fontSize: fontSize,
                fontWeight: FontWeight.w500,
              ),
        ),
        child: Text(
          text ?? '',
          textAlign: textAlign,
        ),
      ),
    );
  }

  Function? _buttonAction() {
    return enabled ? action : null;
  }
}
