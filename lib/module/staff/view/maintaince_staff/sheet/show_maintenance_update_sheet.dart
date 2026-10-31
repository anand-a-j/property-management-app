import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naseem/core/core.dart' show AppConsts;
import 'package:naseem/module/admin/maintainence/model/maintenance_request.dart';
import 'package:naseem/module/auth/core/controller/service/auth_service.dart';

import '../../../../../core/enum/mainteance_status.dart';
import '../../../controller/maintaince_staff/bloc/status/maintenance_status_bloc.dart';
import 'update_maintenance_status_body.dart';

void showMaintenanceStatusUpdateSheet(
  BuildContext context,
  MaintenanceRequest request,
  bool isManager,
) {
  final nextStatuses = request.status.nextStatuses(isManager: isManager);

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
        child: UpdateMaintenanceStatusBody(
          request: request,
          isManager: isManager,
          isLoading: false,
          onSubmit:
              ({
                required status,
                required assignedTo,
                required note,
                required rejectionReason,
              }) async {
                final updatedBy = authentication.profile?.id ?? '';

                context.read<MaintenanceStatusBloc>().add(
                  UpdateMaintenanceStatusEvent(
                    requestId: request.id,
                    status: status.dbValue,
                    updatedBy: updatedBy,
                    assignedTo: isManager ? assignedTo : request.assignedTo,
                    note: note,
                    rejectionReason: rejectionReason,
                  ),
                );
              },
        ),
      );
    },
  );
}
