import 'package:naseem/module/admin/community/model/community.dart';

import '../../module/admin/lease/model/lease.dart';
import '../../module/admin/payment/model/payment.dart';
import '../../module/admin/unit/model/unit.dart';

class AddPaymentArgs {
  final Lease? lease;
  final Unit? unit;
  final Community? community;
  final bool isEdit;
  final Payment? payment;

  AddPaymentArgs({
    this.lease,
    this.unit,
    this.community,
    this.isEdit = false,
    this.payment,
  });
}
