import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:naseem/module/admin/unit/model/unit.dart';

import '../../../../core/enum/unit_status.dart';

part 'unit_list_item.freezed.dart';
part 'unit_list_item.g.dart';

@freezed
abstract class UnitListItem with _$UnitListItem {
  const factory UnitListItem({
    required String id,

    @JsonKey(name: 'community_id') required String communityId,

    required String name,
    required String area,
    required String? description,

    required UnitStatus? status,

    @JsonKey(name: 'unit_type') String? unitType,

    @JsonKey(name: 'resident_name') String? residentName,

    @JsonKey(name: 'lease_id') String? leaseId,

    @JsonKey(name: 'created_at') required DateTime createdAt,

    @JsonKey(name: 'updated_at') required DateTime? updatedAt,
  }) = _UnitListItem;

  factory UnitListItem.fromJson(Map<String, dynamic> json) =>
      _$UnitListItemFromJson(json);
}

extension UnitListItemMapper on UnitListItem {
  Unit toUnit() {
    return Unit(
      id: id,
      communityId: communityId,
      name: name,
      area: area,
      description: description??"",
      status: status,
      createdAt: createdAt,
      updatedAt: updatedAt,
      unitType: unitType,
      
    );
  }
}
