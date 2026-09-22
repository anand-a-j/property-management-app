import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:habitroot/core/extension/common.dart';
import 'package:habitroot/core/utils/color_parse_helper.dart';

import '../../../../core/components/core_components.dart';
import '../../../../core/constants/constants.dart';

import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class StoreColorPicker extends StatefulWidget {
  final String initialColor;
  final ValueChanged<String> onChanged;

  const StoreColorPicker({
    super.key,
    required this.initialColor,
    required this.onChanged,
  });

  @override
  State<StoreColorPicker> createState() => _StoreColorPickerState();
}

class _StoreColorPickerState extends State<StoreColorPicker> {
  late Color _selectedColor;

  @override
  void initState() {
    super.initState();
    _selectedColor = ColorParseHelper.fromHex(widget.initialColor);
  }

  Future<void> _openColorPicker() async {
    Color tempColor = _selectedColor;

    final TextEditingController hexController = TextEditingController(
      text: ColorParseHelper.toHex(tempColor),
    );

    await showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return AlertDialog(
              title: Text(
                "Pick Store Color",
                style: context.bodyLarge?.copyWith(fontWeight: FontWeight.w500),
              ),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    /// 🎨 COLOR PICKER
                    ColorPicker(
                      pickerColor: tempColor,
                      onColorChanged: (color) {
                        final solidColor = color.withAlpha(255);
                        setDialogState(() {
                          tempColor = color;
                          hexController.text = ColorParseHelper.toHex(
                            solidColor,
                          );
                        });
                      },
                      paletteType: PaletteType.hsvWithHue,
                      enableAlpha: false,
                      displayThumbColor: true,
                    ),

                    const SizedBox(height: 16),

                    /// 🔤 HEX INPUT
                    TextField(
                      controller: hexController,
                      maxLength: 6,
                      decoration: const InputDecoration(
                        labelText: "HEX Color",
                        prefixText: "#",
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        final hex = value.replaceAll('#', '').toUpperCase();

                        if (hex.length == 6) {
                          try {
                            final newColor = ColorParseHelper.fromHex(hex);

                            setDialogState(() {
                              tempColor = newColor;
                            });
                          } catch (_) {}
                        }
                      },
                    ),
                  ],
                ),
              ),

              /// ACTIONS
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    "Cancel",
                    style: context.bodyMedium?.copyWith(color: context.primary),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _selectedColor = tempColor;
                    });

                    final hexColor = ColorParseHelper.toHex(_selectedColor);

                    widget.onChanged(hexColor);

                    log("selected color : $hexColor");

                    Navigator.pop(context);
                  },
                  child: Text(
                    "Select",
                    style: context.bodyMedium?.copyWith(
                      color: context.onPrimary,
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _openColorPicker,
      child: Container(
        height: 49,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(AppConsts.rSmall),
          border: Border.all(width: 1, color: context.secondaryContainer),
        ),
        child: Row(
          children: [
            /// COLOR PREVIEW
            Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                color: _selectedColor,
                borderRadius: BorderRadius.circular(4),
              ),
            ),

            const SizedBox(width: 10),

            Text("Pick a color for your store", style: context.bodyMedium),

            const Spacer(),

            SvgBuild(
              assetImage: Assets.arrowRight,
              colorFilter: ColorFilter.mode(
                context.secondaryContainer,
                BlendMode.srcIn,
              ),
            ),
          ],
        ),
      ),
    );
  }
}



// class StoreColorPicker extends StatefulWidget {
//   final String initialColor;
//   final ValueChanged<String> onChanged;

//   const StoreColorPicker({
//     super.key,
//     required this.initialColor,
//     required this.onChanged,
//   });

//   @override
//   State<StoreColorPicker> createState() => _StoreColorPickerState();
// }

// class _StoreColorPickerState extends State<StoreColorPicker> {
//   late Color _selectedColor;

