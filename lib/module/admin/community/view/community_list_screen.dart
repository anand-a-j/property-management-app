import 'dart:async';

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
import '../../../../core/widgets/load_more_button.dart';

class CommunityListScreen extends StatefulWidget {
  const CommunityListScreen({super.key});

  @override
  State<CommunityListScreen> createState() => _CommunityListScreenState();
}

class _CommunityListScreenState extends State<CommunityListScreen> {
  Timer? _debounce;

  String _searchQuery = '';

  static const Duration _debounceDuration = Duration(milliseconds: 400);

  CommunityListingBloc get _listingBloc => context.read<CommunityListingBloc>();

  @override
  void initState() {
    super.initState();

    _listingBloc.add(const GetCommunities());
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  void _onSearchChanged(String query) {
    _searchQuery = query.trim();

    _debounce?.cancel();

    _debounce = Timer(_debounceDuration, () {
      if (!mounted) return;

      _listingBloc.add(SearchCommunities(searchQuery: _searchQuery));
    });
  }

  // REFRESH / RETRY
  void _retry() {
    _debounce?.cancel();

    _listingBloc.add(GetCommunities(searchQuery: _searchQuery));
  }

  Future<void> _refresh() async {
    _debounce?.cancel();

    final refreshFuture = _listingBloc.stream.firstWhere(
      (state) =>
          state is CommunityListingSuccess || state is CommunityListingFailed,
    );

    _listingBloc.add(GetCommunities(searchQuery: _searchQuery));

    await refreshFuture;
  }

  // LOAD MORE
  void _loadMore() {
    if (!mounted) return;

    _listingBloc.add(LoadMoreCommunities());
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
            SearchTextField(
              title: 'Search Communities',
              onChanged: _onSearchChanged,
            ),

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

                    final showFooter =
                        state.hasMore ||
                        state.isLoadingMore ||
                        state.loadMoreError != null;
                    return RefreshIndicator(
                      onRefresh: _refresh,
                      child: ListView.builder(
                        physics: const AlwaysScrollableScrollPhysics(),
                        padding: const EdgeInsets.fromLTRB(
                          AppConsts.pSide,
                          15,
                          AppConsts.pSide,
                          16,
                        ),
                        itemCount: communities.length + 1,
                        itemBuilder: (context, index) {
                          // COMMUNITY ITEM
                          if (index < communities.length) {
                            final community = communities[index];

                            return GestureDetector(
                              onTap: () {
                                MoreOptionsBottomSheet.show(
                                  context: context,
                                  items: [
                                    MoreOptionItem(
                                      title: 'View Units',
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
                                      icon: Icons.delete_outline_rounded,
                                      isDestructive: true,
                                      confirmTitle: 'Delete Community?',
                                      confirmMessage:
                                          'Are you sure you want to delete ${community.name}?',
                                      onTap: () async {
                                        context.read<CommunityBloc>().add(
                                          DeleteCommunity(
                                            id: community.id ?? '',
                                          ),
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
                          }

                          // PAGINATION FOOTER
                          if (state.isLoadingMore) {
                            return const Padding(
                              padding: EdgeInsets.symmetric(vertical: 16),
                              child: Center(child: CircularProgressIndicator()),
                            );
                          }

                          if (state.loadMoreError != null) {
                            return LoadMoreButton(
                              onTap: _loadMore,
                              title: 'Retry',
                              isError: true,
                            );
                          }

                          if (!state.hasMore) {
                            return const SizedBox.shrink();
                          }

                          return Center(
                            child: LoadMoreButton(
                              onTap: _loadMore,
                              isLoading: false,
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
