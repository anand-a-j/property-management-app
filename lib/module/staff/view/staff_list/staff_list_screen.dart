import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:naseem/core/enum/sign_up_type.dart';

import '../../../../core/core.dart';
import '../../../../core/widgets/empty_state_view.dart';
import '../../../../core/widgets/error_state_view.dart';
import '../../../../routes/router_path.dart';
import '../../../auth/core/controller/service/auth_service.dart';
import '../../controller/stafff_bloc/staff_bloc.dart';
import 'widgets/staff_card.dart';

class StaffListScreen extends StatefulWidget {
  const StaffListScreen({super.key, required this.isSelectionMode});

  final bool isSelectionMode;

  @override
  State<StaffListScreen> createState() => _StaffListScreenState();
}

class _StaffListScreenState extends State<StaffListScreen> {
  List<String> get _staffRoles {
    return widget.isSelectionMode
        ? ['maintenance']
        : ['security', 'maintenance'];
  }

  void _fetchStaffs() {
    context.read<StaffBloc>().add(
      FetchStaffs(
        orgId: authentication.profile?.orgId ?? '',
        roles: _staffRoles,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _fetchStaffs();
  }

  void _retry() {
    _fetchStaffs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Staffs', leadingOnTap: () => context.pop()),
      body: Column(
        children: [
          SearchTextField(title: 'Search Staffs', onChanged: (query) {}),

          const SizedBox(height: AppConsts.pMedium),

          Expanded(
            child: BlocBuilder<StaffBloc, StaffState>(
              builder: (context, state) {
                if (state is StaffLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (state is StaffSuccess) {
                  if (state.staffs.isEmpty) {
                    return const EmptyStateView(
                      message: 'No staff members found.',
                    );
                  }

                  return ListView.builder(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppConsts.pSide,
                    ),
                    itemCount: state.staffs.length,
                    itemBuilder: (context, index) {
                      final staff = state.staffs[index];

                      return GestureDetector(
                        onTap: () {
                          if (widget.isSelectionMode) {
                            context.pop(staff);
                          }
                        },
                        child: StaffCard(profile: staff, index: index),
                      );
                    },
                  );
                }

                if (state is StaffFailed) {
                  return ErrorStateView(
                    retryOnTap: _retry,
                    message: state.error,
                  );
                }

                return const SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
      floatingActionButton: widget.isSelectionMode
          ? null
          : FloatingAddButton(
              title: 'Add Staff',
              onTap: () {
                context.push(
                  RouterPath.signUp,
                  extra: {'type': SignUpType.staff},
                );
              },
            ),
    );
  }
}
