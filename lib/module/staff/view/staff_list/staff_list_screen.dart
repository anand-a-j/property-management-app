import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:naseem/core/enum/sign_up_type.dart';
import 'package:naseem/core/utils/snackbar_manager.dart';

import '../../../../core/core.dart';
import '../../../../core/widgets/empty_state_view.dart';
import '../../../../core/widgets/error_state_view.dart';
import '../../../../core/widgets/more_options/more_option_item.dart';
import '../../../../core/widgets/more_options/more_options_sheet.dart';
import '../../../../routes/args/edit_profile_args.dart';
import '../../../../routes/router_path.dart';
import '../../../auth/core/controller/service/auth_service.dart';
import '../../../auth/profile/bloc/profile_bloc.dart';
import '../../controller/stafff_bloc/staff_bloc.dart';
import 'widgets/staff_card.dart';

class StaffListScreen extends StatefulWidget {
  const StaffListScreen({super.key, required this.isSelectionMode});

  final bool isSelectionMode;

  @override
  State<StaffListScreen> createState() => _StaffListScreenState();
}

class _StaffListScreenState extends State<StaffListScreen> {
  Timer? _debounce;

  String _searchQuery = '';

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
        searchQuery: _searchQuery,
      ),
    );
  }

  void _onSearchChanged(String query) {
    _searchQuery = query;

    _debounce?.cancel();

    _debounce = Timer(const Duration(milliseconds: 400), () {
      if (!mounted) return;
      _fetchStaffs();
    });
  }

  void _retry() {
    _fetchStaffs();
  }

  @override
  void initState() {
    super.initState();
    _fetchStaffs();
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileBloc, ProfileState>(
      listener: (context, state) {
        if (state is ProfileSuccess) {
          _retry();
        } else if (state is ProfileFailed) {
          Snack.error(state.message);
        }
      },
      child: ColoredBox(
        color: context.onPrimary,
        child: SafeArea(
          child: Scaffold(
            appBar: CustomAppBar(
              title: 'Staffs',
              leadingOnTap: () => context.pop(),
            ),
            body: Column(
              children: [
                SearchTextField(
                  title: 'Search Staffs',
                  onChanged: _onSearchChanged,
                ),

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
                                  return;
                                }

                                // MoreOptionsBottomSheet.show(
                                //   context: context,
                                //   items: [
                                //     // EDIT STAFF
                                //     MoreOptionItem(
                                //       title: 'Edit Staff',
                                //       icon: Icons.edit_outlined,
                                //       onTap: () {
                                //         context.push(
                                //           RouterPath.editProfile,
                                //           extra: EditProfileArgs(
                                //             role: staff.role,
                                //             initialName: staff.name,
                                //             initialPhone: staff.phone,
                                //             initialEmail: staff.email,
                                //             id: staff.id,
                                //           ),
                                //         );
                                //       },
                                //     ),

                                //     // DELETE STAFF
                                //     MoreOptionItem(
                                //       title: 'Delete Staff',
                                //       icon: Icons.delete_outline_rounded,
                                //       isDestructive: true,
                                //       confirmTitle: 'Delete Staff?',
                                //       confirmMessage:
                                //           'Are you sure you want to delete ${staff.name}?',
                                //       onTap: () {
                                //         context.read<ProfileBloc>().add(
                                //           DeleteManagedUserEvent(
                                //             userId: staff.id,
                                //           ),
                                //         );
                                //       },
                                //     ),
                                //   ],
                                // );
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
          ),
        ),
      ),
    );
  }
}
