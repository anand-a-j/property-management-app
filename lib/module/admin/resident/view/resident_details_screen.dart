import 'package:flutter/material.dart';
import 'package:naseem/module/admin/resident/model/resident_list_response.dart';
import 'package:naseem/module/admin/unit/model/unit.dart';

import '../../../../core/core.dart';
import '../../unit/view/unit_details/widgets/unit_lease_history_list_view.dart';
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
              children:  [
                // UnitLeaseHistoryListView(unit: Unit(id: id, communityId: communityId, name: name, area: area, description: description, createdAt: createdAt, updatedAt: updatedAt), community: community), SizedBox.expand()
                
                ],
            ),
          ),
        ],
      ),
    );
  }
}


  