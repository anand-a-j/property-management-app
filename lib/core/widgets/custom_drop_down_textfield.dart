import 'package:flutter/material.dart';
import 'package:naseem/core/extension/common.dart';

typedef DropdownItemLabel<T> = String Function(T item);

/// A reusable, searchable dropdown field for any data type [T].
///
/// Differences from a plain `Autocomplete`:
/// - The full [items] list is shown the instant the field is focused,
///   even if it already has prefilled text (dropdown-style, not just
///   filter-as-you-type).
/// - If a typed query matches nothing, the popup falls back to showing
///   every item instead of going empty.
/// - Losing focus without picking a matching option snaps the field's
///   text back to the last valid selection, so the label shown never
///   disagrees with the value actually selected.
class CustomDropdownField<T extends Object> extends StatefulWidget {
  const CustomDropdownField({
    super.key,
    required this.items,
    required this.labelText,
    required this.hintText,
    required this.itemLabel,
    this.initialValue,
    this.enabled = true,
    this.readOnly = false,
    this.validator,
    this.onChanged,
    this.hideErrorText = false,
    this.textInputType,
  });

  final List<T> items;

  final String labelText;
  final String hintText;

  /// Converts the item into the text displayed in the field and list.
  final DropdownItemLabel<T> itemLabel;

  /// Optional initially selected item.
  final T? initialValue;

  final bool enabled;
  final bool readOnly;

  final String? Function(String?)? validator;

  /// Called with the newly selected item.
  final void Function(T?)? onChanged;

  final bool hideErrorText;
  final TextInputType? textInputType;

  @override
  State<CustomDropdownField<T>> createState() => _CustomDropdownFieldState<T>();
}

