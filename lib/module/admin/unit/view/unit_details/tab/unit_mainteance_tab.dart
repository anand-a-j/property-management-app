import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/core.dart';
import '../../../../../../core/widgets/empty_state_view.dart';
import '../../../../../../core/widgets/error_state_view.dart';
import '../../../../../auth/core/controller/service/auth_service.dart';
import '../../../../maintainence/controller/bloc/maintenance_bloc.dart';
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
    context.read<MaintenanceBloc>().add(
      GetMaintenanceListEvent(
        orgId: authentication.profile?.orgId ?? '',
        unitId: widget.unitId,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MaintenanceBloc, MaintenanceState>(
      builder: (context, state) {
        if (state is MaintenanceLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is MaintenanceFailed) {
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
              15,
              AppConsts.pSide,
              10,
            ),
            itemCount: maintenanceList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: MaintenanceCard(
                  maintenanceRequest: maintenanceList[index],
                ),
              );
            },
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
