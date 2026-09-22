import 'package:flutter/material.dart';

import '../extension/common.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key, this.onChanged});

  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        filled: true,
        hintText: "Search products",
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
    );
  }

  OutlineInputBorder _outlineInputBorder(
    BuildContext context, {
    bool isActive = false,
  }) => OutlineInputBorder(
    borderRadius: BorderRadius.circular(5),
    borderSide: BorderSide(
      width: 1,
      color: isActive ? context.secondary : context.secondaryContainer,
    ),
  );
}
