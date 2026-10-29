import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' hide DateUtils;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:naseem/core/enum/visitor_type.dart';
import 'package:naseem/module/admin/visitor/model/create_visitor.dart';

import '../../../../../core/core.dart';
import '../../../../../core/utils/input_vaildator.dart';
import '../../../../../core/utils/snackbar_manager.dart';
import '../../../../auth/core/controller/service/auth_service.dart';
import '../../controller/bloc/visitor_bloc.dart';
import '../../model/visitor.dart';

class AddVisitorScreen extends StatefulWidget {
  const AddVisitorScreen({
    super.key,
    required this.isResident,
    this.isEdit = false,
    this.unitId,
    this.leaseId,
    this.residentId,
    this.visitor,
  }) : assert(
         !isResident ||
             (unitId != null && leaseId != null && residentId != null),
         'unitId, leaseId and residentId are required when isResident is true',
       ),
       assert(
         !isEdit || visitor != null,
         'visitor is required when isEdit is true',
       );

  final bool isResident;
  final bool isEdit;
  final String? unitId;
  final String? leaseId;
  final String? residentId;
  final Visitor? visitor;

  @override
  State<AddVisitorScreen> createState() => _AddVisitorScreenState();
}

class _AddVisitorScreenState extends State<AddVisitorScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _visitStartController = TextEditingController();
  final TextEditingController _visitEndController = TextEditingController();
  final TextEditingController _purposeController = TextEditingController();

  DateTime? _visitStartAt;
  DateTime? _visitEndAt;
  VisitType? _visitType;
  bool _parkingRequired = false;

  @override
  void initState() {
    super.initState();

    if (widget.isEdit && widget.visitor != null) {
      _initializeVisitorData(widget.visitor!);
    }
  }

  void _initializeVisitorData(Visitor visitor) {
    _nameController.text = visitor.name;
    _phoneController.text = visitor.phone ?? '';
    _purposeController.text = visitor.purpose ?? '';

    _visitStartAt = visitor.visitStartAt;
    _visitEndAt = visitor.visitEndAt;

    if (_visitStartAt != null) {
      _visitStartController.text = _formatDateTime(_visitStartAt!);
    }

    if (_visitEndAt != null) {
      _visitEndController.text = _formatDateTime(_visitEndAt!);
    }

    _visitType = visitor.visitType;
    _parkingRequired = visitor.parkingRequired ?? false;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _visitStartController.dispose();
    _visitEndController.dispose();
    _purposeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<VisitorBloc, VisitorState>(
      listener: (context, state) {
        if (state is VisitorCreateSuccess) {
          Snack.success('Visitor added successfully');
          context.pop<bool>(true);
        }

        if (state is VisitorSuccess) {
          Snack.success('Visitor updated successfully');
          context.pop<bool>(true);
        }

        if (state is VisitorFailed) {
          Snack.error(state.message);
        }
      },
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'Back',
          leadingOnTap: () => Navigator.pop(context),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppConsts.pSide),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: AppConsts.pMedium),

                    Text(
                      widget.isEdit ? 'Edit Visitor' : 'Add Visitor',
                      style: context.titleLarge?.copyWith(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: AppConsts.pSmall),

                    Text(
                      widget.isEdit
                          ? 'Update the visitor details below'
                          : widget.isResident
                          ? 'Let us know who is visiting and when'
                          : 'Enter the visitor details below',
                      style: context.bodyMedium?.copyWith(
                        color: context.secondaryContainer,
                      ),
                    ),

                    const SizedBox(height: AppConsts.pLarge),

                    _nameField(),
                    const SizedBox(height: AppConsts.pSide),

                    _phoneField(),
                    const SizedBox(height: AppConsts.pSide),

                    _visitTypeField(),
                    const SizedBox(height: AppConsts.pSide),

                    if (widget.isResident) ...[
                      _visitStartField(),
                      const SizedBox(height: AppConsts.pSide),

                      _visitEndField(),
                      const SizedBox(height: AppConsts.pSide),

                      _parkingField(),
                      const SizedBox(height: AppConsts.pSide),
                    ],

                    _purposeField(),

                    const SizedBox(height: AppConsts.pLarge),
                  ],
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppConsts.pSide),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomButton(
                  label: widget.isEdit ? 'Update Visitor' : 'Create Visitor',
                  onPressed: _submit,
                  isLoading: context.select<VisitorBloc, bool>(
                    (bloc) => bloc.state is VisitorLoading,
                  ),
                ),
                const SizedBox(height: AppConsts.pLarge),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // Fields
  // ---------------------------------------------------------------------------

  Widget _nameField() {
    return CustomTextField(
      controller: _nameController,
      textInputType: TextInputType.name,
      labelText: 'Visitor Name',
      hintText: 'Enter visitor name',
      validator: (value) => InputVaildator.required(value),
    );
  }

  Widget _phoneField() {
    return CustomTextField(
      controller: _phoneController,
      textInputType: TextInputType.phone,
      labelText: 'Phone Number',
      hintText: 'Enter visitor phone number',
    );
  }

  Widget _visitTypeField() {
    return CustomDropdownField<VisitType>(
      initialValue: _visitType,
      labelText: 'Visit Type',
      hintText: 'Select visit type',
      items: VisitType.values,
      itemLabel: (item) => item.label,
      onChanged: (value) {
        setState(() {
          _visitType = value;
        });
      },
      validator: (value) {
        if (value == null) {
          return 'Please select visit type';
        }
        return null;
      },
    );
  }

  Widget _visitStartField() {
    return CustomTextField(
      controller: _visitStartController,
      textInputType: TextInputType.datetime,
      labelText: 'Expected Arrival',
      hintText: 'Select arrival date and time',
      readOnly: true,
      suffixIcon: const Icon(Icons.calendar_month_outlined),
      onTap: _selectVisitStart,
      validator: (value) => InputVaildator.required(value),
    );
  }

  Widget _visitEndField() {
    return CustomTextField(
      controller: _visitEndController,
      textInputType: TextInputType.datetime,
      labelText: 'Expected Departure (Optional)',
      hintText: 'Select departure date and time',
      readOnly: true,
      suffixIcon: const Icon(Icons.calendar_month_outlined),
      onTap: _selectVisitEnd,
    );
  }

  Widget _parkingField() {
    return SwitchListTile.adaptive(
      contentPadding: EdgeInsets.zero,
      title: const Text('Parking required'),
      subtitle: const Text('Turn on if the visitor will bring a vehicle'),
      value: _parkingRequired,
      onChanged: (value) {
        setState(() {
          _parkingRequired = value;
        });
      },
    );
  }

  Widget _purposeField() {
    return CustomTextField(
      controller: _purposeController,
      textInputType: TextInputType.multiline,
      labelText: 'Purpose of Visit',
      hintText: 'Enter purpose of visit',
      maxLines: 3,
    );
  }

  // ---------------------------------------------------------------------------
  // Date & time pickers
  // ---------------------------------------------------------------------------

  Future<void> _selectVisitStart() async {
    final picked = await _pickDateTime(
      minimum: DateTime.now(),
      initial: _visitStartAt,
    );

    if (picked == null || !mounted) return;

    setState(() {
      _visitStartAt = picked;
      _visitStartController.text = _formatDateTime(picked);

      if (_visitEndAt != null && !_visitEndAt!.isAfter(picked)) {
        _visitEndAt = null;
        _visitEndController.clear();
      }
    });
  }

  Future<void> _selectVisitEnd() async {
    final start = _visitStartAt;

    if (start == null) {
      Snack.error('Select expected arrival first');
      return;
    }

    final picked = await _pickDateTime(
      minimum: start,
      initial: _visitEndAt ?? start.add(const Duration(hours: 1)),
    );

    if (picked == null || !mounted) return;

    if (!picked.isAfter(start)) {
      Snack.error('Departure must be after arrival');
      return;
    }

    setState(() {
      _visitEndAt = picked;
      _visitEndController.text = _formatDateTime(picked);
    });
  }

  Future<DateTime?> _pickDateTime({
    required DateTime minimum,
    DateTime? initial,
  }) {
    final now = DateTime.now();

    var selected = initial ?? now.add(const Duration(minutes: 15));

    if (selected.isBefore(minimum)) {
      selected = minimum.add(const Duration(minutes: 15));
    }

    return showCupertinoModalPopup<DateTime>(
      context: context,
      builder: (context) => Container(
        height: 320,
        color: CupertinoColors.systemBackground.resolveFrom(context),
        child: SafeArea(
          top: false,
          child: Column(
            children: [
              SizedBox(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CupertinoButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Cancel'),
                    ),
                    CupertinoButton(
                      onPressed: () => Navigator.pop(context, selected),
                      child: const Text('Done'),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.dateAndTime,
                  initialDateTime: selected,
                  minimumDate: minimum,
                  maximumDate: DateTime(2100),
                  use24hFormat: true,
                  onDateTimeChanged: (dateTime) {
                    selected = dateTime;
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatDateTime(DateTime date) {
    final datePart =
        '${date.day.toString().padLeft(2, '0')}/'
        '${date.month.toString().padLeft(2, '0')}/'
        '${date.year}';

    final timePart =
        '${date.hour.toString().padLeft(2, '0')}:'
        '${date.minute.toString().padLeft(2, '0')}';

    return '$datePart $timePart';
  }

  // ---------------------------------------------------------------------------
  // Submit
  // ---------------------------------------------------------------------------

  String? _trimmedOrNull(TextEditingController controller) {
    final text = controller.text.trim();
    return text.isEmpty ? null : text;
  }

  void _submit() {
    FocusScope.of(context).unfocus();

    if (!(_formKey.currentState?.validate() ?? false)) {
      return;
    }

    if (_visitType == null) {
      Snack.error('Please select visit type');
      return;
    }

    final now = DateTime.now();

    DateTime? visitStartAt;
    DateTime? visitEndAt;
    DateTime? checkedInAt;

    if (widget.isResident) {
      if (_visitStartAt == null) {
        Snack.error('Select expected arrival date and time');
        return;
      }

      if (_visitStartAt!.isBefore(now.subtract(const Duration(minutes: 1)))) {
        Snack.error('Arrival date and time cannot be in the past');
        return;
      }

      if (_visitEndAt != null && !_visitEndAt!.isAfter(_visitStartAt!)) {
        Snack.error('Departure must be after arrival');
        return;
      }

      visitStartAt = _visitStartAt;
      visitEndAt = _visitEndAt;
    } else {
      checkedInAt = widget.isEdit ? widget.visitor?.checkedInAt : now;
    }

    final orgId = authentication.profile?.orgId ?? '';

    if (widget.isEdit) {
      final visitor = widget.visitor!;

      context.read<VisitorBloc>().add(
        UpdateVisitorEvent(
          id: visitor.id,
          orgId: orgId,
          name: _nameController.text.trim(),
          phone: _trimmedOrNull(_phoneController),
          visitStartAt: widget.isResident ? visitStartAt : visitor.visitStartAt,
          visitEndAt: widget.isResident ? visitEndAt : visitor.visitEndAt,
          visitType: _visitType!.name,
          purpose: _trimmedOrNull(_purposeController),
          parkingRequired: widget.isResident
              ? _parkingRequired
              : visitor.parkingRequired,
          unitId: widget.unitId ?? visitor.unitId,
          residentId: widget.residentId ?? visitor.residentId,
          leaseId: widget.leaseId ?? visitor.leaseId,
        ),
      );

      return;
    }

    final newVisitor = CreateVisitor(
      orgId: orgId,
      createdBy: authentication.profile?.id ?? '',
      name: _nameController.text.trim(),
      phone: _trimmedOrNull(_phoneController),
      visitType: _visitType!.name,
      purpose: _trimmedOrNull(_purposeController),

      visitStartAt: visitStartAt,
      visitEndAt: visitEndAt,

      checkedInAt: checkedInAt,

      parkingRequired: widget.isResident ? _parkingRequired : false,

      unitId: widget.isResident ? widget.unitId : null,
      leaseId: widget.isResident ? widget.leaseId : null,
      residentId: widget.isResident ? widget.residentId : null,
    );

    context.read<VisitorBloc>().add(CreateVisitorEvent(visitor: newVisitor));
  }
}

// TODO: Remove this before production
// class AddVisitorScreen extends StatefulWidget {
//   const AddVisitorScreen({
//     super.key,
//     required this.isResident,
//     this.unitId,
//     this.leaseId,
//     this.residentId,
//   }) : assert(
//          !isResident ||
//              (unitId != null && leaseId != null && residentId != null),
//          'unitId, leaseId and residentId are required when isResident is true',
//        );

//   /// true  -> resident pre-registers a visitor (schedule, parking, document)
//   /// false -> security/manager adds a visitor who is at the gate right now
//   final bool isResident;

//   final String? unitId;
//   final String? leaseId;
//   final String? residentId;

//   @override
//   State<AddVisitorScreen> createState() => _AddVisitorScreenState();
// }

// class _AddVisitorScreenState extends State<AddVisitorScreen> {
//   final _formKey = GlobalKey<FormState>();

//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _phoneController = TextEditingController();
//   final TextEditingController _visitStartController = TextEditingController();
//   final TextEditingController _visitEndController = TextEditingController();
//   // final TextEditingController _documentIdController = TextEditingController();
//   final TextEditingController _purposeController = TextEditingController();

//   DateTime? _visitStartAt;
//   DateTime? _visitEndAt;
//   VisitType? _visitType;
//   bool _parkingRequired = false;

//   @override
//   void dispose() {
//     _nameController.dispose();
//     _phoneController.dispose();
//     _visitStartController.dispose();
//     _visitEndController.dispose();
//     // _documentIdController.dispose();
//     _purposeController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocListener<VisitorBloc, VisitorState>(
//       listener: (context, state) {
//         if (state is VisitorCreateSuccess) {
//           Snack.success('Visitor added successfully');
//           context.pop<bool>(true);
//         }

//         if (state is VisitorFailed) {
//           Snack.error(state.message);
//         }
//       },
//       child: Scaffold(
//         appBar: CustomAppBar(
//           title: 'Back',
//           leadingOnTap: () => Navigator.pop(context),
//         ),
//         body: SafeArea(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: AppConsts.pSide),
//             child: Form(
//               key: _formKey,
//               child: SingleChildScrollView(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const SizedBox(height: AppConsts.pMedium),

//                     Text(
//                       'Add Visitor',
//                       style: context.titleLarge?.copyWith(
//                         fontSize: 32,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),

//                     const SizedBox(height: AppConsts.pSmall),

//                     Text(
//                       widget.isResident
//                           ? 'Let us know who is visiting and when'
//                           : 'Enter the visitor details below',
//                       style: context.bodyMedium?.copyWith(
//                         color: context.secondaryContainer,
//                       ),
//                     ),

//                     const SizedBox(height: AppConsts.pLarge),

//                     _nameField(),
//                     const SizedBox(height: AppConsts.pSide),

//                     _phoneField(),
//                     const SizedBox(height: AppConsts.pSide),

//                     _visitTypeField(),
//                     const SizedBox(height: AppConsts.pSide),

//                     // Resident-only: expected schedule, parking, legal document
//                     if (widget.isResident) ...[
//                       _visitStartField(),
//                       const SizedBox(height: AppConsts.pSide),

//                       _visitEndField(),
//                       const SizedBox(height: AppConsts.pSide),

//                       _parkingField(),
//                       // const SizedBox(height: AppConsts.pSide),

//                       // _documentIdField(),
//                       const SizedBox(height: AppConsts.pSide),
//                     ],

//                     _purposeField(),

//                     const SizedBox(height: AppConsts.pLarge),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//         bottomNavigationBar: SafeArea(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: AppConsts.pSide),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 CustomButton(
//                   label: 'Create Visitor',
//                   onPressed: _submit,
//                   isLoading: context.select<VisitorBloc, bool>(
//                     (bloc) => bloc.state is VisitorLoading,
//                   ),
//                 ),
//                 const SizedBox(height: AppConsts.pLarge),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   // ---------------------------------------------------------------------------
//   // Fields
//   // ---------------------------------------------------------------------------

//   Widget _nameField() {
//     return CustomTextField(
//       controller: _nameController,
//       textInputType: TextInputType.name,
//       labelText: 'Visitor Name',
//       hintText: 'Enter visitor name',
//       validator: (value) => InputVaildator.required(value),
//     );
//   }

//   Widget _phoneField() {
//     return CustomTextField(
//       controller: _phoneController,
//       textInputType: TextInputType.phone,
//       labelText: 'Phone Number',
//       hintText: 'Enter visitor phone number',
//     );
//   }

//   Widget _visitTypeField() {
//     return CustomDropdownField<VisitType>(
//       initialValue: _visitType,
//       labelText: 'Visit Type',
//       hintText: 'Select visit type',
//       items: VisitType.values,
//       itemLabel: (item) => item.label,
//       onChanged: (value) {
//         setState(() {
//           _visitType = value;
//         });
//       },
//       validator: (value) {
//         if (value == null) {
//           return 'Please select visit type';
//         }
//         return null;
//       },
//     );
//   }

//   Widget _visitStartField() {
//     return CustomTextField(
//       controller: _visitStartController,
//       textInputType: TextInputType.datetime,
//       labelText: 'Expected Arrival',
//       hintText: 'Select arrival date and time',
//       readOnly: true,
//       suffixIcon: const Icon(Icons.calendar_month_outlined),
//       onTap: _selectVisitStart,
//       validator: (value) => InputVaildator.required(value),
//     );
//   }

//   Widget _visitEndField() {
//     return CustomTextField(
//       controller: _visitEndController,
//       textInputType: TextInputType.datetime,
//       labelText: 'Expected Departure (Optional)',
//       hintText: 'Select departure date and time',
//       readOnly: true,
//       suffixIcon: const Icon(Icons.calendar_month_outlined),
//       onTap: _selectVisitEnd,
//     );
//   }

//   Widget _parkingField() {
//     return SwitchListTile.adaptive(
//       contentPadding: EdgeInsets.zero,
//       title: const Text('Parking required'),
//       subtitle: const Text('Turn on if the visitor will bring a vehicle'),
//       value: _parkingRequired,
//       onChanged: (value) {
//         setState(() {
//           _parkingRequired = value;
//         });
//       },
//     );
//   }

//   // Widget _documentIdField() {
//   //   return CustomTextField(
//   //     controller: _documentIdController,
//   //     textInputType: TextInputType.text,
//   //     labelText: 'Legal Document ID (Optional)',
//   //     hintText: 'Enter document ID',
//   //   );
//   // }

//   Widget _purposeField() {
//     return CustomTextField(
//       controller: _purposeController,
//       textInputType: TextInputType.multiline,
//       labelText: 'Purpose of Visit',
//       hintText: 'Enter purpose of visit',
//       maxLines: 3,
//     );
//   }

//   // ---------------------------------------------------------------------------
//   // Date & time pickers
//   // ---------------------------------------------------------------------------

//   Future<void> _selectVisitStart() async {
//     final picked = await _pickDateTime(minimum: DateTime.now());
//     if (picked == null || !mounted) return;

//     setState(() {
//       _visitStartAt = picked;
//       _visitStartController.text = _formatDateTime(picked);

//       // Departure must stay after arrival; clear it if it no longer is.
//       if (_visitEndAt != null && !_visitEndAt!.isAfter(picked)) {
//         _visitEndAt = null;
//         _visitEndController.clear();
//       }
//     });
//   }

//   Future<void> _selectVisitEnd() async {
//     final start = _visitStartAt;
//     if (start == null) {
//       Snack.error('Select expected arrival first');
//       return;
//     }

//     final picked = await _pickDateTime(
//       minimum: start,
//       initial: _visitEndAt ?? start.add(const Duration(hours: 1)),
//     );
//     if (picked == null || !mounted) return;

//     if (!picked.isAfter(start)) {
//       Snack.error('Departure must be after arrival');
//       return;
//     }

//     setState(() {
//       _visitEndAt = picked;
//       _visitEndController.text = _formatDateTime(picked);
//     });
//   }

//   Future<DateTime?> _pickDateTime({
//     required DateTime minimum,
//     DateTime? initial,
//   }) {
//     final now = DateTime.now();

//     // The picker requires initialDateTime >= minimumDate, so resolve it once
//     // here and use the same value as the "Done" result (otherwise pressing
//     // Done without scrolling would return a stale/different value).
//     var selected = initial ?? now.add(const Duration(minutes: 15));
//     if (selected.isBefore(minimum)) {
//       selected = minimum.add(const Duration(minutes: 15));
//     }

//     return showCupertinoModalPopup<DateTime>(
//       context: context,
//       builder: (context) => Container(
//         height: 320,
//         color: CupertinoColors.systemBackground.resolveFrom(context),
//         child: SafeArea(
//           top: false,
//           child: Column(
//             children: [
//               SizedBox(
//                 height: 50,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     CupertinoButton(
//                       onPressed: () => Navigator.pop(context),
//                       child: const Text('Cancel'),
//                     ),
//                     CupertinoButton(
//                       onPressed: () => Navigator.pop(context, selected),
//                       child: const Text('Done'),
//                     ),
//                   ],
//                 ),
//               ),
//               Expanded(
//                 child: CupertinoDatePicker(
//                   mode: CupertinoDatePickerMode.dateAndTime,
//                   initialDateTime: selected,
//                   minimumDate: minimum,
//                   maximumDate: DateTime(2100),
//                   use24hFormat: true,
//                   onDateTimeChanged: (dateTime) {
//                     selected = dateTime;
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   String _formatDateTime(DateTime date) {
//     final datePart =
//         '${date.day.toString().padLeft(2, '0')}/'
//         '${date.month.toString().padLeft(2, '0')}/'
//         '${date.year}';

//     final timePart =
//         '${date.hour.toString().padLeft(2, '0')}:'
//         '${date.minute.toString().padLeft(2, '0')}';

//     return '$datePart $timePart';
//   }

//   // ---------------------------------------------------------------------------
//   // Submit
//   // ---------------------------------------------------------------------------

//   String? _trimmedOrNull(TextEditingController controller) {
//     final text = controller.text.trim();
//     return text.isEmpty ? null : text;
//   }

//   void _submit() {
//     FocusScope.of(context).unfocus();

//     if (!(_formKey.currentState?.validate() ?? false)) {
//       return;
//     }

//     final now = DateTime.now();
//     DateTime? visitStartAt;
//     DateTime? visitEndAt;
//     DateTime? checkedInAt;

//     if (widget.isResident) {
//       // Resident pre-registers: only the expected schedule is stored.
//       // Security will fill checkedInAt / checkedOutAt later.
//       if (_visitStartAt == null) {
//         Snack.error('Select expected arrival date and time');
//         return;
//       }

//       // 1 minute tolerance so "now" picked a moment ago is still valid.
//       if (_visitStartAt!.isBefore(now.subtract(const Duration(minutes: 1)))) {
//         Snack.error('Arrival date and time cannot be in the past');
//         return;
//       }

//       if (_visitEndAt != null && !_visitEndAt!.isAfter(_visitStartAt!)) {
//         Snack.error('Departure must be after arrival');
//         return;
//       }

//       visitStartAt = _visitStartAt;
//       visitEndAt = _visitEndAt;
//     } else {
//       // Security/manager adds a visitor who is present right now:
//       // only the real check-in time is recorded.
//       checkedInAt = now;
//     }

//     final visitor = CreateVisitor(
//       orgId: authentication.profile?.orgId ?? '',
//       createdBy: authentication.profile?.id ?? '',
//       name: _nameController.text.trim(),
//       phone: _trimmedOrNull(_phoneController),
//       visitType: _visitType!.name,
//       purpose: _trimmedOrNull(_purposeController),

//       // Schedule (resident only)
//       visitStartAt: visitStartAt,
//       visitEndAt: visitEndAt,

//       // Real-time (security only)
//       checkedInAt: checkedInAt,

//       // Resident-only details
//       parkingRequired: widget.isResident ? _parkingRequired : false,
//       // documentId: widget.isResident
//       //     ? _trimmedOrNull(_documentIdController)
//       //     : null,
//       unitId: widget.isResident ? widget.unitId : null,
//       leaseId: widget.isResident ? widget.leaseId : null,
//       residentId: widget.isResident ? widget.residentId : null,
//     );

//     context.read<VisitorBloc>().add(CreateVisitorEvent(visitor: visitor));
//   }
// }
