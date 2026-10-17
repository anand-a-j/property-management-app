import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/core.dart';
import '../../../../../core/widgets/empty_state_view.dart';
import '../../../../../core/widgets/error_state_view.dart';
import '../../../../auth/core/controller/service/auth_service.dart';
import '../../controller/bloc/maintenance_bloc.dart';
import 'widgets/maintenance_card.dart';

class MaintenanceListScreen extends StatefulWidget {
  const MaintenanceListScreen({super.key});

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
    context.read<MaintenanceBloc>().add(
      GetMaintenanceListEvent(orgId: authentication.profile?.orgId ?? ''),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Maintenance Requests',
        leadingOnTap: () => context.pop(),
      ),
      body: Expanded(
        child: BlocBuilder<MaintenanceBloc, MaintenanceState>(
          builder: (context, state) {
            // Initial loading
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

              // Empty
              if (maintenanceList.isEmpty) {
                return EmptyStateView(
                  message: 'No matching maintenance requests',
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
        ),
      ),
    );
  }
}
