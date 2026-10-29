part of 'visitor_bloc.dart';

abstract class VisitorEvent extends Equatable {
  const VisitorEvent();

  @override
  List<Object?> get props => [];
}

class CreateVisitorEvent extends VisitorEvent {
  final CreateVisitor visitor;

  const CreateVisitorEvent({required this.visitor});

  @override
  List<Object?> get props => [visitor];
}

class UpdateVisitorStatusEvent extends VisitorEvent {
  final String id;
  final VisitorStatus status;

  const UpdateVisitorStatusEvent({required this.id, required this.status});

  @override
  List<Object?> get props => [id, status];
}

// UPDATE VISITOR
class UpdateVisitorEvent extends VisitorEvent {
  final String id;
  final String orgId;
  final String name;
  final String? phone;
  final DateTime? visitStartAt;
  final DateTime? visitEndAt;
  final String visitType;
  final String? purpose;
  final bool? parkingRequired;
  final String? unitId;
  final String? residentId;
  final String? leaseId;

  const UpdateVisitorEvent({
    required this.id,
    required this.orgId,
    required this.name,
    this.phone,
    required this.visitStartAt,
    required this.visitEndAt,
    required this.visitType,
    this.purpose,
    required this.parkingRequired,
    this.unitId,
    this.residentId,
    this.leaseId,
  });

  @override
  List<Object?> get props => [
    id,
    orgId,
    name,
    phone,
    visitStartAt,
    visitEndAt,
    visitType,
    purpose,
    parkingRequired,
    unitId,
    residentId,
    leaseId,
  ];
}

// DELETE VISITOR
class DeleteVisitorEvent extends VisitorEvent {
  final String id;
  final String orgId;

  const DeleteVisitorEvent(this.id, this.orgId);

  @override
  List<Object?> get props => [id, orgId];
}
