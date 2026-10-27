import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naseem/core/enum/visitor_status.dart';
import 'package:naseem/module/admin/visitor/controller/bloc/visitor_bloc.dart';
import 'package:naseem/module/staff/view/security/sheet/visitor_status_update_sheet_body.dart'
    show VisitorStatusUpdateSheetBody;

import '../../../../../core/core.dart';
import '../../../../admin/visitor/model/visitor.dart';

void showVisitorStatusUpdateSheet(
  BuildContext context,
  Visitor visitor,
  bool isManager,
) {
  final nextStatuses = visitor.status.nextStatuses(isManager: isManager);

  if (nextStatuses.isEmpty) return;

  showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (dialogContext) {
      return Dialog(
        insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConsts.rMedium),
        ),
        backgroundColor: Colors.white,
        child: VisitorStatusUpdateSheetBody(
          visitor: visitor,
          statuses: nextStatuses,
          itemLabel: (status) => status.label,
          isLoading: false,
          onSubmit: (status) async {
            context.read<VisitorBloc>().add(
              UpdateVisitorStatusEvent(id: visitor.id, status: status),
            );
          },
        ),
      );
    },
  );
}
