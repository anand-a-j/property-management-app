import 'dart:io';

import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../extension/common.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.controller,
    this.initialValue,
    this.enabled = true,
    this.readOnly = false,
    required this.hintText,
    required this.labelText,
    this.textInputType,
    this.obscureText,
    this.maxLines,
    this.maxLength,
    this.validator,
    this.onChanged,
    this.prefix,
    this.suffix,
    this.suffixIcon,
    this.onTap,
  }) : super(key: key);

  final TextEditingController? controller;
  final String hintText;
  final String labelText;
  final TextInputType? textInputType;
  final bool? obscureText;
  final bool? readOnly;
  final String? initialValue;
  final int? maxLines;
  final int? maxLength;
  final bool enabled;
  final Widget? prefix;
  final Widget? suffix;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      initialValue: controller == null ? initialValue : null,
      enabled: enabled,
      readOnly: readOnly ?? false,
      keyboardType: textInputType == TextInputType.phone
          ? Platform.isIOS
              ? TextInputType.numberWithOptions(signed: true)
              : TextInputType.phone
          : textInputType,
      obscureText: obscureText ?? false,
      maxLines: maxLines ?? 1,
      maxLength: maxLength,
      validator: validator,
      onChanged: (value) {
        if (onChanged != null) {
          onChanged!(value);
        }
      },
      onTap: onTap,
      style: context.bodyMedium,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(
          top: 16,
          bottom: 16,
          left: 15,
          right: 15,
        ),
        isDense: true,
        hintText: hintText,
        labelText: labelText,
        labelStyle: context.bodyMedium?.copyWith(
          color: context.secondaryContainer,
        ),
        floatingLabelStyle: context.bodySmall?.copyWith(
          fontSize: 13,
          color: context.secondary.withValues(

            alpha: 0.5,
          ),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        alignLabelWithHint: true,
        hintStyle: context.bodyMedium?.copyWith(
          color: context.secondaryContainer,
        ),
        prefix: prefix,
        suffix: suffix,
        suffixIcon: suffixIcon,
        suffixIconConstraints: const BoxConstraints(maxHeight: 16),
        border: _inputBorder(context),
        enabledBorder: _inputBorder(context),
        focusedBorder: _inputBorder(context),
        errorBorder: _inputBorder(context, true),
        disabledBorder: _inputBorder(context),
        focusedErrorBorder: _inputBorder(context),
        errorStyle: TextStyle(
          height: 1,
          fontSize: 12,
          color: context.error,
        ),
      ),
    );
  }
}

OutlineInputBorder _inputBorder(BuildContext context, [bool isError = false]) {
  return OutlineInputBorder(
    borderSide: BorderSide(
      width: isError ? 0.8 : 0.5,
      color: isError ? context.error : context.secondaryContainer,
    ),
    borderRadius: BorderRadius.circular(
      AppConsts.rSmall,
    ),
  );
}
