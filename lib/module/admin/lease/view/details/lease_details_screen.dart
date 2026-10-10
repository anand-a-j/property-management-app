import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:naseem/module/admin/community/model/community.dart';
import 'package:naseem/module/admin/lease/model/lease.dart';
import 'package:naseem/module/admin/lease/view/details/widgets/lease_details_card.dart';
import 'package:naseem/module/admin/lease/view/details/widgets/lease_history_stepper.dart';
import 'package:naseem/module/auth/core/controller/service/auth_service.dart';
import 'package:naseem/routes/args/add_payment_args.dart';
import 'package:naseem/routes/router_path.dart';

import '../../../../../core/core.dart';
import '../../../unit/model/unit.dart';
import 'tab/lease_payment_tab.dart';

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

class _LeaseDetailsScreenState extends State<LeaseDetailsScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_onTabChanged);
  }

  void _onTabChanged() {
    if (_selectedIndex != _tabController.index) {
      setState(() {
        _selectedIndex = _tabController.index;
      });
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
    return Scaffold(
      appBar: CustomAppBar(
        leadingOnTap: () => Navigator.pop(context),
        title: 'Lease',
      ),
      body: Column(
        children: [
          LeaseDetailsCard(
            lease: widget.lease,
            unit: widget.unit,
            community: widget.community,
          ),
          TabBar(
            controller: _tabController,
            tabs: const [
              Tab(text: 'History'),
              Tab(text: 'Payments'),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                LeaseHistoryStepper(
                  lease: widget.lease,
                  currentUserId: authentication.profile?.id ?? '',
                ),
                LeasePaymentsTab(
                  orgId: authentication.profile?.orgId ?? '',
                  leaseId: widget.lease.id,
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: _selectedIndex == 1
          ? FloatingAddButton(
              title: "Add Payment",
              onTap: () {
                context.push(
                  RouterPath.addPayment,
                  extra: AddPaymentArgs(
                    lease: widget.lease,
                    unit: widget.unit,
                    community: widget.community,
                  ),
                );
              },
            )
          : null,
    );
  }
}
