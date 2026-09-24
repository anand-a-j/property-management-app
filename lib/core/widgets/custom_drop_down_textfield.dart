// import 'package:flutter/material.dart';
// import 'package:naseem/core/extension/common.dart';

// typedef DropdownItemLabel<T> = String Function(T item);

// class CustomDropdownField<T> extends StatefulWidget {
//   const CustomDropdownField({
//     super.key,
//     required this.items,
//     required this.labelText,
//     required this.hintText,
//     required this.itemLabel,
//     this.initialValue,
//     this.enabled = true,
//     this.readOnly = false,
//     this.validator,
//     this.onChanged,
//     this.hideErrorText = false,
//     this.textInputType,
//   });

//   final List<T> items;

//   final String labelText;
//   final String hintText;

//   /// Converts the item into the text displayed in the field.
//   final DropdownItemLabel<T> itemLabel;

//   /// Optional initially selected item.
//   final T? initialValue;

//   final bool enabled;
//   final bool readOnly;

//   final String? Function(String?)? validator;

//   /// Returns the selected item.
//   final void Function(T?)? onChanged;

//   final bool hideErrorText;
//   final TextInputType? textInputType;

//   @override
//   State<CustomDropdownField<T>> createState() => _CustomDropdownFieldState<T>();
// }

// class _CustomDropdownFieldState<T> extends State<CustomDropdownField<T>> {
//   T? _selectedItem;

//   @override
//   void initState() {
//     super.initState();

//     _selectedItem = widget.initialValue;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(widget.labelText, style: context.bodySmall),

//         const SizedBox(height: 10),

//         Autocomplete<T>(
//           initialValue: TextEditingValue(
//             text: widget.initialValue != null
//                 ? widget.itemLabel(widget.initialValue as T)
//                 : '',
//           ),

//           displayStringForOption: widget.itemLabel,

//           optionsBuilder: (TextEditingValue textEditingValue) {
//             final query = textEditingValue.text.trim().toLowerCase();

//             // Show all available items when there is
//             // no search text.
//             if (query.isEmpty) {
//               return widget.items;
//             }

//             // Filter items based on the displayed label.
//             return widget.items.where((item) {
//               return widget.itemLabel(item).toLowerCase().contains(query);
//             });
//           },

//           onSelected: (T item) {
//             setState(() {
//               _selectedItem = item;
//             });

//             widget.onChanged?.call(item);
//           },

//           fieldViewBuilder:
//               (
//                 BuildContext context,
//                 TextEditingController textEditingController,
//                 FocusNode focusNode,
//                 VoidCallback onFieldSubmitted,
//               ) {
//                 return TextFormField(
//                   controller: textEditingController,
//                   focusNode: focusNode,
//                   enabled: widget.enabled,
//                   readOnly: widget.readOnly,
//                   keyboardType: widget.textInputType,
//                   style: context.bodyMedium,
//                   validator: widget.validator,
//                   decoration: InputDecoration(
//                     filled: true,
//                     fillColor: context.onSecondary,

//                     contentPadding: const EdgeInsets.fromLTRB(
//                       20.0,
//                       15.0,
//                       20.0,
//                       15.0,
//                     ),

//                     isDense: true,

//                     hintText: widget.hintText,

//                     hintStyle: context.bodyMedium?.copyWith(
//                       color: context.onPrimary.withValues(alpha: 0.5),
//                       fontWeight: FontWeight.w300,
//                     ),

//                     suffixIcon: Padding(
//                       padding: const EdgeInsetsDirectional.symmetric(
//                         horizontal: 15,
//                       ),
//                       child: Icon(
//                         Icons.keyboard_arrow_down_rounded,
//                         color: context.onPrimary,
//                       ),
//                     ),

//                     suffixIconConstraints: const BoxConstraints(maxHeight: 30),

//                     errorStyle: widget.hideErrorText
//                         ? const TextStyle(fontSize: 0.01)
//                         : TextStyle(
//                             fontSize: 10,
//                             color: context.error,
//                             fontWeight: FontWeight.w300,
//                           ),

//                     border: OutlineInputBorder(
//                       borderSide: BorderSide(
//                         color: context.onSecondaryContainer,
//                         width: 1.2,
//                       ),
//                       borderRadius: BorderRadius.circular(10),
//                     ),

//                     enabledBorder: OutlineInputBorder(
//                       borderSide: BorderSide(
//                         color: context.onSecondaryContainer,
//                         width: 1.2,
//                       ),
//                       borderRadius: BorderRadius.circular(10),
//                     ),

//                     focusedBorder: OutlineInputBorder(
//                       borderSide: BorderSide(
//                         color: context.onPrimary,
//                         width: 1.2,
//                       ),
//                       borderRadius: BorderRadius.circular(10),
//                     ),

//                     errorBorder: OutlineInputBorder(
//                       borderSide: BorderSide(color: context.error, width: 1.2),
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//                 );
//               },

//           optionsViewBuilder:
//               (
//                 BuildContext context,
//                 AutocompleteOnSelected<T> onSelected,
//                 Iterable<T> options,
//               ) {
//                 return Align(
//                   alignment: Alignment.topLeft,
//                   child: Material(
//                     elevation: 4,
//                     borderRadius: BorderRadius.circular(10),
//                     clipBehavior: Clip.antiAlias,
//                     child: ConstrainedBox(
//                       constraints: const BoxConstraints(maxHeight: 250),
//                       child: ListView.separated(
//                         padding: const EdgeInsets.symmetric(vertical: 8),
//                         shrinkWrap: true,
//                         itemCount: options.length,
//                         separatorBuilder: (_, __) {
//                           return const Divider(height: 1);
//                         },
//                         itemBuilder: (context, index) {
//                           final item = options.elementAt(index);

//                           return InkWell(
//                             onTap: () {
//                               onSelected(item);
//                             },
//                             child: Padding(
//                               padding: const EdgeInsets.symmetric(
//                                 horizontal: 20,
//                                 vertical: 14,
//                               ),
//                               child: Text(
//                                 widget.itemLabel(item),
//                                 style: context.bodyMedium,
//                               ),
//                             ),
//                           );
//                         },
//                       ),
//                     ),
//                   ),
//                 );
//               },
//         ),
//       ],
//     );
//   }
// }
