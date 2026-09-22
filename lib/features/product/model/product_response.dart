import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:habitroot/features/product/model/product.dart';

part 'product_response.freezed.dart';
part 'product_response.g.dart';

@freezed
abstract class ProductResponse with _$ProductResponse {
  const factory ProductResponse({
    @Default([]) List<Product> products,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'total_count') @Default(0) int totalCount,
  }) = _ProductResponse;

  factory ProductResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductResponseFromJson(json);
}
