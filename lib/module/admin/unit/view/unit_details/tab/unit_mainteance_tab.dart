import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/core.dart';
import '../../../../../../core/utils/snackbar_manager.dart';
import '../../../../../../core/widgets/empty_state_view.dart';
import '../../../../../../core/widgets/error_state_view.dart';
import '../../../../../auth/core/controller/service/auth_service.dart';
import '../../../../../staff/controller/maintaince_staff/bloc/status/maintenance_status_bloc.dart';
import '../../../../../staff/view/maintaince_staff/sheet/show_maintenance_update_sheet.dart';
import '../../../../maintainence/controller/bloc/bloc/maintenance_list_bloc.dart';
import '../../../../maintainence/view/list/widgets/maintenance_card.dart';

class UnitMainteanceTab extends StatefulWidget {
  const UnitMainteanceTab({super.key, required this.unitId});

  final String unitId;

  @override
  State<UnitMainteanceTab> createState() => _UnitMainteanceTabState();
}

class _UnitMainteanceTabState extends State<UnitMainteanceTab> {
  @override
  void initState() {
    super.initState();
    _getMaintenanceList();
  }

  void _getMaintenanceList() {
    context.read<MaintenanceListBloc>().add(
      GetMaintenanceListEvent(
        orgId: authentication.profile?.orgId ?? '',
        unitId: widget.unitId,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<MaintenanceStatusBloc, MaintenanceStatusState>(
      listener: (context, state) {
        if (state is MaintenanceStatusSuccess) {
          Snack.success("Maintenance status updated successfully");
          _getMaintenanceList();
        } else if (state is MaintenanceStatusFailed) {
          Snack.error(state.errorMessage);
        }
      },

      child: BlocBuilder<MaintenanceListBloc, MaintenanceListState>(
        builder: (context, state) {
          if (state is MaintenanceListLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is MaintenanceListFailed) {
            return ErrorStateView(
              message: state.message,
              retryOnTap: _getMaintenanceList,
            );
          }

          if (state is MaintenanceListSuccess) {
            final maintenanceList = state.maintenanceList;

            if (maintenanceList.isEmpty) {
              return EmptyStateView(
                message: 'No maintenance requests for this unit',
              );
            }

            return ListView.builder(
              padding: const EdgeInsets.fromLTRB(
                AppConsts.pSide,
                8,
                AppConsts.pSide,
                0,
              ),
              itemCount: maintenanceList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    showMaintenanceStatusUpdateSheet(
                      context,
                      maintenanceList[index],
                      true,
                    );
                  },
                  child: MaintenanceCard(
                    maintenanceRequest: maintenanceList[index],
                  ),
                );
              },
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
