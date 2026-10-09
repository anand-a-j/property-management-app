import 'package:flutter/material.dart';
import 'package:naseem/module/admin/community/model/community.dart';
import 'package:naseem/module/admin/lease/model/lease.dart';
import 'package:naseem/module/admin/lease/view/details/widgets/lease_details_card.dart';
import 'package:naseem/module/admin/lease/view/details/widgets/lease_history_stepper.dart';
import 'package:naseem/module/auth/core/controller/service/auth_service.dart';

import '../../../../../core/core.dart';
import '../../../unit/model/unit.dart';
import '../../../unit/view/unit_details/tab/unit_mainteance_tab.dart';

class LeaseDetailsScreen extends StatefulWidget {
  const LeaseDetailsScreen({
    super.key,
    required this.lease,
    required this.unit,
    required this.community,
  });

  final Lease lease;
  final Unit unit;
  final Community community;

  @override
  State<LeaseDetailsScreen> createState() => _LeaseDetailsScreenState();
}

class _LeaseDetailsScreenState extends State<LeaseDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: CustomAppBar(
          leadingOnTap: () => Navigator.pop(context),
          title: "Lease",
        ),
        body: Column(
          children: [
            LeaseDetailsCard(
              lease: widget.lease,
              unit: widget.unit,
              community: widget.community,
            ),

            const TabBar(
              tabs: [
                Tab(text: "History"),
                Tab(text: "Payments"),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  LeaseHistoryStepper(
                    lease: widget.lease,
                    currentUserId: authentication.profile?.id ?? "",
                  ),
                  UnitMainteanceTab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
