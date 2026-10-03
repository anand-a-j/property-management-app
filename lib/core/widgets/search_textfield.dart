import 'dart:async';

import 'package:flutter/material.dart';
import 'package:naseem/core/core.dart';

import '../extension/common.dart';

class SearchTextField extends StatefulWidget {
  const SearchTextField({
    super.key,
    this.onChanged,
    required this.title,
    this.debounceDuration = const Duration(milliseconds: 400),
  });

  final void Function(String)? onChanged;
  final String title;
  final Duration debounceDuration;

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  Timer? _debounce;

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  void _onChanged(String value) {
    _debounce?.cancel();

    _debounce = Timer(widget.debounceDuration, () {
      widget.onChanged?.call(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppHorizontalPadding(
      child: TextField(
        onChanged: _onChanged,

        decoration: InputDecoration(
          filled: true,
          hintText: widget.title,
          hintStyle: context.bodyMedium?.copyWith(
            color: context.secondaryContainer,
          ),
          prefixIcon: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Icon(Icons.search),
          ),
          fillColor: context.onPrimary,
          border: _outlineInputBorder(context),
          enabledBorder: _outlineInputBorder(context),
          focusedBorder: _outlineInputBorder(context, isActive: true),
        ),
      ),
    );
  }

  OutlineInputBorder _outlineInputBorder(
    BuildContext context, {
    bool isActive = false,
  }) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide(
        width: 1,
        color: isActive ? context.secondary : context.secondaryContainer,
      ),
    );
  }
}
