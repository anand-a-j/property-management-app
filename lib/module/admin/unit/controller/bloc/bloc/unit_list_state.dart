part of 'unit_list_bloc.dart';

abstract class UnitListState extends Equatable {
  const UnitListState();

  @override
  List<Object?> get props => [];
}

class UnitListInitial extends UnitListState {
  const UnitListInitial();
}

class UnitListLoading extends UnitListState {
  const UnitListLoading();
}

class UnitLoadSuccess extends UnitListState {
  const UnitLoadSuccess({
    required this.units,
    required this.hasMore,
    this.isLoadingMore = false,
    this.loadMoreError,
  });

  final List<UnitListItem> units;
  final bool hasMore;
  final bool isLoadingMore;
  final String? loadMoreError;

  @override
  List<Object?> get props => [units, hasMore, isLoadingMore, loadMoreError];
}

class UnitListFailed extends UnitListState {
  final String message;

  const UnitListFailed(this.message);

  @override
  List<Object> get props => [message];
}
