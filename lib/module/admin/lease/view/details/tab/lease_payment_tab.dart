import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naseem/core/utils/snackbar_manager.dart';

import '../../../../../../core/core.dart';
import '../../../../../../core/widgets/empty_state_view.dart';
import '../../../../../../core/widgets/error_state_view.dart';
import '../../../../../../core/widgets/load_more_button.dart';
import '../../../../payment/controller/bloc/bloc/payment_list_bloc.dart'
    show
        PaymentListLoadSuccess,
        PaymentListFailed,
        PaymentListState,
        PaymentListBloc,
        PaymentListLoading,
        PaymentListInitial,
        LoadMorePayments,
        FetchPaymentsEvent;
import '../../../../payment/controller/bloc/payment_bloc.dart';
import '../../../../payment/view/dialog/payment_status_update_dialog.dart';
import '../../../../payment/view/widgets/payment_card.dart';

class LeasePaymentsTab extends StatefulWidget {
  const LeasePaymentsTab({
    super.key,
    required this.orgId,
    required this.leaseId,
  });

  final String orgId;
  final String leaseId;

  @override
  State<LeasePaymentsTab> createState() => _LeasePaymentsTabState();
}

class _LeasePaymentsTabState extends State<LeasePaymentsTab> {
  @override
  void initState() {
    super.initState();
    _fetchPayments();
  }

  void _fetchPayments() {
    context.read<PaymentListBloc>().add(
      FetchPaymentsEvent(orgId: widget.orgId, leaseId: widget.leaseId),
    );
  }

  void _loadMore() {
    context.read<PaymentListBloc>().add(
      LoadMorePayments(orgId: widget.orgId, leaseId: widget.leaseId),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PaymentBloc, PaymentState>(
      listener: (context, state) {
        if (state is PaymentStatusUpdated) {
          Snack.success("Payment status updated");
          _fetchPayments();
        } else if (state is PaymentFailed) {
          Snack.error(state.message);
        }
      },
      child: BlocBuilder<PaymentListBloc, PaymentListState>(
        builder: (context, state) {
          if (state is PaymentListInitial || state is PaymentListLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is PaymentListFailed) {
            return ErrorStateView(
              retryOnTap: _fetchPayments,
              message: state.message,
            );
          }

          if (state is PaymentListLoadSuccess) {
            final payments = state.payments;

            if (payments.isEmpty) {
              return const EmptyStateView(
                message: 'No payments found for this lease',
              );
            }

            return ListView.builder(
              padding: const EdgeInsets.fromLTRB(
                AppConsts.pSide,
                15,
                AppConsts.pSide,
                0,
              ),
              itemCount: payments.length + 1,
              itemBuilder: (context, index) {
                if (index == payments.length) {
                  if (!state.hasMore) {
                    return const SizedBox(height: 20);
                  }

                  if (state.isLoadingMore) {
                    return const Padding(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: Center(child: CircularProgressIndicator()),
                    );
                  }

                  return LoadMoreButton(onTap: _loadMore);
                }

                final payment = payments[index];

                return PaymentCard(
                  payment: payment,
                  onTap: () {
                    showPaymentStatusUpdateDialog(context, payment);
                  },
                );
              },
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
