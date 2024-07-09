import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/app_colors.dart';

class StyledTextFormField extends StatelessWidget {
  final String? labelText;
  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? formatters;
  final TextInputType keyboardType;
  final bool enabled;
  final TextEditingController? controller;
  final String? initialValue;
  final TextCapitalization capitalization;
  final TextInputAction textInputAction;
  final FloatingLabelBehavior floatingLabelBehavior;
  final bool isNumber;
  final VoidCallback? onTap;
  final Function(String)? onChanged;
  final FocusNode? focusNode;
  final String? hintText;
  final int maxLines;
  final Widget? prefixIcon;
  final ValueChanged<String>? onFieldSubmitted;
  final TextStyle? hintStyle;
  final bool borderError;
  final bool autocorrect;
  final bool autofocus;
  final bool enableSuggestions;
  final Iterable<String>? autofillHints;
  final EdgeInsets contentPadding;
  final int? maxLength;
  final int decimalNumbers;
  final Color? fillColor;
  final Color? colorLabel;
  final Color? disableBorderColor;
  final Color? enableBorderColor;
  final Color? focusedBorderColor;
  final Color? errorBorderColor;
  final Color? textColor;
  final bool obscureText;
  final Widget? suffixIcon;
  final Color? cursorColor;
  final Widget? label;

  const StyledTextFormField({
    super.key,
    this.labelText,
    this.validator,
    this.formatters,
    this.keyboardType = TextInputType.text,
    this.enabled = true,
    this.controller,
    this.initialValue,
    this.capitalization = TextCapitalization.none,
    this.textInputAction = TextInputAction.done,
    this.floatingLabelBehavior = FloatingLabelBehavior.auto,
    this.isNumber = false,
    this.onTap,
    this.onChanged,
    this.focusNode,
    this.hintText,
    this.maxLines = 1,
    this.prefixIcon,
    this.onFieldSubmitted,
    this.hintStyle,
    this.borderError = true,
    this.autocorrect = true,
    this.enableSuggestions = true,
    this.autofocus = false,
    this.autofillHints,
    this.contentPadding = const EdgeInsets.all(16),
    this.maxLength,
    this.decimalNumbers = 0,
    this.fillColor,
    this.colorLabel,
    this.enableBorderColor,
    this.disableBorderColor,
    this.focusedBorderColor,
    this.errorBorderColor,
    this.textColor,
    this.obscureText = false,
    this.suffixIcon,
    this.cursorColor,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    if (initialValue != null && controller != null) {
      controller!.text = initialValue!;
    }

    return TextFormField(
      autofillHints: autofillHints,
      autofocus: autofocus,
      autocorrect: autocorrect,
      enableSuggestions: enableSuggestions,
      decoration: InputDecoration(
        contentPadding: contentPadding,
        floatingLabelBehavior: floatingLabelBehavior,
        labelText: labelText,
        fillColor: fillColor ?? AppColors.lightest,
        errorStyle: const TextStyle(color: Colors.red),
        filled: true,
        hintStyle: hintStyle ?? const TextStyle(fontSize: 16),
        alignLabelWithHint: true,
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        labelStyle: TextStyle(
          fontFamily: 'Rubik',
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: colorLabel,
        ),
        label: label,
        disabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(
              color: disableBorderColor != null
                  ? disableBorderColor!
                  : Colors.transparent),
        ),
        border: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(
              color: enableBorderColor != null
                  ? enableBorderColor!
                  : Colors.transparent),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(
              color: enableBorderColor != null
                  ? enableBorderColor!
                  : Colors.transparent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(
              color: focusedBorderColor != null
                  ? focusedBorderColor!
                  : Colors.transparent),
        ),
        errorBorder: borderError
            ? const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide(color: Colors.red),
              )
            : null,
        focusedErrorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(color: Colors.red),
        ),
      ),
      cursorColor: cursorColor ?? Colors.grey,
      keyboardType: keyboardType,
      inputFormatters: formatters,
      validator: validator,
      enabled: enabled,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      style: TextStyle(
        fontFamily: 'Rubik',
        fontSize: 24,
        fontWeight: FontWeight.w500,
        color: textColor,
      ),
      controller: controller,
      initialValue: controller == null ? initialValue : null,
      textCapitalization: capitalization,
      textInputAction: textInputAction,
      textAlignVertical: TextAlignVertical.center,
      onTap: onTap,
      onChanged: onChanged,
      focusNode: focusNode,
      maxLines: maxLines,
      maxLength: maxLength,
      onFieldSubmitted: onFieldSubmitted,
      buildCounter: (context,
              {required currentLength, maxLength, required isFocused}) =>
          null,
      obscureText: obscureText,
    );
  }
}
