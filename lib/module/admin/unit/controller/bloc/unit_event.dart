part of 'unit_bloc.dart';

abstract class UnitEvent extends Equatable {
  const UnitEvent();

  @override
  List<Object?> get props => [];
}
class GetUnits extends UnitEvent {
  final String communityId;
  final int page;
  final int limit;
  final String? searchQuery;

  GetUnits({
    required this.communityId,
    this.page = 1,
    this.limit = 20,
    this.searchQuery,
  });
}

class LoadMoreUnits extends UnitEvent {
  final String communityId;

  LoadMoreUnits({required this.communityId});
}

class SearchUnits extends UnitEvent {
  final String communityId;
  final String searchQuery;

  SearchUnits({required this.communityId, required this.searchQuery});
}

class AddUnit extends UnitEvent {
  final String communityId;
  final String name;
  final String area;
  final String description;

  const AddUnit({
    required this.communityId,
    required this.name,
    required this.area,
    required this.description,
  });

  @override
  List<Object> get props => [communityId, name, area, description];
}

class UpdateUnit extends UnitEvent {
  final String unitId;
  final String communityId;
  final String name;
  final String area;
  final String description;

  const UpdateUnit({
    required this.unitId,
    required this.communityId,
    required this.name,
    required this.area,
    required this.description,
  });

  @override
  List<Object> get props => [unitId, communityId, name, area, description];
}

class DeleteUnit extends UnitEvent {
  final String unitId;
  final String communityId;

  const DeleteUnit({required this.unitId, required this.communityId});

  @override
  List<Object> get props => [unitId, communityId];
}
