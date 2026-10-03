import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:naseem/core/widgets/empty_state_view.dart';
import 'package:naseem/core/widgets/error_state_view.dart';
import 'package:naseem/module/admin/community/view/widgets/community_card.dart';
import 'package:naseem/routes/router_path.dart';

import '../../../../core/core.dart';
import '../controller/bloc/community_bloc.dart';

class CommunityListScreen extends StatefulWidget {
  const CommunityListScreen({super.key});

  @override
  State<CommunityListScreen> createState() => _CommunityListScreenState();
}

class _CommunityListScreenState extends State<CommunityListScreen> {
  @override
  void initState() {
    super.initState();

    context.read<CommunityBloc>().add(const GetCommunities());
  }

  void _retry() {
    context.read<CommunityBloc>().add(const GetCommunities());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Communities'),
      body: Column(
        children: [
          SearchTextField(title: "Search Communities", onChanged: (query) {}),

          Expanded(
            child: BlocBuilder<CommunityBloc, CommunityState>(
              builder: (context, state) {
                if (state is CommunityLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (state is CommunitySuccess) {
                  final communities = state.communities;

                  if (communities.isEmpty) {
                    return EmptyStateView(message: 'No communities found');
                  }

                  return RefreshIndicator(
                    onRefresh: () async {
                      context.read<CommunityBloc>().add(const GetCommunities());
                    },
                    child: ListView.builder(
                      padding: const EdgeInsets.fromLTRB(
                        AppConsts.pSide,
                        15,
                        AppConsts.pSide,
                        0,
                      ),
                      itemCount: communities.length,
                      itemBuilder: (context, index) {
                        final community = communities[index];

                        return CommunityCard(community: community);
                      },
                    ),
                  );
                }

                if (state is CommunityFailed) {
                  return ErrorStateView(
                    retryOnTap: _retry,
                    message: state.message,
                  );
                }

                return const SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingAddButton(
        title: 'Add Community',
        onTap: () {
          context.push(RouterPath.addCommunity);
        },
      ),
    );
  }
}
