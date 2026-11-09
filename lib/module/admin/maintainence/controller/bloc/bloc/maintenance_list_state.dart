part of 'maintenance_list_bloc.dart';

abstract class MaintenanceListState extends Equatable {
  const MaintenanceListState();

  @override
  List<Object?> get props => [];
}

class MaintenanceListInitial extends MaintenanceListState {
  const MaintenanceListInitial();

  @override
  List<Object?> get props => [];
}

class MaintenanceListLoading extends MaintenanceListState {
  const MaintenanceListLoading();
}

class MaintenanceListSuccess extends MaintenanceListState {
  final List<MaintenanceRequest> maintenanceList;
  final bool hasMore;
  final bool isLoadingMore;
  final String? loadMoreError;

  const MaintenanceListSuccess({
    required this.maintenanceList,
    required this.hasMore,
    required this.isLoadingMore,
    this.loadMoreError,
  });

  @override
  List<Object?> get props => [maintenanceList];
}

class MaintenanceListFailed extends MaintenanceListState {
  final String message;

  const MaintenanceListFailed({required this.message});

  @override
  List<Object?> get props => [message];
}
