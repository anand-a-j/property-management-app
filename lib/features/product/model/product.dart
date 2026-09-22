// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce/hive.dart';

part 'product.freezed.dart';
part 'product.g.dart';

@freezed
@HiveType(typeId: 3, adapterName: 'ProductAdapter')
abstract class Product with _$Product {
  @JsonSerializable(explicitToJson: true)
  const factory Product({
    @HiveField(0) String? id,

    @HiveField(1) @JsonKey(name: 'store_id') String? storeId,

    @HiveField(2) String? name,

    @HiveField(3) String? description,

    @HiveField(4) double? price,

    @HiveField(5) @JsonKey(name: 'sale_price') double? salePrice,

    @HiveField(6) @JsonKey(name: 'image_url') String? imageUrl,
    @HiveField(7) @JsonKey(name: 'image_path') String? imagePath,

    @HiveField(8) @JsonKey(name: 'sort_order') @Default(0) int sortOrder,

    @HiveField(9) @JsonKey(name: 'created_at') DateTime? createdAt,

    @HiveField(10) DateTime? updatedAt,
  }) = _Product;

  const Product._();

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}
