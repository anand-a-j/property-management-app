import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naseem/core/widgets/empty_state_view.dart';
import 'package:naseem/core/widgets/error_state_view.dart';
import 'package:naseem/module/auth/core/controller/service/auth_service.dart';
import 'package:naseem/module/resident/home/view/widgets/resident_dash_card.dart';
import 'package:naseem/module/resident/home/view/widgets/resident_dash_header.dart';

import '../../../../core/bloc/cubit/app_cubit.dart';
import '../controller/bloc/resident_details_bloc.dart';

class ResidentDashboardScreen extends StatefulWidget {
  const ResidentDashboardScreen({super.key});

  @override
  State<ResidentDashboardScreen> createState() =>
      _ResidentDashboardScreenState();
}

class _ResidentDashboardScreenState extends State<ResidentDashboardScreen> {
  @override
  void initState() {
    super.initState();
    _fetchResidentDetails();
  }

  void _fetchResidentDetails() {
    final residentId = authentication.profile?.id ?? "";
    context.read<ResidentDetailsBloc>().add(
      FetchResidentDetails(residentId: residentId),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ResidentDashHeader(),
          BlocBuilder<ResidentDetailsBloc, ResidentDetailsState>(
            builder: (context, state) {
              if (state is ResidentDetailsSuccess) {
                if (state is ResidentDetailsLoading) {
                  return SizedBox(
                    height: 300,
                    child: Center(child: CircularProgressIndicator()),
                  );
                }
                if (state.details.isNotEmpty) {
                  final lease = state.details.first;
                  context.read<AppCubit>().setResidentLeaseContext(
                    leaseId: lease.leaseId,
                    unitId: lease.unitId,
                    communityId: lease.communityId,
                    leaseStartDate: lease.startDate,
                  );
                  return ResidentDashCard();
                }
                return EmptyStateView(
                  message:
                      "No lease details yet. Your unit and lease information will appear here once they're available.",
                  isHalf: true,
                );
              }
      
              if (state is ResidentDetailsFailed) {
                return ErrorStateView(
                  retryOnTap: () {
                    _fetchResidentDetails();
                  },
                  isHalf: true,
                  message: state.message,
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }
}
