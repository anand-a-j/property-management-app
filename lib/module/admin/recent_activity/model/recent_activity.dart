import 'package:freezed_annotation/freezed_annotation.dart';

part 'recent_activity.freezed.dart';
part 'recent_activity.g.dart';

@freezed
abstract class RecentActivity with _$RecentActivity {
  const factory RecentActivity({
    @JsonKey(name: 'activity_type') String? activityType,

    String? title,

    String? description,

    @JsonKey(name: 'activity_at') DateTime? activityAt,

    @JsonKey(name: 'due_date') DateTime? dueDate,

    @JsonKey(name: 'reference_id') String? referenceId,

    @JsonKey(name: 'unit_name') String? unitName,

    @JsonKey(name: 'community_name') String? communityName,

    String? status,
  }) = _RecentActivity;

  factory RecentActivity.fromJson(Map<String, dynamic> json) =>
      _$RecentActivityFromJson(json);
}
