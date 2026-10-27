import 'package:flutter/material.dart';
import 'package:naseem/module/admin/community/model/community.dart';
import 'package:naseem/module/admin/resident/model/resident_list_response.dart';
import 'package:naseem/module/admin/resident/view/tab/resident_details_lease_list_view.dart';
import 'package:naseem/module/admin/unit/model/unit.dart';
import 'package:naseem/module/auth/core/controller/service/auth_service.dart';

import '../../../../core/core.dart';
import '../../unit/view/unit_details/widgets/unit_lease_history_list_view.dart';
import 'tab/resident_visitors_list_view.dart';
import 'widgets/resident_header_card.dart';

class ResidentDetailsScreen extends StatefulWidget {
  const ResidentDetailsScreen({super.key, required this.resident});

  final ResidentListResponse resident;

  @override
  State<ResidentDetailsScreen> createState() => _ResidentDetailsScreenState();
}

class _ResidentDetailsScreenState extends State<ResidentDetailsScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Resident',
        leadingOnTap: () => Navigator.pop(context),
      ),
      body: Column(
        children: [
          ResidentHeaderCard(resident: widget.resident),

          TabBar(
            controller: _tabController,
            tabs: const [
              Tab(text: 'Leases'),
              Tab(text: 'Visitors'),
            ],
          ),

          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                ResidentDetailsLeaseListView(
                  residentId: widget.resident.profile.id,
                ),

                ResidentVisitorsListView(
                  orgId: authentication.profile?.orgId ?? "",
                  residentId: widget.resident.profile.id,
                  unitId: widget.resident.currentUnitId ?? "",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
