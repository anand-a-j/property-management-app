part of 'recent_activity_bloc.dart';

abstract class RecentActivityState extends Equatable {
  const RecentActivityState();

  @override
  List<Object?> get props => [];
}

class RecentActivityInitial extends RecentActivityState {
  const RecentActivityInitial();
}

class RecentActivityLoading extends RecentActivityState {
  const RecentActivityLoading();
}

class RecentActivitySuccess extends RecentActivityState {
  const RecentActivitySuccess({required this.activities});

  final List<RecentActivity> activities;

  @override
  List<Object?> get props => [activities];
}

class RecentActivityFailed extends RecentActivityState {
  const RecentActivityFailed(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}
