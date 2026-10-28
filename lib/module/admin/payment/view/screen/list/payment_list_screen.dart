import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naseem/core/core.dart';
import 'package:naseem/module/admin/payment/view/dialog/payment_status_update_dialog.dart';
import 'package:naseem/module/auth/core/controller/service/auth_service.dart';

import '../../../../../../core/utils/snackbar_manager.dart';
import '../../../../../../core/widgets/empty_state_view.dart';
import '../../../../../../core/widgets/error_state_view.dart';
import '../../../../../../core/widgets/load_more_button.dart';
import '../../../../../../core/widgets/stats_card.dart';
import '../../../controller/bloc/bloc/payment_list_bloc.dart';
import '../../../controller/bloc/payment_bloc.dart';
import '../../widgets/payment_card.dart';

class PaymentListScreen extends StatefulWidget {
  const PaymentListScreen({
    super.key,
    required this.isFromResident,
    required this.leaseId,
  });

  final bool isFromResident;
  final String? leaseId;

  @override
  State<PaymentListScreen> createState() => _PaymentListScreenState();
}

class _PaymentListScreenState extends State<PaymentListScreen> {
  @override
  void initState() {
    super.initState();
    _fetchPayments();
  }

  void _fetchPayments() {
    final orgId = authentication.profile?.orgId ?? '';
    final leaseId = widget.leaseId?.trim();

    log('payments: $orgId $leaseId');

    if (widget.isFromResident && (leaseId == null || leaseId.isEmpty)) {
      return;
    }

    context.read<PaymentListBloc>().add(
      FetchPaymentsEvent(
        orgId: orgId,
        leaseId: widget.isFromResident ? leaseId : null,
      ),
    );
  }

  void _loadMore() {
    context.read<PaymentListBloc>().add(
      LoadMorePayments(
        orgId: authentication.profile?.orgId ?? '',
        leaseId: widget.isFromResident ? widget.leaseId : null,
      ),
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
      child: Scaffold(
        appBar: CustomAppBar(title: 'Payments'),
        body: Column(
          children: [
            if (!widget.isFromResident) ...[
              AppHorizontalPadding(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 20,
                  children: [
                    Expanded(
                      child: StatCard(
                        title: 'Rent Collected',
                        icon: Icons.account_balance_wallet_outlined,
                        iconColor: Colors.teal,
                        value: '0',
                        borderColor: context.surface,
                        titleColor: context.secondary,
                        valueColor: context.primary,
                      ),
                    ),
                    Expanded(
                      child: StatCard(
                        title: 'Due',
                        icon: Icons.event_busy_outlined,
                        iconColor: Colors.red,
                        value: '0',
                        borderColor: context.surface,
                        titleColor: context.secondary,
                        valueColor: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
            ],

            const SizedBox(height: 15),

            Expanded(
              child: BlocBuilder<PaymentListBloc, PaymentListState>(
                builder: (context, state) {
                  // Initial state and initial loading
                  if (state is PaymentListInitial ||
                      state is PaymentListLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  // Error state
                  if (state is PaymentListFailed) {
                    return ErrorStateView(
                      retryOnTap: _fetchPayments,
                      message: state.message,
                    );
                  }

                  // Loaded payment list
                  if (state is PaymentListLoadSuccess) {
                    final payments = state.payments;

                    if (payments.isEmpty) {
                      return const EmptyStateView(message: 'No payments found');
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
                        // Pagination footer
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
                            if (!widget.isFromResident) {
                              showPaymentStatusUpdateDialog(context, payment);
                            }
                          },
                        );
                      },
                    );
                  }

                  return const EmptyStateView(message: 'No payments found');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