class _CustomDropdownFieldState<T extends Object>
    extends State<CustomDropdownField<T>> {
  late final TextEditingController _controller;
  late final FocusNode _focusNode;
  final LayerLink _layerLink = LayerLink();
  final OverlayPortalController _overlayController = OverlayPortalController();
  final Object _tapRegionGroupId = Object();

  T? _selectedItem;
  List<T> _visibleOptions = const [];
  bool _isOpen = false;

  @override
  void initState() {
    super.initState();
    _selectedItem = widget.initialValue;
    _controller = TextEditingController(text: _labelFor(_selectedItem));
    _focusNode = FocusNode();
    _visibleOptions = widget.items;

    _focusNode.addListener(_handleFocusChange);
    _controller.addListener(_handleTextChange);
  }

  @override
  void didUpdateWidget(covariant CustomDropdownField<T> oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Only resync from outside while the user isn't actively editing,
    // so we never yank the field out from under them mid-interaction.
    if (!_focusNode.hasFocus) {
      if (widget.items != oldWidget.items) {
        _visibleOptions = widget.items;
      }
      if (widget.initialValue != oldWidget.initialValue) {
        _selectedItem = widget.initialValue;
        _controller.text = _labelFor(_selectedItem);
      }
    }
  }

  @override
  void dispose() {
    _focusNode.removeListener(_handleFocusChange);
    _controller.removeListener(_handleTextChange);
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  String _labelFor(T? item) => item == null ? '' : widget.itemLabel(item);

  void _openOverlay() {
    if (_isOpen) return;
    setState(() {
      _isOpen = true;
      _visibleOptions = widget.items;
    });
    _overlayController.show();
  }

  void _closeOverlay() {
    if (!_isOpen) return;
    setState(() => _isOpen = false);
    _overlayController.hide();
  }

  void _handleFocusChange() {
    if (_focusNode.hasFocus) {
      // Show every option the instant the field is focused - before
      // the user has typed anything.
      _openOverlay();
      return;
    }

    _closeOverlay();

    // If focus was lost without a matching selection, don't leave
    // stray typed text behind.
    if (_controller.text != _labelFor(_selectedItem)) {
      _controller.text = _labelFor(_selectedItem);
    }
  }

  void _handleTextChange() {
    if (!_focusNode.hasFocus) return;

    final query = _controller.text.trim().toLowerCase();

    final filtered = query.isEmpty
        ? widget.items
        : widget.items
              .where(
                (item) => widget.itemLabel(item).toLowerCase().contains(query),
              )
              .toList();

    // Never leave the popup empty: fall back to the full list when
    // nothing matches what was typed.
    setState(() {
      _visibleOptions = filtered.isEmpty ? widget.items : filtered;
    });

    if (!_isOpen) _openOverlay();
  }

  void _selectItem(T item) {
    setState(() {
      _selectedItem = item;
      _controller.text = widget.itemLabel(item);
    });
    widget.onChanged?.call(item);
    _closeOverlay();
    _focusNode.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.labelText, style: context.bodySmall),

        const SizedBox(height: 10),

        LayoutBuilder(
          builder: (context, constraints) {
            return TapRegion(
              groupId: _tapRegionGroupId,
              child: CompositedTransformTarget(
                link: _layerLink,
                child: OverlayPortal(
                  controller: _overlayController,
                  overlayChildBuilder: (context) {
                    return _DropdownOptions<T>(
                      groupId: _tapRegionGroupId,
                      layerLink: _layerLink,
                      width: constraints.maxWidth,
                      options: _visibleOptions,
                      itemLabel: widget.itemLabel,
                      selectedItem: _selectedItem,
                      onSelected: _selectItem,
                      highlightColor: context.onPrimary,
                    );
                  },
                  child: TextFormField(
                    controller: _controller,
                    focusNode: _focusNode,
                    enabled: widget.enabled,
                    readOnly: widget.readOnly,
                    keyboardType: widget.textInputType,
                    style: context.bodyMedium,
                    validator: widget.validator,
                    onTap: () {
                      if (widget.enabled) _openOverlay();
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: context.onSecondary,

                      contentPadding: const EdgeInsets.fromLTRB(
                        20.0,
                        15.0,
                        20.0,
                        15.0,
                      ),

                      isDense: true,

                      hintText: widget.hintText,

                      hintStyle: context.bodyMedium?.copyWith(
                        color: context.onPrimary.withValues(alpha: 0.5),
                        fontWeight: FontWeight.w300,
                      ),

                      suffixIcon: Padding(
                        padding: const EdgeInsetsDirectional.symmetric(
                          horizontal: 15,
                        ),
                        child: AnimatedRotation(
                          turns: _isOpen ? 0.5 : 0,
                          duration: const Duration(milliseconds: 150),
                          child: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: context.onPrimary,
                          ),
                        ),
                      ),

                      suffixIconConstraints: const BoxConstraints(
                        maxHeight: 30,
                      ),

                      errorStyle: widget.hideErrorText
                          ? const TextStyle(fontSize: 0.01)
                          : TextStyle(
                              fontSize: 10,
                              color: context.error,
                              fontWeight: FontWeight.w300,
                            ),

                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: context.onSecondaryContainer,
                          width: 1.2,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),

                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: context.onSecondaryContainer,
                          width: 1.2,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),

                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: context.onPrimary,
                          width: 1.2,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),

                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: context.error,
                          width: 1.2,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

class _DropdownOptions<T extends Object> extends StatelessWidget {
  const _DropdownOptions({
    required this.groupId,
    required this.layerLink,
    required this.width,
    required this.options,
    required this.itemLabel,
    required this.selectedItem,
    required this.onSelected,
    required this.highlightColor,
  });

  final Object groupId;
  final LayerLink layerLink;
  final double width;
  final List<T> options;
  final DropdownItemLabel<T> itemLabel;
  final T? selectedItem;
  final ValueChanged<T> onSelected;
  final Color highlightColor;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      width: width,
      child: CompositedTransformFollower(
        link: layerLink,
        showWhenUnlinked: false,
        targetAnchor: Alignment.bottomLeft,
        followerAnchor: Alignment.topLeft,
        child: TapRegion(
          groupId: groupId,
          child: Padding(
            padding: const EdgeInsets.only(top: 6),
            child: Material(
              elevation: 4,
              borderRadius: BorderRadius.circular(10),
              clipBehavior: Clip.antiAlias,
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxHeight: 250),
                child: options.isEmpty
                    ? const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 14,
                        ),
                        child: Text('No options available'),
                      )
                    : ListView.separated(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        shrinkWrap: true,
                        itemCount: options.length,
                        separatorBuilder: (_, _) => const Divider(height: 1),
                        itemBuilder: (context, index) {
                          final item = options[index];
                          final isSelected = item == selectedItem;

                          return InkWell(
                            onTap: () => onSelected(item),
                            child: Container(
                              color: isSelected
                                  ? highlightColor.withValues(alpha: 0.08)
                                  : null,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 14,
                              ),
                              child: Text(itemLabel(item)),
                            ),
                          );
                        },
                      ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
