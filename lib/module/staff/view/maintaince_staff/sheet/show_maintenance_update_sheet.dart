import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naseem/core/core.dart' show AppConsts;
import 'package:naseem/module/admin/maintainence/model/maintenance_request.dart';
import 'package:naseem/module/auth/core/controller/service/auth_service.dart';

import '../../../../../core/enum/mainteance_status.dart';
import '../../../../../core/widgets/status_update_bottom_sheet.dart';
import '../../../controller/maintaince_staff/bloc/status/maintenance_status_bloc.dart';

void showMaintenanceStatusUpdateSheet(
  BuildContext context,
  MaintenanceRequest request,
) {
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
        child: StatusUpdateBottomSheet<MaintenanceStatus>(
          title: 'Update Maintenance Status',
          remarkHint: 'Enter remarks or describe the work performed',
          submitLabel: 'Update Status',
          remarkLabel: 'Remarks',
          statuses: MaintenanceStatus.values
              .where((status) => status != MaintenanceStatus.pendingReview)
              .toList(),
          initialStatus: request.status,
          itemLabel: (status) => status.label,
          showRemark: true,
          isLoading: false,
          onSubmit: (status, remark) async {
            final updatedBy = authentication.profile?.id ?? "";

            context.read<MaintenanceStatusBloc>().add(
              UpdateMaintenanceStatusEvent(
                requestId: request.id,
                status: status.name,
                updatedBy: updatedBy,
                assignedTo:
                    status == MaintenanceStatus.assigned ||
                        status == MaintenanceStatus.inProgress
                    ? request.assignedTo
                    : null,
                note:
                    status == MaintenanceStatus.assigned ||
                        status == MaintenanceStatus.inProgress ||
                        status == MaintenanceStatus.completed
                    ? remark?.trim()
                    : null,
                rejectionReason: status == MaintenanceStatus.rejected
                    ? remark?.trim()
                    : null,
              ),
            );
          },
        ),
      );
    },
  );
}
