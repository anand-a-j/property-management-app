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
  final List<Unit> units;
  final bool hasMore;
  final bool isLoadingMore;

  const UnitLoadSuccess({
    required this.units,
    this.hasMore = true,
    this.isLoadingMore = false,
  });
}

class UnitListFailed extends UnitListState {
  final String message;

  const UnitListFailed(this.message);

  @override
  List<Object> get props => [message];
}
