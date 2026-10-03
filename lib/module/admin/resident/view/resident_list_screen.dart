import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:naseem/core/widgets/error_state_view.dart';
import 'package:naseem/module/admin/resident/view/widgets/resident_card.dart';
import 'package:naseem/module/auth/core/controller/service/auth_service.dart';

import '../../../../core/core.dart';
import '../../../../core/enum/sign_up_type.dart';
import '../../../../core/widgets/empty_state_view.dart';
import '../../../../routes/router_path.dart';
import '../controller/bloc/resident_bloc.dart';

class ResidentListScreen extends StatefulWidget {
  const ResidentListScreen({super.key});

  @override
  State<ResidentListScreen> createState() => _ResidentListScreenState();
}

class _ResidentListScreenState extends State<ResidentListScreen> {
  @override
  void initState() {
    super.initState();

    context.read<ResidentBloc>().add(
      FetchResidents(orgId: authentication.profile?.orgId ?? ""),
    );
  }

  void _retry() {
    context.read<ResidentBloc>().add(
      FetchResidents(orgId: authentication.profile?.orgId ?? ""),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Residents'),
      body: Column(
        children: [
          SearchTextField(title: "Search Residents", onChanged: (query) {}),

          const SizedBox(height: AppConsts.pMedium),

          Expanded(
            child: BlocBuilder<ResidentBloc, ResidentState>(
              builder: (context, state) {
                if (state is ResidentLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (state is ResidentSuccess) {
                  if (state.residents.isEmpty) {
                    return const EmptyStateView(message: 'No residents found.');
                  }

                  return ListView.builder(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppConsts.pSide,
                    ),
                    itemCount: state.residents.length,
                    itemBuilder: (context, index) {
                      final resident = state.residents[index];

                      return ResidentCard(profile: resident);
                    },
                  );
                }

                if (state is ResidentFailed) {
                  return ErrorStateView(
                    retryOnTap: () {
                      _retry();
                    },
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
        title: 'Add Resident',
        onTap: () {
          context.push(RouterPath.signUp, extra: {'type': SignUpType.resident});
        },
      ),
    );
  }
}
