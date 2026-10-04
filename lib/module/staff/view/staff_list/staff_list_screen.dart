import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:naseem/core/enum/sign_up_type.dart';

import '../../../../core/core.dart';
import '../../../../core/widgets/empty_state_view.dart';
import '../../../../core/widgets/error_state_view.dart';
import '../../../../routes/router_path.dart';
import '../../../auth/core/controller/service/auth_service.dart';
import '../../controller/bloc/staff_bloc.dart';
import 'widgets/staff_card.dart';

class StaffListScreen extends StatefulWidget {
  const StaffListScreen({super.key});

  @override
  State<StaffListScreen> createState() => _StaffListScreenState();
}

class _StaffListScreenState extends State<StaffListScreen> {
  @override
  void initState() {
    super.initState();

    context.read<StaffBloc>().add(
      FetchStaffs(orgId: authentication.profile?.orgId ?? ""),
    );
  }

  void _retry() {
    context.read<StaffBloc>().add(
      FetchStaffs(orgId: authentication.profile?.orgId ?? ""),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Staffs'),
      body: Column(
        children: [
          SearchTextField(title: "Search Staffs", onChanged: (query) {}),

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

                      return StaffCard(profile: staff);
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
      floatingActionButton: FloatingAddButton(
        title: 'Add Staff',
        onTap: () {
          context.push(RouterPath.signUp, extra: {'type': SignUpType.staff});
        },
      ),
    );
  }
}
