import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naseem/module/auth/core/controller/service/auth_service.dart';

import '../../../../core/core.dart';
import '../../../../core/widgets/empty_state_view.dart';
import '../../../../core/widgets/error_state_view.dart';
import '../../../admin/maintainence/controller/bloc/maintenance_bloc.dart';
import '../../../admin/maintainence/view/list/widgets/maintenance_card.dart';

class ResidentMaintenanceTab extends StatefulWidget {
  const ResidentMaintenanceTab({super.key, required this.unitId});

  final String unitId;

  @override
  State<ResidentMaintenanceTab> createState() => _ResidentMaintenanceTabState();
}

class _ResidentMaintenanceTabState extends State<ResidentMaintenanceTab> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _getMaintenanceList();
    });
  }

  void _getMaintenanceList() {
    context.read<MaintenanceBloc>().add(
      GetMaintenanceListEvent( orgId: authentication.profile?.orgId??"", unitId: widget.unitId,),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MaintenanceBloc, MaintenanceState>(
      builder: (context, state) {
        // Loading
        if (state is MaintenanceLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        // Error
        if (state is MaintenanceFailed) {
          return ErrorStateView(
            message: state.message,
            retryOnTap: _getMaintenanceList,
          );
        }

        // Success
        if (state is MaintenanceListSuccess) {
          final maintenanceList = state.maintenanceList;

          if (maintenanceList.isEmpty) {
            return const EmptyStateView(
              message: 'No matching maintenance requests',
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.fromLTRB(
              AppConsts.pSide,
              15,
              AppConsts.pSide,
              80,
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
