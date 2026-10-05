part of 'unit_bloc.dart';

abstract class UnitState extends Equatable {
  const UnitState();

  @override
  List<Object?> get props => [];
}

class UnitInitial extends UnitState {
  const UnitInitial();
}

class UnitLoading extends UnitState {
  const UnitLoading();
}

class UnitLoadSuccess extends UnitState {
  final List<Unit> units;
  final bool hasMore;
  final bool isLoadingMore;

  const UnitLoadSuccess({
    required this.units,
    this.hasMore = true,
    this.isLoadingMore = false,
  });
}

class UnitAddSuccess extends UnitState {
  final Unit unit;

  const UnitAddSuccess(this.unit);

  @override
  List<Object> get props => [unit];
}

class UnitUpdateSuccess extends UnitState {
  final Unit unit;

  const UnitUpdateSuccess(this.unit);

  @override
  List<Object> get props => [unit];
}

class UnitDeleteSuccess extends UnitState {
  const UnitDeleteSuccess();
}

class UnitFailed extends UnitState {
  final String message;

  const UnitFailed(this.message);

  @override
  List<Object> get props => [message];
}
