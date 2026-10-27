import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_visitor.freezed.dart';
part 'create_visitor.g.dart';

@freezed
abstract class CreateVisitor with _$CreateVisitor {
  const factory CreateVisitor({
    @JsonKey(name: 'org_id') required String orgId,

    required String name,

    String? phone,

    // Visit schedule
    @JsonKey(name: 'visit_start_at') DateTime? visitStartAt,

    @JsonKey(name: 'visit_end_at') DateTime? visitEndAt,

    @JsonKey(name: 'checked_in_at') DateTime? checkedInAt,

    @JsonKey(name: 'checked_out_at') DateTime? checkedOutAt,


    // Visit classification
    @JsonKey(name: 'visit_type') required String visitType,

    String? purpose,

    // Associations
    @JsonKey(name: 'unit_id') String? unitId,

    @JsonKey(name: 'resident_id') String? residentId,

    @JsonKey(name: 'lease_id') String? leaseId,

    // Parking and optional document
    @JsonKey(name: 'parking_required') @Default(false) bool parkingRequired,

    // @JsonKey(name: 'document_id') String? documentId,

    // Creator
    @JsonKey(name: 'created_by') required String createdBy,
  }) = _CreateVisitor;

  factory CreateVisitor.fromJson(Map<String, dynamic> json) =>
      _$CreateVisitorFromJson(json);
}
