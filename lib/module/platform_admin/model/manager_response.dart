import 'package:freezed_annotation/freezed_annotation.dart';

import '../../auth/core/model/profile.dart';

part 'manager_response.freezed.dart';
part 'manager_response.g.dart';

@freezed
abstract class ManagerResponse with _$ManagerResponse {
  const factory ManagerResponse({
    required List<Profile> managers,
    required int totalManagers,
    required int activeUsers,
    required int totalUsers,
  }) = _ManagerResponse;

  factory ManagerResponse.fromJson(Map<String, dynamic> json) =>
      _$ManagerResponseFromJson(json);
}
