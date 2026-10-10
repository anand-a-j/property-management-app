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
    @JsonKey(name: 'visit_at') required DateTime visitAt,
    @JsonKey(unknownEnumValue: VisitType.other)
    @Default(VisitType.other)
    VisitType visitType,
    String? purpose,
    @JsonKey(name: 'unit_id') String? unitId,
    @JsonKey(unknownEnumValue: VisitorStatus.pending)
    @Default(VisitorStatus.pending)
    VisitorStatus status,
    @JsonKey(name: 'created_by') required String createdBy,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _Visitor;

  factory Visitor.fromJson(Map<String, dynamic> json) =>
      _$VisitorFromJson(json);
}
