import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/enum/visitor_status.dart';
import '../../../../core/enum/visitor_type.dart';

part 'visitor.freezed.dart';
part 'visitor.g.dart';

@Freezed()
abstract class Visitor with _$Visitor {
  const factory Visitor({
    required String id,

    @JsonKey(name: 'org_id') required String orgId,

    required String name,

    String? phone,

    @JsonKey(name: 'visitor_code') String? visitorCode,

    // Visit schedule
    @JsonKey(name: 'visit_start_at') DateTime? visitStartAt,

    @JsonKey(name: 'visit_end_at') DateTime? visitEndAt,

    // Legacy field
    @JsonKey(name: 'visit_at') DateTime? visitAt,

    // Visit classification
    @JsonKey(unknownEnumValue: VisitType.other)
    @Default(VisitType.other)
    VisitType visitType,

    String? purpose,

    // Unit, resident and lease associations
    @JsonKey(name: 'unit_id') String? unitId,

    @JsonKey(name: 'resident_id') String? residentId,

    @JsonKey(name: 'lease_id') String? leaseId,

    // Parking and document
    @JsonKey(name: 'parking_required') bool? parkingRequired,

    @JsonKey(name: 'document_id') String? documentId,

    // Visitor workflow
    @JsonKey(unknownEnumValue: VisitorStatus.pending)
    @Default(VisitorStatus.pending)
    VisitorStatus status,

    // Audit and approval
    @JsonKey(name: 'created_by') required String createdBy,

    @JsonKey(name: 'approved_by') String? approvedBy,

    @JsonKey(name: 'checked_in_at') DateTime? checkedInAt,

    @JsonKey(name: 'checked_out_at') DateTime? checkedOutAt,

    @JsonKey(name: 'created_at') DateTime? createdAt,

    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _Visitor;

  factory Visitor.fromJson(Map<String, dynamic> json) =>
      _$VisitorFromJson(json);
}
