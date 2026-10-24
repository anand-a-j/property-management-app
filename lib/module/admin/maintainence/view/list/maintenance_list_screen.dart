import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/core.dart';
import '../../../../../core/widgets/empty_state_view.dart';
import '../../../../../core/widgets/error_state_view.dart';
import '../../../../auth/core/controller/service/auth_service.dart';
import '../../controller/bloc/bloc/maintenance_list_bloc.dart';
import 'widgets/maintenance_card.dart';

class MaintenanceListScreen extends StatefulWidget {
  const MaintenanceListScreen({
    super.key,
    this.unitId,
    required this.isFromResident,
  });

  final String? unitId;
  final bool isFromResident;

  @override
  State<MaintenanceListScreen> createState() => _MaintenanceListScreenState();
}

class _MaintenanceListScreenState extends State<MaintenanceListScreen> {
  @override
  void initState() {
    super.initState();
    _getMaintenanceList();
  }

  void _getMaintenanceList() {
    log("isFromResident : ${widget.isFromResident} unitId: ${widget.unitId}");
    // If opened from resident and unitId is null or empty, don't fetch.
    if (widget.isFromResident &&
        (widget.unitId == null || widget.unitId!.isEmpty)) {
      return;
    }

    context.read<MaintenanceListBloc>().add(
      GetMaintenanceListEvent(
        orgId: authentication.profile?.orgId ?? '',
        unitId: widget.unitId,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Maintenance Requests',
        leadingOnTap: () => context.pop(),
      ),
      body: BlocBuilder<MaintenanceListBloc, MaintenanceListState>(
        builder: (context, state) {
          // Loading
          if (state is MaintenanceListLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          // Error
          if (state is MaintenanceListFailed) {
            return ErrorStateView(
              message: state.message,
              retryOnTap: _getMaintenanceList,
            );
          }

          // Success
          if (state is MaintenanceListSuccess) {
            final maintenanceList = state.maintenanceList;

            // Empty
            if (maintenanceList.isEmpty) {
              return EmptyStateView(
                message: 'No matching maintenance requests',
              );
            }

            // Maintenance list
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
          return EmptyStateView(message: 'No matching maintenance requests');
        },
      ),
    );
  }
}
