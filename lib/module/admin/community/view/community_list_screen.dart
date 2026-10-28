import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:naseem/core/utils/snackbar_manager.dart';
import 'package:naseem/core/widgets/empty_state_view.dart';
import 'package:naseem/core/widgets/error_state_view.dart';
import 'package:naseem/core/widgets/more_options/more_option_item.dart';
import 'package:naseem/core/widgets/more_options/more_options_sheet.dart';
import 'package:naseem/module/admin/community/controller/bloc/bloc/community_listing_bloc.dart';
import 'package:naseem/module/admin/community/controller/bloc/community_bloc.dart';
import 'package:naseem/module/admin/community/view/widgets/community_card.dart';
import 'package:naseem/routes/args/add_community_args.dart';
import 'package:naseem/routes/args/unit_list_args.dart';
import 'package:naseem/routes/router_path.dart';

import '../../../../core/core.dart';

class CommunityListScreen extends StatefulWidget {
  const CommunityListScreen({super.key});

  @override
  State<CommunityListScreen> createState() => _CommunityListScreenState();
}

class _CommunityListScreenState extends State<CommunityListScreen> {
  @override
  void initState() {
    super.initState();

    context.read<CommunityListingBloc>().add(const GetCommunities());
  }

  void _retry() {
    context.read<CommunityListingBloc>().add(const GetCommunities());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CommunityBloc, CommunityState>(
      listener: (context, state) {
        if (state is AddUpdateCommunitySuccess) {
          _retry();
        } else if (state is CommunityFailed) {
          Snack.error(state.message);
        }
      },
      child: Scaffold(
        appBar: const CustomAppBar(title: 'Communities'),
        body: Column(
          children: [
            SearchTextField(title: "Search Communities", onChanged: (query) {}),

            Expanded(
              child: BlocBuilder<CommunityListingBloc, CommunityListingState>(
                builder: (context, state) {
                  if (state is CommunityListingLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (state is CommunityListingSuccess) {
                    final communities = state.communities;

                    if (communities.isEmpty) {
                      return EmptyStateView(message: 'No communities found');
                    }

                    return RefreshIndicator(
                      onRefresh: () async {
                        _retry();
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

                          return GestureDetector(
                            onTap: () {
                              // context.push(
                              //   RouterPath.unitList,
                              //   extra: UnitListArgs(community: community),
                              // );

                              MoreOptionsBottomSheet.show(
                                context: context,
                                items: [
                                  MoreOptionItem(
                                    title: 'View Units',
                                    subtitle: 'View units in this community',
                                    icon: Icons.apartment_outlined,
                                    onTap: () {
                                      context.push(
                                        RouterPath.unitList,
                                        extra: UnitListArgs(
                                          community: community,
                                        ),
                                      );
                                    },
                                  ),
                                  MoreOptionItem(
                                    title: 'Edit Community',
                                    subtitle: 'Update community information',
                                    icon: Icons.edit_outlined,
                                    onTap: () {
                                      context.push(
                                        RouterPath.addCommunity,
                                        extra: AddCommunityArgs(
                                          community: community,
                                          isEdit: true,
                                        ),
                                      );
                                    },
                                  ),
                                  MoreOptionItem(
                                    title: 'Delete Community',
                                    subtitle: 'Delete this community',
                                    icon: Icons.delete_outline_rounded,
                                    isDestructive: true,
                                    confirmTitle: 'Delete Community?',
                                    confirmMessage:
                                        'Are you sure you want to delete ${community.name}?',

                                    onTap: () async {
                                    
                                      context.read<CommunityBloc>().add(
                                        DeleteCommunity(id: community.id ?? ""),
                                      );
                                    },
                                  ),
                                ],
                              );
                            },
                            child: CommunityCard(
                              community: community,
                              index: index,
                            ),
                          );
                        },
                      ),
                    );
                  }

                  if (state is CommunityListingFailed) {
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
      ),
    );
  }
}
