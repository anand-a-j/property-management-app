import 'dart:async';

import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../extension/common.dart';

class AutoCompleteDropdown<T extends Object> extends StatefulWidget {
  const AutoCompleteDropdown({
    super.key,
    required this.controller,
    required this.optionsBuilder,
    required this.focusNode,
    this.displayStringForOption,
    this.debounceDuration = const Duration(milliseconds: 0),
    this.hintText,
    this.labelText,
    this.validator,
    this.onSelected,
    this.onChanged,
    this.maxOptionsHeight = 200.0,
    this.itemBuilder,
    this.emptyBuilder,
    this.suffixIcon,
    this.enabled = true,
    this.readOnly = false,
    this.onTap,
  });

  final TextEditingController controller;
  final FocusNode focusNode;
  final Iterable<T> Function(String text) optionsBuilder;
  final String Function(T option)? displayStringForOption;
  final Duration debounceDuration;
  final String? hintText;
  final String? labelText;
  final String? Function(String?)? validator;
  final void Function(T)? onSelected;
  final void Function(String)? onChanged;
  final double maxOptionsHeight;
  final Widget Function(BuildContext, T)? itemBuilder;
  final WidgetBuilder? emptyBuilder;
  final Widget? suffixIcon;
  final bool enabled;
  final bool readOnly;
  final void Function()? onTap;

  @override
  State<AutoCompleteDropdown<T>> createState() =>
      _AutoCompleteDropdownState<T>();
}

class _AutoCompleteDropdownState<T extends Object>
    extends State<AutoCompleteDropdown<T>> {
  final LayerLink _layerLink = LayerLink();
  final _debouncer = Debouncer();

  OverlayEntry? _overlayEntry;

  Iterable<T> _options = [];

  bool _isOptionSelected = false;

  @override
  void initState() {
    super.initState();
    widget.focusNode.addListener(_handleFocusChange);
    widget.controller.addListener(_handleTextChanged);
  }

  @override
  void dispose() {
    widget.focusNode.removeListener(_handleFocusChange);
    widget.controller.removeListener(_handleTextChanged);
    _debouncer.cancel();
    _removeOverlay();
    super.dispose();
  }

  void _handleFocusChange() {
    if (!widget.focusNode.hasFocus) {
      _removeOverlay();
    } else {
      _updateOptions();
      _showOverlay();
    }
  }

  void _updateOptions() {
    final currentText = widget.controller.text;
    _options = widget.optionsBuilder(currentText);
    if (mounted) setState(() {});
  }

  void _handleTextChanged() {
    if (_isOptionSelected) {
      _isOptionSelected = false;
      return;
    }

    _debouncer.debounce(widget.debounceDuration, () {
      if (!mounted) return;

      _updateOptions();

      if (_options.isNotEmpty && widget.focusNode.hasFocus) {
        _showOverlay();
      } else {
        _removeOverlay();
      }

      widget.onChanged?.call(widget.controller.text);
    });
  }

  void _showOverlay() {
    _removeOverlay();

    final renderBox = context.findRenderObject() as RenderBox?;

    if (renderBox == null) return;

    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        width: renderBox.size.width,
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          offset: Offset(0, renderBox.size.height + 4),
          child: Material(
            elevation: 4,
            borderRadius: BorderRadius.circular(AppConsts.rSmall),
            child: Container(
              constraints: BoxConstraints(maxHeight: widget.maxOptionsHeight),
              child: _buildOptionsList(),
            ),
          ),
        ),
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  Widget _buildOptionsList() {
    if (_options.isEmpty) {
      return widget.emptyBuilder?.call(context) ??
          const Padding(
            padding: EdgeInsets.all(16),
            child: Center(child: Text('No results found')),
          );
    }

    return ListView(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      children: [
        for (final option in _options)
          InkWell(
            onTap: () => _selectOption(option),
            child: widget.itemBuilder?.call(context, option) ??
                ListTile(
                  title: Text(
                    widget.displayStringForOption?.call(option) ??
                        option.toString(),
                  ),
                ),
          ),
      ],
    );
  }

  void _selectOption(T option) {
    _isOptionSelected = true;

    widget.controller.text =
        widget.displayStringForOption?.call(option) ?? option.toString();

    widget.controller.selection =
        TextSelection.collapsed(offset: widget.controller.text.length);

    widget.onSelected?.call(option);

    widget.focusNode.unfocus();

    _removeOverlay();
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: TextFormField(
        controller: widget.controller,
        focusNode: widget.focusNode,
        enabled: widget.enabled,
        readOnly: widget.readOnly,
        validator: widget.validator,
        onTap: widget.onTap,
        enableInteractiveSelection: false,
        onChanged: (value) {
          widget.onChanged?.call(value);
        },
        style: context.bodyMedium,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(
            top: 16,
            bottom: 16,
            left: 15,
            right: 15,
          ),
          isDense: true,
          hintText: widget.hintText,
          labelText: widget.labelText,
          labelStyle: context.bodyMedium?.copyWith(
            color: context.secondaryContainer,
          ),
          floatingLabelStyle: context.bodySmall?.copyWith(
            color: context.secondary.withValues(alpha: 0.5),
          ),
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          alignLabelWithHint: true,
          hintStyle: context.bodyMedium?.copyWith(
            color: context.secondaryContainer,
          ),
          suffixIcon: Padding(
            padding: const EdgeInsetsDirectional.only(
              end: 15,
            ),
            child: widget.suffixIcon ??
               const Icon(Icons.arrow_downward_outlined)
          ),
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
      ),
    );
  }
}

class Debouncer {
  Timer? _timer;

  void debounce(Duration duration, VoidCallback action) {
    _timer?.cancel();
    _timer = Timer(duration, action);
  }

  void cancel() {
    _timer?.cancel();
    _timer = null;
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