//   @override
//   void initState() {
//     super.initState();
//     _selectedColor = ColorParseHelper.fromHex(widget.initialColor);
//   }

//   String _colorToHex(Color color) {
//     return (color.toARGB32() & 0xFFFFFF)
//         .toRadixString(16)
//         .padLeft(6, '0')
//         .toUpperCase();
//   }

//   Future<void> _openColorPicker() async {
//     Color tempColor = _selectedColor;

//     final TextEditingController hexController = TextEditingController(
//       text: _colorToHex(tempColor),
//     );

//     await showDialog(
//       context: context,
//       builder: (context) {
//         return StatefulBuilder(
//           builder: (context, setDialogState) {
//             return AlertDialog(
//               title: Text(
//                 "Pick Store Color",
//                 style: context.bodyLarge?.copyWith(fontWeight: FontWeight.w500),
//               ),
//               content: SingleChildScrollView(
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     /// 🎨 COLOR PICKER (updates when HEX changes)
//                     ColorPicker(
//                       pickerColor: tempColor,
//                       onColorChanged: (color) {
//                         setDialogState(() {
//                           tempColor = color;
//                           hexController.text = _colorToHex(color);
//                         });
//                       },
//                       paletteType: PaletteType.hsvWithHue,
//                       enableAlpha: false,
//                       displayThumbColor: true,
//                     ),

//                     const SizedBox(height: 16),

//                     /// 🔤 HEX INPUT FIELD (updates picker live)
//                     TextField(
//                       controller: hexController,
//                       maxLength: 6,
//                       decoration: const InputDecoration(
//                         labelText: "HEX Color",
//                         prefixText: "#",
//                         border: OutlineInputBorder(),
//                       ),
//                       onChanged: (value) {
//                         final hex = value.replaceAll('#', '');

//                         log("hex : ${hex}");

//                         if (hex.length == 6) {
//                           try {
//                             final newColor = Color(int.parse("0xFF$hex"));

//                             setDialogState(() {
//                               tempColor = newColor; // 🔥 rebuild picker
//                             });
//                           } catch (_) {}
//                         }
//                       },
//                     ),
//                   ],
//                 ),
//               ),

//               /// ACTIONS
//               actions: [
//                 TextButton(
//                   onPressed: () => Navigator.pop(context),
//                   child: Text(
//                     "Cancel",
//                     style: context.bodyMedium?.copyWith(color: context.primary),
//                   ),
//                 ),
//                 ElevatedButton(
//                   onPressed: () {
//                     setState(() {
//                       _selectedColor = tempColor;
//                     });

//                     final hexColor = ColorParseHelper.toHex(_selectedColor);

//                     widget.onChanged(hexColor);

//                     log("selected color : $hexColor");

//                     Navigator.pop(context);
//                   },
//                   child: Text(
//                     "Select",
//                     style: context.bodyMedium?.copyWith(
//                       color: context.onPrimary,
//                     ),
//                   ),
//                 ),
//               ],
//             );
//           },
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: _openColorPicker,
//       child: Container(
//         height: 49,
//         padding: const EdgeInsets.symmetric(horizontal: 10),
//         decoration: BoxDecoration(
//           color: Colors.transparent,
//           borderRadius: BorderRadius.circular(AppConsts.rSmall),
//           border: Border.all(width: 1, color: context.secondaryContainer),
//         ),
//         child: Row(
//           children: [
//             /// COLOR PREVIEW
//             Container(
//               height: 30,
//               width: 30,
//               decoration: BoxDecoration(
//                 color: _selectedColor,
//                 borderRadius: BorderRadius.circular(4),
//               ),
//             ),

//             const SizedBox(width: 10),

//             Text("Pick a color for your store", style: context.bodyMedium),

//             const Spacer(),

//             SvgBuild(
//               assetImage: Assets.arrowRight,
//               colorFilter: ColorFilter.mode(
//                 context.secondaryContainer,
//                 BlendMode.srcIn,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
