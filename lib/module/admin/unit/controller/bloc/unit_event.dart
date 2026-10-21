part of 'unit_bloc.dart';

abstract class UnitEvent extends Equatable {
  const UnitEvent();

  @override
  List<Object?> get props => [];
}



class AddUnit extends UnitEvent {
  final String communityId;
  final String name;
  final String area;
  final String description;
  final String unitType;

  const AddUnit({
    required this.communityId,
    required this.name,
    required this.area,
    required this.description,
    required this.unitType,
  });

  @override
  List<Object> get props => [communityId, name, area, description, unitType];
}

class UpdateUnit extends UnitEvent {
  final String unitId;
  final String communityId;
  final String name;
  final String area;
  final String description;
  final String unitType;

  const UpdateUnit({
    required this.unitId,
    required this.communityId,
    required this.name,
    required this.area,
    required this.description,
    required this.unitType,
  });

  @override
  List<Object> get props => [
    unitId,
    communityId,
    name,
    area,
    description,
    unitType,
  ];
}

class DeleteUnit extends UnitEvent {
  final String unitId;
  final String communityId;

  const DeleteUnit({required this.unitId, required this.communityId});

  @override
  List<Object> get props => [unitId, communityId];
}
