import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naseem/core/core.dart';
import 'package:naseem/module/admin/community/model/community.dart';
import 'package:naseem/module/admin/unit/view/unit_details/widgets/unit_header_card.dart';
import 'package:naseem/module/auth/core/controller/service/auth_service.dart';

import '../../../lease/controller/blocs/bloc/active_lease_bloc.dart';
import '../../../lease/controller/blocs/bloc/lease_bloc.dart';
import '../../model/unit.dart';
import 'tab/unit_mainteance_tab.dart';
import 'tab/unit_overview_tab.dart';

class UnitDetailsScreen extends StatelessWidget {
  const UnitDetailsScreen({
    super.key,
    required this.unit,
    required this.community,
  });

  final Unit unit;
  final Community community;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final orgId = authentication.profile?.orgId ?? "";
      context.read<ActiveLeaseBloc>().add(
        GetActiveLease(orgId: orgId, unitId: unit.id),
      );

      // context.read<LeaseBloc>().add(
      //   GetLeases(orgId: orgId, unitId: unit.id, searchQuery: ""),
      // );
    });
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: CustomAppBar(
          title: "Unit",
          leadingOnTap: () => Navigator.pop(context),
        ),
        body: Column(
          children: [
            UnitHeaderCard(community: community, unit: unit),
            const TabBar(
              tabs: [
                Tab(text: "Overview"),
                Tab(text: "Maintenance"),
              ],
            ),
            const Expanded(
              child: TabBarView(
                children: [UnitOverviewTab(), UnitMainteanceTab()],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
