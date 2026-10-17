import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:naseem/core/enum/payment_frequency.dart';
import 'package:naseem/core/widgets/widgets.dart';
import 'package:naseem/module/admin/community/model/community.dart';
import 'package:naseem/module/admin/lease/model/lease.dart';
import 'package:naseem/module/admin/unit/model/unit.dart';
import 'package:naseem/module/resident/home/model/resident_lease_details.dart';
import 'package:naseem/module/resident/lease_details/tab/resident_maintenance_tab.dart';
import 'package:naseem/module/resident/lease_details/widgets/resident_lease_details_card.dart';
import 'package:naseem/routes/args/add_maintenance_args.dart';

import '../../../routes/router_path.dart';
import '../../admin/lease/view/details/widgets/lease_history_stepper.dart';
import '../../auth/core/controller/service/auth_service.dart';

class ResidentLeaseDetailsScreen extends StatefulWidget {
  const ResidentLeaseDetailsScreen({super.key, required this.leaseDetails});

  final ResidentLeaseDetails leaseDetails;

  @override
  State<ResidentLeaseDetailsScreen> createState() =>
      _ResidentLeaseDetailsScreenState();
}

class _ResidentLeaseDetailsScreenState extends State<ResidentLeaseDetailsScreen>
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
    final lease = widget.leaseDetails;

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Lease Details',
        leadingOnTap: () => context.pop(),
      ),
      body: Column(
        children: [
          // Lease summary
          ResidentLeaseDetailsCard(lease: lease),

          // Tabs
          TabBar(
            controller: _tabController,
            tabs: const [
              Tab(text: 'History'),
              Tab(text: 'Maintenance'),
            ],
          ),

          // Tab content
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                LeaseHistoryStepper(
                  isFromResident: true,
                  lease: Lease(
                    id: widget.leaseDetails.leaseId,
                    leaseNumber: widget.leaseDetails.leaseNumber,
                    unitId: widget.leaseDetails.unitId,
                    residentId: widget.leaseDetails.residentId,
                    startDate: widget.leaseDetails.startDate,
                    endDate: widget.leaseDetails.endDate,
                    annualRent: widget.leaseDetails.annualRent,
                    paymentFrequency: PaymentFrequencyParser.fromString(
                      widget.leaseDetails.paymentFrequency,
                    ),
                    createdAt: widget.leaseDetails.startDate,
                    updatedAt: widget.leaseDetails.startDate,
                  ),
                  currentUserId: authentication.profile?.id ?? '',
                ),

                ResidentMaintenanceTab(unitId: widget.leaseDetails.unitId),
              ],
            ),
          ),
        ],
      ),

      // Show the action button only on Maintenance
      floatingActionButton: _selectedIndex == 1
          ? FloatingAddButton(
              title: 'Request Maintenance',
              onTap: () {
                final lease = widget.leaseDetails;

                final unit = Unit(
                  id: lease.unitId,
                  communityId: lease.communityId,
                  name: lease.unitName,
                  area: "",
                  description: '',
                  createdAt: lease.startDate,
                  updatedAt: lease.startDate,
                );

                final community = Community(
                  id: lease.communityId,
                  orgId: '',
                  developmentType: "",
                  communityType: "",
                  name: lease.communityName,
                  address: '',
                  description: '',
                  createdAt: lease.startDate,
                  updatedAt: lease.startDate,
                );

                context.push(
                  RouterPath.addMaintenance,
                  extra: AddMaintenanceArgs(unit: unit, community: community),
                );
              },
            )
          : null,
    );
  }
}
