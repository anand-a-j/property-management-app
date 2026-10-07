import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/enum/payment_status.dart';
import '../../../../core/enum/payment_type.dart';

part 'payment.freezed.dart';
part 'payment.g.dart';

@freezed
abstract class Payment with _$Payment {
  const factory Payment({
    required String id,
    @JsonKey(name: 'payment_number') required String paymentNumber,
    @JsonKey(name: 'lease_id') required String leaseId,
    @JsonKey(name: 'due_date') required DateTime dueDate,
    required double amount,
    @JsonKey(name: 'payment_type') required PaymentType paymentType,
    @Default(PaymentStatus.pending) PaymentStatus status,
    @JsonKey(name: 'paid_date') DateTime? paidDate,
    @JsonKey(name: 'cheque_number') String? chequeNumber,
    String? description,
    @JsonKey(name: 'cheque_copy_path') String? chequeCopyPath,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    @JsonKey(name: 'deleted_at') DateTime? deletedAt,
  }) = _Payment;

  factory Payment.fromJson(Map<String, dynamic> json) =>
      _$PaymentFromJson(json);
}
