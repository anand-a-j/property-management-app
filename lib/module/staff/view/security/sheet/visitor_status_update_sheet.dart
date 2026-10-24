import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naseem/core/enum/visitor_status.dart';
import 'package:naseem/module/admin/visitor/controller/bloc/visitor_bloc.dart';

import '../../../../../core/core.dart';
import '../../../../../core/widgets/status_update_bottom_sheet.dart';
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
        child: StatusUpdateBottomSheet<VisitorStatus>(
          title: 'Update Visitor Status',
          statuses: nextStatuses,
          initialStatus: nextStatuses.first,
          itemLabel: (item) => item.label,
          showRemark: false,
          isLoading: false,
          onSubmit: (status, remark) async {
            context.read<VisitorBloc>().add(
              UpdateVisitorStatusEvent(id: visitor.id, status: status),
            );
          },
        ),
      );
    },
  );
}
