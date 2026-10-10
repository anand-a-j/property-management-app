import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:naseem/core/enum/mainteance_status.dart'
    show MaintenanceStatusX;

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
  // late final ScrollController _scrollController;

  // String _searchQuery = '';

  @override
  void initState() {
    super.initState();

    // _scrollController = ScrollController();
    // _scrollController.addListener(_onScroll);

    _getMaintenanceList();
  }

  void _getMaintenanceList() {
    context.read<MaintenanceBloc>().add(
      GetMaintenanceListEvent(orgId: authentication.profile?.orgId ?? ''),
    );
  }

  // void _onScroll() {
  //   if (!_scrollController.hasClients) return;

  //   if (_scrollController.position.pixels >=
  //       _scrollController.position.maxScrollExtent - 200) {
  //     context.read<MaintenanceBloc>().add(LoadMoreMaintenanceEvent());
  //   }
  // }

  // void _onSearch(String query) {
  //   _searchQuery = query;

  //   // Apply local filtering to the currently loaded list.
  //   setState(() {});
  // }

  @override
  void dispose() {
    // _scrollController
    //   ..removeListener(_onScroll)
    //   ..dispose();

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

              // final filteredList = maintenanceList.where((request) {
              //   final query = _searchQuery.trim().toLowerCase();

              //   if (query.isEmpty) return true;

              //   return request.ticketNumber.toLowerCase().contains(query) ||
              //       request.issueTitle.toLowerCase().contains(query) ||
              //       request.issueType.toLowerCase().contains(query) ||
              //       request.status.label.toLowerCase().contains(query);
              // }).toList();

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
                  // // Pagination loader
                  // if (index == filteredList.length) {
                  //   return const Padding(
                  //     padding: EdgeInsets.symmetric(vertical: 16),
                  //     child: Center(child: CircularProgressIndicator()),
                  //   );
                  // }

                  // final maintenanceRequest = filteredList[index];

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
