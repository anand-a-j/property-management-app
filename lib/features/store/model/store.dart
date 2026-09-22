// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce/hive.dart';

part 'store.freezed.dart';
part 'store.g.dart';

@freezed
@HiveType(typeId: 2, adapterName: 'StoreAdapter')
abstract class Store with _$Store {
  const factory Store({
    @HiveField(0) required String id,

    @JsonKey(name: 'user_id')
    @HiveField(1)
    required String userId,

    @HiveField(2)
    required String name,

    @JsonKey(name: 'store_slug')
    @HiveField(3)
    required String storeSlug,

    @JsonKey(name: 'logo_url')
    @HiveField(4)
    String? logoUrl,

    @JsonKey(name: 'logo_path')
    @HiveField(5)
    String? logoPath,

    @HiveField(6)
    String? description,

    @JsonKey(name: 'whatsapp_number')
    @HiveField(7)
    required String whatsappNumber,

    @JsonKey(name: 'primary_color')
    @HiveField(8)
    @Default("f2f3dd")
    String primaryColor,

    @JsonKey(name: 'created_at')
    @HiveField(9)
    required DateTime createdAt,

    @JsonKey(name: 'delivery_type')
    @HiveField(10)
    @Default('fixed')
    String deliveryType,

    @JsonKey(name: 'delivery_charge')
    @HiveField(11)
    @Default(0)
    num deliveryCharge,

    @JsonKey(name: 'free_delivery_above')
    @HiveField(12)
    num? freeDeliveryAbove,
  }) = _Store;

  factory Store.fromJson(Map<String, dynamic> json) =>
      _$StoreFromJson(json);
}