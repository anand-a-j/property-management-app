import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/enum/visitor_type.dart';

part 'create_visitor.freezed.dart';
part 'create_visitor.g.dart';

@freezed
abstract class CreateVisitor with _$CreateVisitor {
  const factory CreateVisitor({
    @JsonKey(name: 'org_id') required String orgId,
    required String name,
    String? phone,
    @JsonKey(name: 'visit_at') required DateTime visitAt,
    @JsonKey(name: 'visit_type') required VisitType visitType,
    String? purpose,
    @JsonKey(name: 'unit_id') String? unitId,
    @JsonKey(name: 'created_by') required String createdBy,
  }) = _CreateVisitor;

  factory CreateVisitor.fromJson(Map<String, dynamic> json) =>
      _$CreateVisitorFromJson(json);
}
