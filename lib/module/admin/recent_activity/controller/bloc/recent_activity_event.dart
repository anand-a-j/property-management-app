part of 'recent_activity_bloc.dart';

abstract class RecentActivityEvent extends Equatable {
  const RecentActivityEvent();

  @override
  List<Object?> get props => [];
}

class GetRecentActivities extends RecentActivityEvent {
  const GetRecentActivities();
}

class RefreshRecentActivities extends RecentActivityEvent {
  const RefreshRecentActivities();
}
