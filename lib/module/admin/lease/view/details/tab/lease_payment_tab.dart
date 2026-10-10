import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/core.dart';
import '../../../../../../core/widgets/empty_state_view.dart';
import '../../../../../../core/widgets/error_state_view.dart';
import '../../../../../../core/widgets/load_more_button.dart';
import '../../../../payment/controller/bloc/payment_bloc.dart';
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
    context.read<PaymentBloc>().add(
      FetchPaymentsEvent(orgId: widget.orgId, leaseId: widget.leaseId),
    );
  }

  void _loadMore() {
    context.read<PaymentBloc>().add(
      LoadMorePayments(orgId: widget.orgId, leaseId: widget.leaseId),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentBloc, PaymentState>(
      builder: (context, state) {
        if (state is PaymentLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is PaymentFailed) {
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

                return LoadMoreButton(
                  onTap: () {
                    if (!state.isLoadingMore) {
                      _loadMore();
                    }
                  },
                );
              }

              final payment = payments[index];

              return PaymentCard(
                payment: payment,
                onTap: () {
                  // Open payment details if needed.
                },
              );
            },
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
