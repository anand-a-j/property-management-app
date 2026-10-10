import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naseem/core/core.dart';
import 'package:naseem/core/widgets/widgets.dart';
import 'package:naseem/module/auth/core/controller/service/auth_service.dart';

import '../../../../../../core/extension/common.dart';
import '../../../../../../core/widgets/empty_state_view.dart';
import '../../../../../../core/widgets/error_state_view.dart';
import '../../../../../../core/widgets/load_more_button.dart';
import '../../../../../../core/widgets/stats_card.dart';
import '../../../controller/bloc/payment_bloc.dart';
import '../../widgets/payment_card.dart';

class PaymentListScreen extends StatefulWidget {
  const PaymentListScreen({super.key});

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
    context.read<PaymentBloc>().add(
      FetchPaymentsEvent(orgId: authentication.profile?.orgId ?? ""),
    );
  }

  void _loadMore() {
    context.read<PaymentBloc>().add(
      LoadMorePayments(orgId: authentication.profile?.orgId ?? ""),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Payments',
        leadingOnTap: () => Navigator.pop(context),
      ),
      body: AppHorizontalPadding(
        child: Column(
          children: [
            // Stats cards remain unchanged.
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 20,
              children: [
                Expanded(
                  child: StatCard(
                    title: 'Rent Collected',
                    value: '0',
                    borderColor: context.surface,
                    titleColor: context.secondary,
                    valueColor: context.primary,
                  ),
                ),
                Expanded(
                  child: StatCard(
                    title: 'Due',
                    value: '0',
                    borderColor: context.surface,
                    titleColor: context.secondary,
                    valueColor: Colors.red,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 15),

            Expanded(
              child: BlocBuilder<PaymentBloc, PaymentState>(
                builder: (context, state) {
                  // Initial loading
                  if (state is PaymentLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  // Error
                  if (state is PaymentFailed) {
                    return ErrorStateView(
                      retryOnTap: _fetchPayments,
                      message: state.message,
                    );
                  }

                  // Success with paginated payments
                  if (state is PaymentListLoadSuccess) {
                    final payments = state.payments;

                    // Empty state
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

                          return LoadMoreButton(
                            onTap: () {
                              if (!state.isLoadingMore) {
                                _loadMore();
                              }
                            },
                          );
                        }

                        final payment = payments[index];

                        // Replace PaymentCard with your actual
                        // payment item widget if its name differs.
                        return PaymentCard(payment: payment, onTap: () {});
                      },
                    );
                  }

                  return const SizedBox.shrink();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
