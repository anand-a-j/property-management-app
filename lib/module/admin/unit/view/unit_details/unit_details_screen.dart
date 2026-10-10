import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:naseem/core/core.dart';
import 'package:naseem/module/admin/community/model/community.dart';
import 'package:naseem/module/admin/unit/view/unit_details/widgets/unit_header_card.dart';
import 'package:naseem/module/auth/core/controller/service/auth_service.dart';
import 'package:naseem/routes/args/add_lease_args.dart';
import 'package:naseem/routes/args/add_maintenance_args.dart';

import '../../../../../routes/router_path.dart';
import '../../../lease/controller/blocs/bloc/active_lease_bloc.dart';
import '../../../lease/controller/blocs/bloc/lease_bloc.dart';
import '../../model/unit.dart';
import 'tab/unit_mainteance_tab.dart';
import 'tab/unit_overview_tab.dart';

class UnitDetailsScreen extends StatefulWidget {
  const UnitDetailsScreen({
    super.key,
    required this.unit,
    required this.community,
  });

  final Unit unit;
  final Community community;

  @override
  State<UnitDetailsScreen> createState() => _UnitDetailsScreenState();
}

class _UnitDetailsScreenState extends State<UnitDetailsScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_onTabChanged);

    final orgId = authentication.profile?.orgId ?? '';

    context.read<ActiveLeaseBloc>().add(
      GetActiveLease(orgId: orgId, unitId: widget.unit.id),
    );

    context.read<LeaseBloc>().add(
      GetLeases(orgId: orgId, unitId: widget.unit.id, searchQuery: ''),
    );
  }

  void _onTabChanged() {
    if (!_tabController.indexIsChanging) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    _tabController.removeListener(_onTabChanged);
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMaintenanceTab = _tabController.index == 1;

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Unit',
        leadingOnTap: () => Navigator.pop(context),
      ),
      body: Column(
        children: [
          UnitHeaderCard(community: widget.community, unit: widget.unit),
          TabBar(
            controller: _tabController,
            tabs: const [
              Tab(text: 'Overview'),
              Tab(text: 'Maintenance'),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                UnitOverviewTab(unit: widget.unit, community: widget.community),
                UnitMainteanceTab(unitId: widget.unit.id),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingAddButton(
        title: isMaintenanceTab ? 'Add Maintenance' : 'Add Lease',
        onTap: () {
          if (isMaintenanceTab) {
            context.push(
              RouterPath.addMaintenance,
              extra: AddMaintenanceArgs(
                unit: widget.unit,
                community: widget.community,
              ),
            );
          } else {
            context.push(
              RouterPath.addLease,
              extra: AddLeaseArgs(
                unit: widget.unit,
                community: widget.community,
              ),
            );
          }
        },
      ),
    );
  }
}
