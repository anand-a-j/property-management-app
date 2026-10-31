import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naseem/core/widgets/error_state_view.dart';

import '../../../../core/widgets/empty_state_view.dart';
import '../controller/bloc/recent_activity_bloc.dart';
import 'recent_activity_card.dart';

class RecentActivityList extends StatelessWidget {
  const RecentActivityList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecentActivityBloc, RecentActivityState>(
      builder: (context, state) {
        if (state is RecentActivityLoading || state is RecentActivityInitial) {
          return Center(child: CircularProgressIndicator());
        }

        if (state is RecentActivityFailed) {
          return ErrorStateView(
            message: state.message,
            retryOnTap: () {
              context.read<RecentActivityBloc>().add(
                const RefreshRecentActivities(),
              );
            },
          );
        }

        if (state is RecentActivitySuccess) {
          final activities = state.activities;

          if (activities.isEmpty) {
            return const EmptyStateView(
              isHalf: true,
              message:
                  'No recent activity yet. Activity will appear here as things happen.',
            );
          }

          return Column(
            children: [
              for (int index = 0; index < activities.length; index++) ...[
                RecentActivityCard(recentActivity: activities[index]),

                if (index != activities.length - 1) const SizedBox(height: 12),
              ],
            ],
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
