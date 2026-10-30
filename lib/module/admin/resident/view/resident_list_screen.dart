import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:naseem/core/widgets/error_state_view.dart';
import 'package:naseem/core/widgets/load_more_button.dart';
import 'package:naseem/module/admin/resident/view/widgets/resident_card.dart';
import 'package:naseem/module/auth/core/controller/service/auth_service.dart';

import '../../../../core/core.dart';
import '../../../../core/enum/sign_up_type.dart';
import '../../../../core/widgets/empty_state_view.dart';
import '../../../../routes/args/resident_details_args.dart';
import '../../../../routes/router_path.dart';
import '../../../auth/core/model/profile.dart';
import '../controller/bloc/bloc/residient_list_bloc.dart';
import '../model/resident_list_response.dart';

class ResidentListScreen extends StatefulWidget {
  const ResidentListScreen({super.key, this.isSelectionMode = false});

  final bool isSelectionMode;

  @override
  State<ResidentListScreen> createState() => _ResidentListScreenState();
}

class _ResidentListScreenState extends State<ResidentListScreen> {
  static const Duration _debounceDuration = Duration(milliseconds: 500);

  Timer? _debounceTimer;

  late final TextEditingController _searchController;

  @override
  void initState() {
    super.initState();

    _searchController = TextEditingController();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;

      _fetchResidents();
    });
  }

  void _fetchResidents() {
    context.read<ResidentListBloc>().add(
      FetchResidents(orgId: authentication.profile?.orgId ?? ''),
    );
  }

  void _onSearchChanged(String query) {
    _debounceTimer?.cancel();

    _debounceTimer = Timer(_debounceDuration, () {
      if (!mounted) return;

      context.read<ResidentListBloc>().add(
        SearchResidents(
          orgId: authentication.profile?.orgId ?? '',
          searchQuery: query.trim(),
        ),
      );
    });
  }

  void _retry() {
    final query = _searchController.text.trim();

    if (query.isEmpty) {
      _fetchResidents();
      return;
    }

    context.read<ResidentListBloc>().add(
      SearchResidents(
        orgId: authentication.profile?.orgId ?? '',
        searchQuery: query,
      ),
    );
  }

  void _loadMore() {
    context.read<ResidentListBloc>().add(LoadMoreResidents());
  }

  void _onResidentTap(ResidentListResponse resident) {
    if (widget.isSelectionMode) {
      context.pop<Profile>(
        Profile(
          id: resident.profile.id,
          name: resident.profile.name,
          email: resident.profile.email,
          role: resident.profile.role,
        ),
      );

      return;
    }

    context.push(
      RouterPath.residentDetails,
      extra: ResidentDetailsArgs(resident: resident),
    );
  }

  @override
  void dispose() {
    _debounceTimer?.cancel();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: widget.isSelectionMode ? 'Select Resident' : 'Residents',
      ),
      body: Column(
        children: [
          SearchTextField(
            title: 'Search Residents',
            onChanged: _onSearchChanged,
          ),

          const SizedBox(height: AppConsts.pMedium),

          Expanded(
            child: BlocConsumer<ResidentListBloc, ResidentListState>(
              listener: (context, state) {},

              builder: (context, state) {
                if (state is ResidentListInitial ||
                    state is ResidentListLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (state is ResidentListFailed) {
                  return ErrorStateView(
                    retryOnTap: _retry,
                    message: state.message,
                  );
                }

                if (state is ResidentListSuccess) {
                  if (state.residents.isEmpty) {
                    return const EmptyStateView(message: 'No residents found.');
                  }

                  return Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppConsts.pSide,
                          ),
                          itemCount:
                              state.residents.length +
                              (state.hasMore ||
                                      state.isLoadingMore ||
                                      state.loadMoreError != null
                                  ? 1
                                  : 0),
                          itemBuilder: (context, index) {
                            // Load more section
                            if (index == state.residents.length) {
                              if (state.isLoadingMore) {
                                return const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 16),
                                  child: Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                );
                              }

                              return LoadMoreButton(
                                onTap: _loadMore,
                                isError: state.loadMoreError != null,
                              );
                            }

                            final resident = state.residents[index];

                            return GestureDetector(
                              onTap: () => _onResidentTap(resident),
                              child: ResidentCard(
                                resident: resident,
                                index: index,
                              ),
                            );
                          },
                        ),
                      ),
                    ],
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
              title: 'Add Resident',
              onTap: () {
                context.push(
                  RouterPath.signUp,
                  extra: {'type': SignUpType.resident},
                );
              },
            ),
    );
  }
}
