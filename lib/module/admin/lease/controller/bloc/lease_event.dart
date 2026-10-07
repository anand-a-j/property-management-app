part of 'lease_bloc.dart';

abstract class LeaseEvent extends Equatable {
  const LeaseEvent();

  @override
  List<Object?> get props => [];
}

class AddLease extends LeaseEvent {
  final String orgId;
  final String unitId;
  final String residentId;
  final String leaseNumber;
  final DateTime startDate;
  final DateTime endDate;
  final double annualRent;
  final double securityDeposit;
  final String paymentFrequency;
  final int numberOfCheques;
  final String? description;
  final String status;

  const AddLease({
    required this.orgId,
    required this.unitId,
    required this.residentId,
    required this.leaseNumber,
    required this.startDate,
    required this.endDate,
    required this.annualRent,
    required this.securityDeposit,
    required this.paymentFrequency,
    required this.numberOfCheques,
    this.description,
    this.status = 'draft',
  });

  @override
  List<Object?> get props => [
    orgId,
    unitId,
    residentId,
    leaseNumber,
    startDate,
    endDate,
    annualRent,
    securityDeposit,
    paymentFrequency,
    numberOfCheques,
    description,
    status,
  ];
}

class UpdateLease extends LeaseEvent {
  final String leaseId;
  final String? residentId;
  final String? leaseNumber;
  final DateTime? startDate;
  final DateTime? endDate;
  final double? annualRent;
  final double? securityDeposit;
  final String? paymentFrequency;
  final int? numberOfCheques;
  final String? status;
  final String? description;

  const UpdateLease({
    required this.leaseId,
    this.residentId,
    this.leaseNumber,
    this.startDate,
    this.endDate,
    this.annualRent,
    this.securityDeposit,
    this.paymentFrequency,
    this.numberOfCheques,
    this.status,
    this.description,
  });

  @override
  List<Object?> get props => [
    leaseId,
    residentId,
    leaseNumber,
    startDate,
    endDate,
    annualRent,
    securityDeposit,
    paymentFrequency,
    numberOfCheques,
    status,
    description,
  ];
}

class AssignLeaseToUnit extends LeaseEvent {
  final String leaseId;
  final String unitId;

  const AssignLeaseToUnit({required this.leaseId, required this.unitId});

  @override
  List<Object?> get props => [leaseId, unitId];
}

class GetActiveLease extends LeaseEvent {
  final String orgId;
  final String unitId;

  const GetActiveLease({required this.orgId, required this.unitId});

  @override
  List<Object?> get props => [orgId, unitId];
}

class GetLeases extends LeaseEvent {
  final String orgId;
  final String? unitId;
  final String? searchQuery;

  const GetLeases({required this.orgId, this.unitId, this.searchQuery});

  @override
  List<Object?> get props => [orgId, unitId, searchQuery];
}

class LoadMoreLeases extends LeaseEvent {
  const LoadMoreLeases();
}

class SearchLeases extends LeaseEvent {
  final String orgId;
  final String? unitId;
  final String searchQuery;

  const SearchLeases({
    required this.orgId,
    this.unitId,
    required this.searchQuery,
  });

  @override
  List<Object?> get props => [orgId, unitId, searchQuery];
}
